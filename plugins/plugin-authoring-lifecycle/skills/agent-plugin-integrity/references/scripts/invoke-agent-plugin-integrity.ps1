[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$RootPath,

    [Parameter(Mandatory = $true)]
    [string[]]$IncludePatterns,

    [string[]]$ExcludePatterns = @(),

    [Parameter(Mandatory = $true)]
    [string]$PluginId,

    [Parameter(Mandatory = $true)]
    [string]$PluginVersion,

    [Parameter(Mandatory = $true)]
    [string]$SourceCommit,

    [Parameter(Mandatory = $true)]
    [string]$OutputManifestPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-CanonicalRelativePath {
    param(
        [Parameter(Mandatory = $true)]
        [string]$BasePath,
        [Parameter(Mandatory = $true)]
        [string]$TargetPath
    )

    $baseFull = [System.IO.Path]::GetFullPath($BasePath)
    $targetFull = [System.IO.Path]::GetFullPath($TargetPath)

    $baseUri = [System.Uri]($baseFull.TrimEnd('\\') + [System.IO.Path]::DirectorySeparatorChar)
    $targetUri = [System.Uri]$targetFull
    $relative = $baseUri.MakeRelativeUri($targetUri).ToString()
    return [System.Uri]::UnescapeDataString($relative).Replace('\\', '/')
}

function Test-IsExcluded {
    param(
        [Parameter(Mandatory = $true)]
        [string]$RelativePath,
        [string[]]$Patterns = @()
    )

    if ($null -eq $Patterns -or $Patterns.Count -eq 0) {
        return $false
    }

    foreach ($pattern in $Patterns) {
        if ($RelativePath -like $pattern) {
            return $true
        }
    }

    return $false
}

$rootFullPath = [System.IO.Path]::GetFullPath($RootPath)
if (-not (Test-Path -LiteralPath $rootFullPath -PathType Container)) {
    throw "RootPath not found: $rootFullPath"
}

$resolvedFiles = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::OrdinalIgnoreCase)

foreach ($pattern in $IncludePatterns) {
    Get-ChildItem -Path $rootFullPath -Recurse -File -Include $pattern | ForEach-Object {
        [void]$resolvedFiles.Add($_.FullName)
    }
}

$entries = @()
foreach ($fullFilePath in $resolvedFiles) {
    $relativePath = Get-CanonicalRelativePath -BasePath $rootFullPath -TargetPath $fullFilePath

    if (Test-IsExcluded -RelativePath $relativePath -Patterns $ExcludePatterns) {
        continue
    }

    $hash = Get-FileHash -Algorithm SHA256 -LiteralPath $fullFilePath
    $entries += [PSCustomObject]@{
        path = $relativePath
        sha256 = $hash.Hash.ToLowerInvariant()
    }
}

if ($entries.Count -eq 0) {
    throw 'No files matched include and exclude criteria.'
}

$sortedEntries = $entries | Sort-Object -Property path

$canonicalLines = @()
foreach ($entry in $sortedEntries) {
    $canonicalLines += "{0}:{1}" -f $entry.path, $entry.sha256
}

$joinedCanonical = ($canonicalLines -join "`n")
$aggregateBytes = [System.Text.Encoding]::UTF8.GetBytes($joinedCanonical)
$aggregateHashBytes = [System.Security.Cryptography.SHA256]::Create().ComputeHash($aggregateBytes)
$aggregateDigest = -join ($aggregateHashBytes | ForEach-Object { $_.ToString('x2') })

$manifest = [PSCustomObject]@{
    pluginId = $PluginId
    pluginVersion = $PluginVersion
    sourceCommit = $SourceCommit
    digestAlgorithm = 'SHA-256'
    generatedAtUtc = [DateTime]::UtcNow.ToString('o')
    artifactEntries = $sortedEntries
    aggregateDigest = $aggregateDigest
}

$outputDir = Split-Path -Parent $OutputManifestPath
if (-not [string]::IsNullOrWhiteSpace($outputDir) -and -not (Test-Path -LiteralPath $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

$manifest | ConvertTo-Json -Depth 6 | Out-File -LiteralPath $OutputManifestPath -Encoding utf8
Write-Output "Manifest written to $OutputManifestPath"
