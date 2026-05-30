[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$WorkspaceRoot = (Join-Path -Path $PSScriptRoot -ChildPath '..\..\..\..\..\..'),

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$SolutionPath = 'Rook.sln',

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$ArtifactsDirectory = '.github/skills/governance-health-overview/references/.artifacts/full-solution-coverage',

    [Parameter()]
    [ValidateRange(0, 100)]
    [double]$LineCoverageThreshold = 45,

    [Parameter()]
    [ValidateRange(0, 100)]
    [double]$BranchCoverageThreshold = 50
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$resolvedWorkspaceRoot = [System.IO.Path]::GetFullPath((Resolve-Path -Path $WorkspaceRoot).Path)
$resolvedSolutionPath = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedWorkspaceRoot -ChildPath $SolutionPath))
$resolvedArtifactsDirectory = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedWorkspaceRoot -ChildPath $ArtifactsDirectory))
$approvedArtifactsRoot = [System.IO.Path]::GetFullPath((Join-Path -Path $resolvedWorkspaceRoot -ChildPath '.github/skills/governance-health-overview/references/.artifacts'))

if (-not (Test-Path -Path $resolvedSolutionPath)) {
    throw "Solution file not found: $resolvedSolutionPath"
}

if (-not $resolvedArtifactsDirectory.StartsWith($approvedArtifactsRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Artifacts directory must stay under $approvedArtifactsRoot. Resolved path: $resolvedArtifactsDirectory"
}

if ($resolvedArtifactsDirectory.Equals($approvedArtifactsRoot, [System.StringComparison]::OrdinalIgnoreCase) -or
    $resolvedArtifactsDirectory.Equals($resolvedWorkspaceRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Artifacts directory must be a child path under $approvedArtifactsRoot. Resolved path: $resolvedArtifactsDirectory"
}

if (Test-Path -Path $resolvedArtifactsDirectory) {
    Remove-Item -Path $resolvedArtifactsDirectory -Recurse -Force
}

New-Item -Path $resolvedArtifactsDirectory -ItemType Directory | Out-Null

$restoreOutput = @()
$buildOutput = @()
$testOutput = @()

Push-Location -Path $resolvedWorkspaceRoot
try {
    $restoreOutput = & dotnet restore $resolvedSolutionPath --nologo 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "dotnet restore failed."
    }

    $buildOutput = & dotnet build $resolvedSolutionPath --configuration Release --nologo /warnaserror 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "dotnet build failed."
    }

    $testOutput = & dotnet test $resolvedSolutionPath --configuration Release --collect:"XPlat Code Coverage" --results-directory $resolvedArtifactsDirectory --nologo --verbosity minimal 2>&1
    $testExitCode = $LASTEXITCODE
}
finally {
    Pop-Location
}

$logPath = Join-Path -Path $resolvedArtifactsDirectory -ChildPath 'quality-gate.log'
@(
    '=== RESTORE ==='
    $restoreOutput
    '=== BUILD ==='
    $buildOutput
    '=== TEST ==='
    $testOutput
) | Set-Content -Path $logPath

$summaryScriptPath = Join-Path -Path $PSScriptRoot -ChildPath 'get-cobertura-coverage-summary.ps1'
$coverageSummary = & $summaryScriptPath -CoverageRoot $resolvedArtifactsDirectory

$lineCoverageMet = $coverageSummary.LineCoveragePercent -ge $LineCoverageThreshold
$branchCoverageMet = $coverageSummary.BranchCoveragePercent -ge $BranchCoverageThreshold
$qualityGatePassed = ($testExitCode -eq 0) -and $lineCoverageMet -and $branchCoverageMet

$result = [pscustomobject]@{
    WorkspaceRoot = $resolvedWorkspaceRoot
    SolutionPath = $resolvedSolutionPath
    ArtifactsDirectory = $resolvedArtifactsDirectory
    LogPath = $logPath
    TestExitCode = $testExitCode
    TestSucceeded = ($testExitCode -eq 0)
    LineCoveragePercent = $coverageSummary.LineCoveragePercent
    LineCoverageThreshold = $LineCoverageThreshold
    LineCoverageMet = $lineCoverageMet
    BranchCoveragePercent = $coverageSummary.BranchCoveragePercent
    BranchCoverageThreshold = $BranchCoverageThreshold
    BranchCoverageMet = $branchCoverageMet
    CoverageFiles = $coverageSummary.CoverageFiles
    QualityGatePassed = $qualityGatePassed
    RunTimestampUtc = (Get-Date).ToUniversalTime().ToString('yyyy-MM-dd HH:mm:ss UTC')
}

if (-not $qualityGatePassed) {
    throw "Quality gate failed. TestExitCode=$($result.TestExitCode); Line=$($result.LineCoveragePercent)% (threshold $($result.LineCoverageThreshold)%); Branch=$($result.BranchCoveragePercent)% (threshold $($result.BranchCoverageThreshold)%). See $logPath."
}

$result
