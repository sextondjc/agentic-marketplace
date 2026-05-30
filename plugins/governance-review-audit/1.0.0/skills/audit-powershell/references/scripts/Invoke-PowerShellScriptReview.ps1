[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$RootPath = (Get-Location).Path,

    [Parameter()]
    [ValidateSet('Error', 'Warning', 'Information')]
    [string]$MinimumSeverity = 'Warning',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ReportDirectory,

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ReportBaseName = 'audit-powershell',

    [Parameter()]
    [datetime]$ReviewDate = (Get-Date),

    [Parameter()]
    [switch]$NoClobber,

    [Parameter()]
    [switch]$SuppressOutput,

    [Parameter()]
    [bool]$WriteLatest = $true,

    [Parameter()]
    [bool]$WriteReport = $true
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Test-Path -Path $RootPath -PathType Container)) {
    throw "Root path '$RootPath' does not exist or is not a directory."
}

if ([string]::IsNullOrWhiteSpace($ReportDirectory)) {
    $ReportDirectory = Join-Path -Path $RootPath -ChildPath '.docs/changes/audit-powershell-reviews'
}

$severityRank = @{
    Error = 3
    Warning = 2
    Information = 1
}

$filePatterns = @('*.ps1', '*.psm1')
$files = foreach ($pattern in $filePatterns) {
    Get-ChildItem -Path $RootPath -Recurse -File -Filter $pattern
}

$files = $files | Sort-Object -Property FullName -Unique

$findings = [System.Collections.Generic.List[object]]::new()

function Get-StatusRecord {
    param(
        [string]$Rule,
        [string]$Message,
        [string]$Recommendation
    )

    return [pscustomobject]@{
        File           = ''
        Line           = 0
        Severity       = 'Information'
        Rule           = $Rule
        Message        = $Message
        Recommendation = $Recommendation
        Source         = 'ReviewScript'
        RecordType     = 'Status'
    }
}

function Get-FindingRecord {
    param(
        [string]$File,
        [int]$Line,
        [string]$Severity,
        [string]$Rule,
        [string]$Message,
        [string]$Recommendation,
        [string]$Source
    )

    return [pscustomobject]@{
        File           = $File
        Line           = $Line
        Severity       = $Severity
        Rule           = $Rule
        Message        = $Message
        Recommendation = $Recommendation
        Source         = $Source
        RecordType     = 'Finding'
    }
}

if (-not $files) {
    $findings.Add((Get-StatusRecord -Rule 'NoPowerShellFilesFound' -Message 'No PowerShell scripts were found in the review scope.' -Recommendation 'Confirm review scope path and file extensions.'))
}

$pssaAvailable = [bool](Get-Module -ListAvailable -Name PSScriptAnalyzer)
if ($pssaAvailable -and $files) {
    Import-Module PSScriptAnalyzer -ErrorAction Stop | Out-Null

    foreach ($file in $files) {
        $results = Invoke-ScriptAnalyzer -Path $file.FullName -Severity @('Error', 'Warning', 'Information')
        foreach ($result in $results) {
            $findings.Add((Get-FindingRecord -File $file.FullName -Line ([int]$result.Line) -Severity $result.Severity.ToString() -Rule $result.RuleName -Message $result.Message -Recommendation "Address rule '$($result.RuleName)' in alignment with workspace PowerShell instructions." -Source 'PSScriptAnalyzer'))
        }
    }
} elseif (-not $pssaAvailable) {
    $findings.Add((Get-StatusRecord -Rule 'PSScriptAnalyzerNotInstalled' -Message 'PSScriptAnalyzer module is not available.' -Recommendation 'Install-Module PSScriptAnalyzer -Scope CurrentUser, then rerun this review for richer findings.'))
}

