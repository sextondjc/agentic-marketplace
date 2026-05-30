[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$DocsRoot = '.docs',

    [Parameter()]
    [bool]$IncludeRefSnapshots = $true,

    [Parameter()]
    [bool]$IncludeLegacyReviewDirs = $true,

    [Parameter()]
    [bool]$IncludeDuplicateChecklists = $true
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-MarkdownFile {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$RootPath
    )

    if (-not (Test-Path -LiteralPath $RootPath)) {
        return @()
    }

    return Get-ChildItem -LiteralPath $RootPath -Recurse -File -Filter '*.md'
}

function Get-RelativePath {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$BasePath,
        [Parameter(Mandatory = $true)]
        [string]$TargetPath
    )

    $baseResolved = (Resolve-Path -LiteralPath $BasePath).Path
    $targetResolved = (Resolve-Path -LiteralPath $TargetPath).Path
    $baseUri = [System.Uri]::new(($baseResolved.TrimEnd('\\') + '\\'))
    $targetUri = [System.Uri]::new($targetResolved)

    return [System.Uri]::UnescapeDataString($baseUri.MakeRelativeUri($targetUri).ToString()).Replace('/', '/')
}

function Get-ReferenceCount {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$WorkspaceRoot,
        [Parameter(Mandatory = $true)]
        [string]$CandidatePath,
        [Parameter(Mandatory = $true)]
        [System.IO.FileInfo[]]$MarkdownFiles
    )

    $relative = Get-RelativePath -BasePath $WorkspaceRoot -TargetPath $CandidatePath
    $fileName = [System.IO.Path]::GetFileName($CandidatePath)

    $hits = 0
    foreach ($file in $MarkdownFiles) {
        if ($file.FullName -eq $CandidatePath) {
            continue
        }

        $content = Get-Content -LiteralPath $file.FullName -Raw
        if ($content -match [Regex]::Escape($relative) -or $content -match [Regex]::Escape($fileName)) {
            $hits += 1
        }
    }

    return $hits
}

function ConvertTo-Candidate {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$WorkspaceRoot,
        [Parameter(Mandatory = $true)]
        [string]$Path,
        [Parameter(Mandatory = $true)]
        [string]$Category,
        [Parameter(Mandatory = $true)]
        [string]$Reason,
        [Parameter(Mandatory = $true)]
        [System.IO.FileInfo[]]$MarkdownFiles
    )

    $referenceCount = Get-ReferenceCount -WorkspaceRoot $WorkspaceRoot -CandidatePath $Path -MarkdownFiles $MarkdownFiles

    $suggestedAction = 'keep'
    $confidence = 'medium'

    if ($referenceCount -eq 0 -and $Category -in @('generated-ref-snapshot', 'duplicate-checklist', 'legacy-review-directory')) {
        $suggestedAction = 'archive-candidate'
        $confidence = 'high'
    }
    elseif ($referenceCount -gt 0 -and $Category -eq 'duplicate-checklist') {
        $suggestedAction = 'keep-one-archive-rest'
        $confidence = 'medium'
    }

    [PSCustomObject]@{
        Path = Get-RelativePath -BasePath $WorkspaceRoot -TargetPath $Path
        Category = $Category
        ReferenceCount = $referenceCount
        Confidence = $confidence
        SuggestedAction = $suggestedAction
        Reason = $Reason
    }
}

$scriptWorkspaceRoot = (Resolve-Path -LiteralPath (Join-Path -Path $PSScriptRoot -ChildPath '..\..\..\..\..')).Path
$candidateWorkspaceRoots = @((Get-Location).Path, $scriptWorkspaceRoot)

$workspaceRoot = $null
foreach ($candidateRoot in $candidateWorkspaceRoots) {
    $candidateDocsPath = Join-Path -Path $candidateRoot -ChildPath $DocsRoot
    if (Test-Path -LiteralPath $candidateDocsPath) {
        $workspaceRoot = $candidateRoot
        break
    }
}

if (-not $workspaceRoot) {
    throw "Could not resolve docs root '$DocsRoot' from current directory or script-relative workspace path."
}

$docsPath = Join-Path -Path $workspaceRoot -ChildPath $DocsRoot

$markdownFiles = Get-MarkdownFile -RootPath $workspaceRoot
$candidates = New-Object System.Collections.Generic.List[object]

if ($IncludeRefSnapshots) {
    $refFiles = Get-ChildItem -LiteralPath $docsPath -Recurse -File -Filter '*.ref.md' -ErrorAction SilentlyContinue
    foreach ($file in $refFiles) {
        $candidates.Add((ConvertTo-Candidate -WorkspaceRoot $workspaceRoot -Path $file.FullName -Category 'generated-ref-snapshot' -Reason 'Generated snapshot from reference inventory flow; often superseded after taxonomy or naming migrations.' -MarkdownFiles $markdownFiles))
    }
}

if ($IncludeDuplicateChecklists) {
    $checklistFiles = @(Get-ChildItem -LiteralPath (Join-Path -Path $docsPath -ChildPath 'changes/customization-renames') -File -Filter '*execution-checklist*.md' -ErrorAction SilentlyContinue)
    if ($checklistFiles.Count -gt 1) {
        foreach ($file in $checklistFiles) {
            $candidates.Add((ConvertTo-Candidate -WorkspaceRoot $workspaceRoot -Path $file.FullName -Category 'duplicate-checklist' -Reason 'Multiple execution checklist variants detected for same rename batch; one canonical file is usually sufficient.' -MarkdownFiles $markdownFiles))
        }
    }
}

if ($IncludeLegacyReviewDirs) {
    $renameLedger = Join-Path -Path $docsPath -ChildPath 'changes/customization-renames/rename-history.md'
    $reviewRoot = Join-Path -Path $docsPath -ChildPath 'changes/skill-reviews'

    if ((Test-Path -LiteralPath $renameLedger) -and (Test-Path -LiteralPath $reviewRoot)) {
        $lines = Get-Content -LiteralPath $renameLedger
        $pairs = foreach ($line in $lines) {
            if ($line -match '^\|\s*\d{4}-\d{2}-\d{2}\s*\|.*\|\s*skill\s*\|\s*([^|]+)\|\s*([^|]+)\|\s*Applied\s*\|') {
                [PSCustomObject]@{
                    OldName = $matches[1].Trim()
                    NewName = $matches[2].Trim()
                }
            }
        }

        foreach ($pair in $pairs) {
            $oldDir = Join-Path -Path $reviewRoot -ChildPath $pair.OldName
            $newDir = Join-Path -Path $reviewRoot -ChildPath $pair.NewName

            if ((Test-Path -LiteralPath $oldDir) -and (Test-Path -LiteralPath $newDir)) {
                $oldFiles = Get-ChildItem -LiteralPath $oldDir -Recurse -File -Filter '*.md' -ErrorAction SilentlyContinue
                foreach ($file in $oldFiles) {
                    $candidates.Add((ConvertTo-Candidate -WorkspaceRoot $workspaceRoot -Path $file.FullName -Category 'legacy-review-directory' -Reason "Legacy review directory matches applied rename from '$($pair.OldName)' to '$($pair.NewName)'." -MarkdownFiles $markdownFiles))
                }
            }
        }
    }
}

$candidates |
    Sort-Object Category, Path

