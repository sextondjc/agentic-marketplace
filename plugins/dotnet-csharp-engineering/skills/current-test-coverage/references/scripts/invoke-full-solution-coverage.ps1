[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$WorkspaceRoot = (Join-Path -Path $PSScriptRoot -ChildPath '..\..\..\..\..'),

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$SolutionPath = 'Rook.sln',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ArtifactsDirectory = '.github/skills/governance-health-overview/references/.artifacts/full-solution-coverage',

    [Parameter()]
    [switch]$AllowTestFailures
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$resolvedWorkspaceRoot = [System.IO.Path]::GetFullPath((Resolve-Path -Path $WorkspaceRoot).Path)
$resolvedSolutionPath = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedWorkspaceRoot -ChildPath $SolutionPath))
$resolvedArtifactsDirectory = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedWorkspaceRoot -ChildPath $ArtifactsDirectory))
$approvedArtifactsRoot = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedWorkspaceRoot -ChildPath '.github/skills/governance-health-overview/references/.artifacts'))

if (-not $resolvedArtifactsDirectory.StartsWith($approvedArtifactsRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Artifacts directory must stay under $approvedArtifactsRoot. Resolved path: $resolvedArtifactsDirectory"
}

if ($resolvedArtifactsDirectory.Equals($approvedArtifactsRoot, [System.StringComparison]::OrdinalIgnoreCase) -or
    $resolvedArtifactsDirectory.Equals($resolvedWorkspaceRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Artifacts directory must be a child path under $approvedArtifactsRoot. Resolved path: $resolvedArtifactsDirectory"
}

if (-not (Test-Path -Path $resolvedSolutionPath)) {
    throw "Solution file not found: $resolvedSolutionPath"
}

if (Test-Path -Path $resolvedArtifactsDirectory) {
    Remove-Item -Path $resolvedArtifactsDirectory -Recurse -Force
}

New-Item -Path $resolvedArtifactsDirectory -ItemType Directory | Out-Null

$arguments = @(
    'test'
    $resolvedSolutionPath
    '--collect:XPlat Code Coverage'
    '--results-directory'
    $resolvedArtifactsDirectory
    '--nologo'
    '--verbosity'
    'minimal'
)

$output = @()

Push-Location -Path $resolvedWorkspaceRoot
try {
    $output = & dotnet @arguments 2>&1
    $exitCode = $LASTEXITCODE
}
finally {
    Pop-Location
}

$logPath = Join-Path -Path $resolvedArtifactsDirectory -ChildPath 'full-solution-coverage.log'
$output | Set-Content -Path $logPath

$testSummaryLine = $output | Where-Object { $_ -match '^Test summary:' } | Select-Object -Last 1

$result = [pscustomobject]@{
    WorkspaceRoot = $resolvedWorkspaceRoot
    SolutionPath = $resolvedSolutionPath
    ArtifactsDirectory = $resolvedArtifactsDirectory
    LogPath = $logPath
    ExitCode = $exitCode
    Succeeded = ($exitCode -eq 0)
    TestSummary = $testSummaryLine
    CoverageFiles = @(Get-ChildItem -Path $resolvedArtifactsDirectory -Recurse -Filter 'coverage.cobertura.xml' -File).Count
    RunTimestampUtc = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss UTC')
}

if ($exitCode -ne 0 -and -not $AllowTestFailures) {
    throw "dotnet test failed with exit code $exitCode. See $logPath for details. Use -AllowTestFailures to preserve artifacts and inspect the returned result object."
}

$result