$commandRules = @{
    'Write-Host' = [pscustomobject]@{
        Rule = 'AvoidWriteHost'
        Severity = 'Warning'
        Message = 'Write-Host is not automation-friendly for data output.'
        Recommendation = 'Return structured objects or use Write-Verbose for diagnostics.'
    }
    'Read-Host' = [pscustomobject]@{
        Rule = 'AvoidReadHostInAutomation'
        Severity = 'Warning'
        Message = 'Read-Host introduces interactive prompts that break unattended automation.'
        Recommendation = 'Use parameters with validation attributes instead of interactive input.'
    }
    'Invoke-Expression' = [pscustomobject]@{
        Rule = 'AvoidInvokeExpression'
        Severity = 'Error'
        Message = 'Invoke-Expression/iex can execute untrusted content and increases security risk.'
        Recommendation = 'Use direct command invocation and explicit argument handling.'
    }
    'iex' = [pscustomobject]@{
        Rule = 'AvoidInvokeExpression'
        Severity = 'Error'
        Message = 'Invoke-Expression/iex can execute untrusted content and increases security risk.'
        Recommendation = 'Use direct command invocation and explicit argument handling.'
    }
}

$aliasCommands = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
@('gci', 'ls', 'dir', 'cat', 'echo', 'where', 'select', 'sort', 'sleep') | ForEach-Object {
    [void]$aliasCommands.Add($_)
}

foreach ($file in $files) {
    $parseErrors = $null
    $tokens = [System.Management.Automation.PSParser]::Tokenize((Get-Content -Path $file.FullName -Raw), [ref]$parseErrors)

    foreach ($parseError in $parseErrors) {
    $line = if ($parseError.Token) { [int]$parseError.Token.StartLine } else { 0 }
    $findings.Add((Get-FindingRecord -File $file.FullName -Line $line -Severity 'Warning' -Rule 'ParserError' -Message $parseError.Message -Recommendation 'Fix parser errors before automation use; rerun review after correction.' -Source 'Heuristic'))
    }

    foreach ($token in $tokens) {
        if ($token.Type -ne 'Command') {
            continue
        }

        $commandName = $token.Content
        if ($commandRules.ContainsKey($commandName)) {
            $rule = $commandRules[$commandName]
            $findings.Add((Get-FindingRecord -File $file.FullName -Line ([int]$token.StartLine) -Severity $rule.Severity -Rule $rule.Rule -Message $rule.Message -Recommendation $rule.Recommendation -Source 'Heuristic'))
            continue
        }

        if ($aliasCommands.Contains($commandName)) {
            $findings.Add((Get-FindingRecord -File $file.FullName -Line ([int]$token.StartLine) -Severity 'Information' -Rule 'PreferFullCmdletNames' -Message 'Alias usage reduces script clarity and maintainability.' -Recommendation 'Replace aliases with full cmdlet names and full parameter names.' -Source 'Heuristic'))
        }
    }
}

$minimumRank = $severityRank[$MinimumSeverity]
$filtered = $findings | Where-Object {
    $_.RecordType -eq 'Status' -or $severityRank[$_.Severity] -ge $minimumRank
}

if (-not $filtered) {
    $filtered = @(
        Get-StatusRecord -Rule 'NoFindingsAtSeverityOrHigher' -Message "No findings at severity '$MinimumSeverity' or higher." -Recommendation 'Optionally rerun with -MinimumSeverity Information for a broader review.'
    )
}

$workspaceRoot = [System.IO.Path]::GetFullPath($RootPath)

