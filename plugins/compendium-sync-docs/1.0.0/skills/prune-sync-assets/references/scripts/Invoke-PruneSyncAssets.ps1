[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$PlanPath,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$TargetRepoRoot,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$ApprovedRemovals,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$PruneReportPath
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function New-ApprovedSet {
    param([string]$Csv)

    $set = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($id in ($Csv -split ',')) {
        $trimmed = $id.Trim()
        if (-not [string]::IsNullOrWhiteSpace($trimmed)) {
            [void]$set.Add($trimmed)
        }
    }

    return $set
}

function New-Disposition {
    param(
        [string]$ArtifactId,
        [string]$Path,
        [string]$Decision,
        [string]$Reason
    )

    return [PSCustomObject]@{
        artifactId = $ArtifactId
        path       = $Path
        decision   = $Decision
        reason     = $Reason
    }
}

if (-not (Test-Path -LiteralPath $PlanPath)) {
    throw "Plan file not found: $PlanPath"
}

if (-not (Test-Path -LiteralPath $TargetRepoRoot)) {
    throw "Target repository root not found: $TargetRepoRoot"
}

$plan = Get-Content -LiteralPath $PlanPath -Raw | ConvertFrom-Json -Depth 100
if ($null -eq $plan -or $null -eq $plan.actions) {
    throw 'Plan is missing required actions array.'
}

$approvedSet = New-ApprovedSet -Csv $ApprovedRemovals
$targetRootFullPath = [System.IO.Path]::GetFullPath($TargetRepoRoot)
$sourceRepo = [string]$plan.sourceRepo
$dispositions = New-Object System.Collections.Generic.List[object]

foreach ($action in $plan.actions) {
    $artifactId = [string]$action.artifactId
    $relativePath = [string]$action.path

    if ($action.action -ne 'hold' -or $action.reason -ne 'missing-in-source') {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-not-hold' -Reason 'not-removal-candidate'))
        continue
    }

    if ($action.source -eq 'local' -or $action.ownershipMode -eq 'local') {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-protected-local' -Reason 'local-owned'))
        continue
    }

    if (-not [string]::IsNullOrWhiteSpace($action.source) -and $action.source -ne $sourceRepo) {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-protected-external' -Reason 'non-compendium-source'))
        continue
    }

    if ([string]::IsNullOrWhiteSpace($relativePath)) {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-missing-path' -Reason 'missing-path'))
        continue
    }

    if ([System.IO.Path]::IsPathRooted($relativePath)) {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-invalid-path' -Reason 'absolute-path-not-allowed'))
        continue
    }

    if ($relativePath -match '(^|[\\/])\.\.([\\/]|$)') {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-invalid-path' -Reason 'path-traversal-not-allowed'))
        continue
    }

    if (-not $approvedSet.Contains($artifactId)) {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-not-approved' -Reason 'not-in-approved-removals'))
        continue
    }

    $normalizedRelativePath = $relativePath -replace '/', '\\'
    $fullPath = [System.IO.Path]::GetFullPath((Join-Path -Path $targetRootFullPath -ChildPath $normalizedRelativePath))

    if (-not $fullPath.StartsWith($targetRootFullPath, [System.StringComparison]::OrdinalIgnoreCase)) {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-invalid-path' -Reason 'outside-target-root'))
        continue
    }

    if (-not (Test-Path -LiteralPath $fullPath)) {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'skipped-missing-file' -Reason 'path-not-found'))
        continue
    }

    if ($PSCmdlet.ShouldProcess($fullPath, "Remove obsolete synced asset '$artifactId'")) {
        Remove-Item -LiteralPath $fullPath -Recurse -Force
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'removed' -Reason 'approved-removal'))
    }
    else {
        $dispositions.Add((New-Disposition -ArtifactId $artifactId -Path $relativePath -Decision 'preview-remove' -Reason 'whatif'))
    }
}

$summary = [ordered]@{
    removedCount       = @($dispositions | Where-Object { $_.decision -eq 'removed' }).Count
    previewCount       = @($dispositions | Where-Object { $_.decision -eq 'preview-remove' }).Count
    skippedCount       = @($dispositions | Where-Object { $_.decision -like 'skipped-*' }).Count
    totalDispositionCount = $dispositions.Count
}

$report = [PSCustomObject]@{
    planId          = $plan.planId
    requestedAt     = (Get-Date).ToUniversalTime().ToString('o')
    sourceRepo      = $plan.sourceRepo
    sourceVersion   = $plan.sourceVersion
    targetRepoRoot  = $targetRootFullPath
    summary         = $summary
    dispositions    = $dispositions
}

$reportDir = Split-Path -Path $PruneReportPath -Parent
if (-not [string]::IsNullOrWhiteSpace($reportDir) -and -not (Test-Path -LiteralPath $reportDir)) {
    New-Item -Path $reportDir -ItemType Directory -Force | Out-Null
}

$report | ConvertTo-Json -Depth 20 | Set-Content -LiteralPath $PruneReportPath -NoNewline

$dispositions |
    Sort-Object decision, artifactId |
    Format-Table artifactId, decision, reason, path -AutoSize

return $report
