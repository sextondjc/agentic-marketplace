[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$CoverageRoot = (Join-Path -Path $PSScriptRoot -ChildPath '..\..\..\..\..\.github\skills\governance-health-overview\references\.artifacts\full-solution-coverage')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$resolvedCoverageRoot = (Resolve-Path -Path $CoverageRoot).Path
$coverageFiles = Get-ChildItem -Path $resolvedCoverageRoot -Recurse -File -Filter 'coverage.cobertura.xml'

if (-not $coverageFiles) {
    throw "No coverage.cobertura.xml files found under $resolvedCoverageRoot"
}

$lineMap = @{}
$branchMap = @{}
$packageLineMap = @{}
$packageBranchMap = @{}

foreach ($file in $coverageFiles) {
    [xml]$coverageXml = Get-Content -Path $file.FullName -Raw

    foreach ($packageNode in $coverageXml.coverage.packages.package) {
        $packageName = [string]$packageNode.name

        foreach ($classNode in $packageNode.classes.class) {
            $fileName = [string]$classNode.filename
            if ([string]::IsNullOrWhiteSpace($fileName)) {
                continue
            }

            foreach ($lineNode in $classNode.lines.line) {
                $lineNumber = [string]$lineNode.number
                if ([string]::IsNullOrWhiteSpace($lineNumber)) {
                    continue
                }

                $globalLineKey = '{0}|{1}|{2}' -f $packageName, $fileName, $lineNumber
                if (-not $lineMap.ContainsKey($globalLineKey)) {
                    $lineMap[$globalLineKey] = @{ Covered = $false }
                }

                if ([int]$lineNode.hits -gt 0) {
                    $lineMap[$globalLineKey].Covered = $true
                }

                $packageLineKey = '{0}|{1}|{2}' -f $packageName, $fileName, $lineNumber
                if (-not $packageLineMap.ContainsKey($packageLineKey)) {
                    $packageLineMap[$packageLineKey] = @{ Package = $packageName; Covered = $false }
                }

                if ([int]$lineNode.hits -gt 0) {
                    $packageLineMap[$packageLineKey].Covered = $true
                }

                if ([string]$lineNode.branch -ne 'True') {
                    continue
                }

                $conditionCoverage = [string]$lineNode.'condition-coverage'
                $coveredConditions = 0
                $validConditions = 0
                $match = [regex]::Match($conditionCoverage, '\((?<covered>\d+)\/(?<valid>\d+)\)')
                if ($match.Success) {
                    $coveredConditions = [int]$match.Groups['covered'].Value
                    $validConditions = [int]$match.Groups['valid'].Value
                }

                $globalBranchKey = $globalLineKey
                if (-not $branchMap.ContainsKey($globalBranchKey)) {
                    $branchMap[$globalBranchKey] = @{ Covered = 0; Valid = 0 }
                }

                if ($validConditions -gt $branchMap[$globalBranchKey].Valid) {
                    $branchMap[$globalBranchKey].Valid = $validConditions
                }

                if ($coveredConditions -gt $branchMap[$globalBranchKey].Covered) {
                    $branchMap[$globalBranchKey].Covered = $coveredConditions
                }

                $packageBranchKey = '{0}|{1}|{2}' -f $packageName, $fileName, $lineNumber
                if (-not $packageBranchMap.ContainsKey($packageBranchKey)) {
                    $packageBranchMap[$packageBranchKey] = @{ Package = $packageName; Covered = 0; Valid = 0 }
                }

                if ($validConditions -gt $packageBranchMap[$packageBranchKey].Valid) {
                    $packageBranchMap[$packageBranchKey].Valid = $validConditions
                }

                if ($coveredConditions -gt $packageBranchMap[$packageBranchKey].Covered) {
                    $packageBranchMap[$packageBranchKey].Covered = $coveredConditions
                }
            }
        }
    }
}

$totalLinesValid = $lineMap.Count
$totalLinesCovered = @($lineMap.Values | Where-Object { $_.Covered }).Count
$totalBranchesValid = ($branchMap.Values | Measure-Object -Property Valid -Sum).Sum
if ($null -eq $totalBranchesValid) {
    $totalBranchesValid = 0
}

$totalBranchesCovered = ($branchMap.Values | Measure-Object -Property Covered -Sum).Sum
if ($null -eq $totalBranchesCovered) {
    $totalBranchesCovered = 0
}

$perPackage = $packageLineMap.GetEnumerator() |
    Group-Object { $_.Value.Package } |
    ForEach-Object {
        $packageName = $_.Name
        $lineEntries = $_.Group | ForEach-Object { $_.Value }
        $lineValid = @($lineEntries).Count
        $lineCovered = @($lineEntries | Where-Object { $_.Covered }).Count

        $branchEntries = $packageBranchMap.GetEnumerator() |
            Where-Object { $_.Value.Package -eq $packageName } |
            ForEach-Object { $_.Value }

        $branchValid = ($branchEntries | Measure-Object -Property Valid -Sum).Sum
        if ($null -eq $branchValid) {
            $branchValid = 0
        }

        $branchCovered = ($branchEntries | Measure-Object -Property Covered -Sum).Sum
        if ($null -eq $branchCovered) {
            $branchCovered = 0
        }

        [pscustomobject]@{
            Package = $packageName
            LinesCovered = $lineCovered
            LinesValid = $lineValid
            LineCoveragePercent = if ($lineValid -eq 0) { 0 } else { [math]::Round(($lineCovered * 100.0) / $lineValid, 2) }
            BranchesCovered = $branchCovered
            BranchesValid = $branchValid
            BranchCoveragePercent = if ($branchValid -eq 0) { 0 } else { [math]::Round(($branchCovered * 100.0) / $branchValid, 2) }
        }
    } |
    Sort-Object Package

[pscustomobject]@{
    CoverageRoot = $resolvedCoverageRoot
    CoverageFiles = $coverageFiles.Count
    LinesCovered = $totalLinesCovered
    LinesValid = $totalLinesValid
    LineCoveragePercent = if ($totalLinesValid -eq 0) { 0 } else { [math]::Round(($totalLinesCovered * 100.0) / $totalLinesValid, 2) }
    BranchesCovered = $totalBranchesCovered
    BranchesValid = $totalBranchesValid
    BranchCoveragePercent = if ($totalBranchesValid -eq 0) { 0 } else { [math]::Round(($totalBranchesCovered * 100.0) / $totalBranchesValid, 2) }
    Packages = $perPackage
}