$outputRecords = $filtered |
    ForEach-Object {
        $fileValue = $_.File
        if (-not [string]::IsNullOrWhiteSpace($fileValue)) {
            $fullFilePath = [System.IO.Path]::GetFullPath($fileValue)
            if ($fullFilePath.StartsWith($workspaceRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
                $relativePath = $fullFilePath.Substring($workspaceRoot.Length).TrimStart('\', '/')
                if (-not [string]::IsNullOrWhiteSpace($relativePath)) {
                    $fileValue = $relativePath -replace '\\', '/'
                }
            }
        }

        [pscustomobject]@{
            File           = $fileValue
            Line           = $_.Line
            Severity       = $_.Severity
            Rule           = $_.Rule
            Message        = $_.Message
            Recommendation = $_.Recommendation
            Source         = $_.Source
            RecordType     = $_.RecordType
        }
    } |
    Sort-Object -Property @{ Expression = { $severityRank[$_.Severity] }; Descending = $true }, File, Line, Rule |
    Select-Object File, Line, Severity, Rule, Message, Recommendation, Source, RecordType

$errorCount = @($outputRecords | Where-Object { $_.Severity -eq 'Error' -and $_.RecordType -eq 'Finding' }).Count
$warningCount = @($outputRecords | Where-Object { $_.Severity -eq 'Warning' -and $_.RecordType -eq 'Finding' }).Count
$informationCount = @($outputRecords | Where-Object { $_.Severity -eq 'Information' -and $_.RecordType -eq 'Finding' }).Count

$reportPayload = [pscustomobject]@{
    SchemaVersion    = '1.0'
    GeneratedAtUtc   = (Get-Date).ToUniversalTime().ToString('o')
    RootPath         = $workspaceRoot
    MinimumSeverity  = $MinimumSeverity
    FilesScanned     = @($files).Count
    FindingsReturned = @($outputRecords).Count
    SeverityCounts   = [pscustomobject]@{
        Error       = $errorCount
        Warning     = $warningCount
        Information = $informationCount
    }
    Findings         = @($outputRecords)
}

if ($WriteReport) {
    if (-not (Test-Path -Path $ReportDirectory -PathType Container)) {
        New-Item -Path $ReportDirectory -ItemType Directory -Force | Out-Null
    }

    $dateStamp = $ReviewDate.ToString('yyyyMMdd')
    $baseName = "$dateStamp-$ReportBaseName"
    $reportPath = Join-Path -Path $ReportDirectory -ChildPath "$baseName.md"
    if ($NoClobber -and (Test-Path -Path $reportPath)) {
        throw "Report already exists and NoClobber was set: $reportPath"
    }

    $markdownLines = [System.Collections.Generic.List[string]]::new()
    $markdownLines.Add("# PowerShell Script Review - $dateStamp")
    $markdownLines.Add('')
    $markdownLines.Add("- GeneratedAtUtc: $($reportPayload.GeneratedAtUtc)")
    $markdownLines.Add("- RootPath: $($reportPayload.RootPath)")
    $markdownLines.Add("- MinimumSeverity: $($reportPayload.MinimumSeverity)")
    $markdownLines.Add("- FilesScanned: $($reportPayload.FilesScanned)")
    $markdownLines.Add("- FindingsReturned: $($reportPayload.FindingsReturned)")
    $markdownLines.Add('')
    $markdownLines.Add('| Severity | Count |')
    $markdownLines.Add('|---|---|')
    $markdownLines.Add("| Error | $errorCount |")
    $markdownLines.Add("| Warning | $warningCount |")
    $markdownLines.Add("| Information | $informationCount |")
    $markdownLines.Add('')
    $markdownLines.Add('| File | Line | Severity | Rule | Message | Recommendation | Source | RecordType |')
    $markdownLines.Add('|---|---:|---|---|---|---|---|---|')

    foreach ($record in $outputRecords) {
        $safeFile = ($record.File -replace '\|', '\\|')
        $safeMessage = ($record.Message -replace '\|', '\\|')
        $safeRecommendation = ($record.Recommendation -replace '\|', '\\|')
        $markdownLines.Add("| $safeFile | $($record.Line) | $($record.Severity) | $($record.Rule) | $safeMessage | $safeRecommendation | $($record.Source) | $($record.RecordType) |")
    }

    $markdownLines | Set-Content -Path $reportPath -Encoding UTF8

    if ($WriteLatest) {
        $latestReportPath = Join-Path -Path $ReportDirectory -ChildPath "latest-$ReportBaseName.md"
        Copy-Item -Path $reportPath -Destination $latestReportPath -Force
    }
}

if (-not $SuppressOutput) {
    $outputRecords
}

