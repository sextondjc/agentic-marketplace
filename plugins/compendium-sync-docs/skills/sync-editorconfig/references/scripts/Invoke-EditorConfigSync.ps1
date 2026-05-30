[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter()]
    [string]$WorkspaceRoot = (Get-Location).Path,

    [Parameter()]
    [switch]$ValidateOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-EditorConfigContent {
    @"
root = true

# Workspace-wide defaults
[*]
charset = utf-8
end_of_line = crlf
insert_final_newline = true
trim_trailing_whitespace = true

# C# policy alignment
[*.cs]
# Keep imports centralized in Usings.cs; any strays are treated as build-breaking when analyzers can flag them.
csharp_using_directive_placement = outside_namespace:error

# Enforce one top-level type per file (nested types are allowed).
dotnet_diagnostic.SA1402.severity = error

# Treat unnecessary imports as errors to keep Usings.cs curated.
dotnet_diagnostic.IDE0005.severity = error

# Prefer and enforce file-scoped namespaces for consistency.
csharp_style_namespace_declarations = file_scoped:error

# Keep usings sorted and separated consistently when present.
dotnet_sort_system_directives_first = true
dotnet_separate_import_directive_groups = false

# Usings.cs is the canonical location for import directives.
[Usings.cs]
# Use global import directives in this file.
csharp_using_directive_placement = outside_namespace:error
"@
}

function Remove-InlineComment {
    param([string]$Line)

    $idx = $Line.IndexOf('//')
    if ($idx -ge 0) {
        return $Line.Substring(0, $idx)
    }

    return $Line
}

function Get-TopLevelTypeCount {
    param([string]$FilePath)

    $lines = Get-Content -LiteralPath $FilePath
    $braceDepth = 0
    $typeCount = 0
    $inBlockComment = $false

    $typePattern = '^(?:\s*\[[^\]]+\]\s*)*\s*(?:(?:public|internal|private|protected|sealed|abstract|static|partial|readonly|file|new)\s+)*(?:class|record|struct|interface|enum|delegate)\s+[A-Za-z_]\w*'

    foreach ($line in $lines) {
        $work = $line

        if ($inBlockComment) {
            $endIdx = $work.IndexOf('*/')
            if ($endIdx -lt 0) {
                continue
            }

            $work = $work.Substring($endIdx + 2)
            $inBlockComment = $false
        }

        while ($true) {
            $startIdx = $work.IndexOf('/*')
            if ($startIdx -lt 0) {
                break
            }

            $endIdx = $work.IndexOf('*/', $startIdx + 2)
            if ($endIdx -lt 0) {
                $work = $work.Substring(0, $startIdx)
                $inBlockComment = $true
                break
            }

            $left = $work.Substring(0, $startIdx)
            $right = $work.Substring($endIdx + 2)
            $work = $left + ' ' + $right
        }

        if ([string]::IsNullOrWhiteSpace($work)) {
            continue
        }

        $work = Remove-InlineComment -Line $work
        if ([string]::IsNullOrWhiteSpace($work)) {
            continue
        }

        if ($work -match $typePattern) {
            if ($braceDepth -le 1) {
                $typeCount++
            }
        }

        $opens = ([regex]::Matches($work, '\{')).Count
        $closes = ([regex]::Matches($work, '\}')).Count
        $braceDepth = [Math]::Max(0, $braceDepth + $opens - $closes)
    }

    return $typeCount
}

function Test-CSharpPolicy {
    param([string]$Root)

    $violations = New-Object System.Collections.Generic.List[string]

    $projects = @(Get-ChildItem -Path $Root -Recurse -Filter *.csproj -File)
    foreach ($project in $projects) {
        $projectDir = $project.DirectoryName
        $csFiles = @(Get-ChildItem -Path $projectDir -Recurse -Filter *.cs -File |
            Where-Object {
                $_.FullName -notmatch '\\bin\\' -and
                $_.FullName -notmatch '\\obj\\'
            })

        if ($csFiles.Count -gt 1) {
            $usingsPath = Join-Path -Path $projectDir -ChildPath 'Usings.cs'
            if (-not (Test-Path -LiteralPath $usingsPath)) {
                $violations.Add("Missing Usings.cs in project: $($project.FullName)")
            }
        }

        foreach ($file in $csFiles) {
            $isUsingsFile = [string]::Equals($file.Name, 'Usings.cs', [System.StringComparison]::OrdinalIgnoreCase)
            $content = Get-Content -LiteralPath $file.FullName

            if ([string]::Equals($file.Name, 'Program.cs', [System.StringComparison]::OrdinalIgnoreCase)) {
                $inlineMinimalApiMappings = @($content | Where-Object {
                    $_ -match '\.Map(Get|Post|Put|Delete|Patch|Methods|Group)\s*\('
                })

                if ($inlineMinimalApiMappings.Count -gt 0) {
                    $violations.Add("Inline Minimal API route mappings are not allowed in Program.cs: $($file.FullName)")
                }
            }

            if (-not $isUsingsFile) {
                $importDirectives = @($content | Where-Object {
                    $_ -match '^\s*using\s+(?!var\b)(?!\()(?:(?:static\s+)?[A-Za-z_][\w\.]*|[A-Za-z_][\w\.]*\s*=\s*[^;]+)\s*;\s*$'
                })

                if ($importDirectives.Count -gt 0) {
                    $violations.Add("Import using directives found outside Usings.cs: $($file.FullName)")
                }
            }

            $topLevelTypeCount = Get-TopLevelTypeCount -FilePath $file.FullName
            if ($topLevelTypeCount -gt 1) {
                $violations.Add("Multiple top-level type declarations found in one file: $($file.FullName)")
            }
        }
    }

    return $violations
}

$resolvedRoot = (Resolve-Path -LiteralPath $WorkspaceRoot).Path
$editorConfigPath = Join-Path -Path $resolvedRoot -ChildPath '.editorconfig'
$targetContent = Get-EditorConfigContent

if (-not $ValidateOnly) {
    $currentContent = if (Test-Path -LiteralPath $editorConfigPath) {
        Get-Content -LiteralPath $editorConfigPath -Raw
    }
    else {
        $null
    }

    if ($currentContent -ne $targetContent) {
        if ($PSCmdlet.ShouldProcess($editorConfigPath, 'Write normalized .editorconfig')) {
            Set-Content -LiteralPath $editorConfigPath -Value $targetContent -NoNewline
            Write-Host "Updated $editorConfigPath"
        }
    }
    else {
        Write-Host ".editorconfig already up to date"
    }
}

$violations = @(Test-CSharpPolicy -Root $resolvedRoot)
if ($violations.Count -gt 0) {
    Write-Error ("Policy validation failed:{0}{1}" -f [Environment]::NewLine, ($violations -join [Environment]::NewLine))
}

Write-Host 'C# policy validation passed'
