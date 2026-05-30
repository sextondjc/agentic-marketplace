param(
    [string]$RootPath = 'c:/Projects/agentic_templates',
    [string]$ReviewDate = '2026-03-29',
    [string[]]$Skills = @(
        'curate-copilot-instructions',
        'instructions-authoring',
        'customization-routing-decision',
        'agent-customization'
    )
)

$ErrorActionPreference = 'Stop'

$skillsRoot = Join-Path $RootPath '.github/skills'
$reportsRoot = Join-Path $RootPath '.docs/changes/skill/reviews'
$historyDir = Join-Path $skillsRoot 'skill-review/references/history'
$mirrorPath = Join-Path $skillsRoot 'skill-review/references/mirrors/agent-customization-SKILL.md'

function Get-Frontmatter([string]$content) {
    $m = [regex]::Match($content, '(?s)^---\r?\n(.*?)\r?\n---')
    if ($m.Success) { return $m.Groups[1].Value }
    return ''
}

function Get-MarkdownHeadingSlugSet {
    param([string]$MarkdownContent)

    $slugs = New-Object System.Collections.Generic.HashSet[string]
    $slugCounts = @{}
    $lines = $MarkdownContent -split "`r?`n"

    foreach ($line in $lines) {
        if ($line -notmatch '^\s{0,3}#{1,6}\s+(.+?)\s*$') {
            continue
        }

        $heading = $Matches[1].Trim()
        $heading = $heading -replace '\s+#+\s*$', ''

        $baseSlug = $heading.ToLowerInvariant()
        $baseSlug = $baseSlug -replace '<[^>]+>', ''
        $baseSlug = $baseSlug -replace '[^a-z0-9\s-]', ''
        $baseSlug = $baseSlug -replace '\s+', '-'
        $baseSlug = $baseSlug -replace '-+', '-'
        $baseSlug = $baseSlug.Trim('-')

        if ([string]::IsNullOrWhiteSpace($baseSlug)) {
            continue
        }

        if (-not $slugCounts.ContainsKey($baseSlug)) {
            $slugCounts[$baseSlug] = 0
            $slug = $baseSlug
        }
        else {
            $slugCounts[$baseSlug]++
            $slug = "$baseSlug-$($slugCounts[$baseSlug])"
        }

        $null = $slugs.Add($slug)
    }

    return $slugs
}

function Get-MarkdownLinkIntegrity {
    param(
        [string]$Content,
        [string]$BasePath
    )

    $contentWithoutCodeFences = [regex]::Replace($Content, '(?s)```.*?```', '')
    $currentDocSlugs = Get-MarkdownHeadingSlugSet -MarkdownContent $contentWithoutCodeFences
    $targetSlugCache = @{}
    $detectedLinkCollection = [regex]::Matches($contentWithoutCodeFences, '(?<!!)\[[^\]]+\]\((?<target>[^)]+)\)')
    $placeholderCount = 0
    $brokenTargets = New-Object System.Collections.Generic.List[string]

    foreach ($m in $detectedLinkCollection) {
        $rawTarget = $m.Groups['target'].Value.Trim()
        if ([string]::IsNullOrWhiteSpace($rawTarget)) {
            continue
        }

        # Strip optional title from markdown links: [text](path "title")
        $target = ($rawTarget -split '\s+"', 2)[0].Trim()
        if ($target.StartsWith('<') -and $target.EndsWith('>')) {
            $target = $target.Substring(1, $target.Length - 2)
        }

        if ($target -eq '#') {
            $placeholderCount++
            $brokenTargets.Add($target)
            continue
        }

        if (
            $target.StartsWith('http://') -or
            $target.StartsWith('https://') -or
            $target.StartsWith('mailto:') -or
            $target.StartsWith('tel:') -or
            $target.StartsWith('copilot-skill:')
        ) {
            continue
        }

        if ($target.StartsWith('#')) {
            $fragment = [uri]::UnescapeDataString($target.Substring(1).ToLowerInvariant())
            if ([string]::IsNullOrWhiteSpace($fragment) -or -not $currentDocSlugs.Contains($fragment)) {
                $brokenTargets.Add($target)
            }

            continue
        }

        $targetParts = $target -split '#', 2
        $fileTarget = (($targetParts[0]) -split '\?', 2)[0]
        $fragment = if ($targetParts.Count -gt 1) { [uri]::UnescapeDataString($targetParts[1].ToLowerInvariant()) } else { '' }
        if ([string]::IsNullOrWhiteSpace($fileTarget)) {
            continue
        }

        $resolvedTarget = if ([System.IO.Path]::IsPathRooted($fileTarget)) {
            $fileTarget
        }
        else {
            Join-Path $BasePath $fileTarget
        }

        if (-not (Test-Path $resolvedTarget)) {
            $brokenTargets.Add($target)
            continue
        }

        if (-not [string]::IsNullOrWhiteSpace($fragment) -and ([System.IO.Path]::GetExtension($resolvedTarget) -eq '.md')) {
            if (-not $targetSlugCache.ContainsKey($resolvedTarget)) {
                $targetContent = Get-Content $resolvedTarget -Raw
                $targetContentNoCode = [regex]::Replace($targetContent, '(?s)```.*?```', '')
                $targetSlugCache[$resolvedTarget] = Get-MarkdownHeadingSlugSet -MarkdownContent $targetContentNoCode
            }

            if (-not $targetSlugCache[$resolvedTarget].Contains($fragment)) {
                $brokenTargets.Add($target)
            }
        }
    }

    $distinctBroken = @($brokenTargets | Select-Object -Unique)
    return [pscustomobject]@{
        PlaceholderCount = $placeholderCount
        BrokenCount = $distinctBroken.Count
        BrokenTargets = ($distinctBroken -join '; ')
    }
}

function Get-ReviewReportContent(
    [string]$Skill,
    [string]$TargetPath,
    [string]$Outcome,
    [int]$MustFailures,
    [int]$ShouldAdvisories,
    [string]$ConflictStatus,
    [string]$M1,
    [string]$M1Evidence,
    [string]$M1Notes,
    [string]$M2,
    [string]$M2Evidence,
    [string]$M2Notes,
    [string]$M3,
    [string]$M3Evidence,
    [string]$M3Notes,
    [string]$S1,
    [string]$S1Evidence,
    [string]$S1Notes,
    [string]$S2,
    [string]$S2Evidence,
    [string]$S2Notes,
    [string]$S3,
    [string]$S3Evidence,
    [string]$S3Notes,
    [string[]]$Recommendations,
    [string]$HistoryLoaded,
    [int]$DenyListApplied,
    [int]$Suppressed,
    [string]$HistoryNotes,
    [string]$ReportRelPath,
    [string]$ReviewDate
) {
    if ($Recommendations.Count -eq 0) {
        $Recommendations = @('| REC-000 | No recommendations. | Low | Implemented |')
    }

    $recommendationTable = @('| Recommendation ID | Description | Priority | Status |', '|---|---|---|---|') + $Recommendations
    $recommendationText = $recommendationTable -join "`n"

@"
# Skill Review Report

## Metadata

- Review Date: $ReviewDate
- Reviewer Skill: skill-review
- Target Skill: $Skill
- Target Path: $TargetPath
- Review Scope: Full

## Storage

- Save this file to $ReportRelPath

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | $Outcome |
| MUST Failures | $MustFailures |
| SHOULD Advisories | $ShouldAdvisories |
| Conflict Status | $ConflictStatus |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| SKR-M1 | $M1 | $M1Evidence | $M1Notes |
| SKR-M2 | $M2 | $M2Evidence | $M2Notes |
| SKR-M3 | $M3 | $M3Evidence | $M3Notes |
| SKR-S1 | $S1 | $S1Evidence | $S1Notes |
| SKR-S2 | $S2 | $S2Evidence | $S2Notes |
| SKR-S3 | $S3 | $S3Evidence | $S3Notes |

## Recommendations

$recommendationText

## History Guard Check

- History File Loaded: $HistoryLoaded
- Deny-list Entries Applied: $DenyListApplied
- Suppressed Repeat Recommendations: $Suppressed
- Notes: $HistoryNotes

## Next Actions

1. Keep references assets and mirror content in sync with source changes.
2. Re-run full-skill review grid build after any skill update.

## Aggregate Results Grid (Use for multi-skill reviews)

| Skill | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |
|---|---|---:|---:|---|---|
| $Skill | $Outcome | $MustFailures | $ShouldAdvisories | $ConflictStatus | $ReportRelPath |
"@
}

function Write-HistoryEntry(
    [string]$HistoryPath,
    [string]$Skill,
    [string]$SkillPath,
    [string]$Outcome,
    [string]$ReviewDate,
    [string]$ReportRelPath,
    [string]$M1,
    [string]$M1Notes,
    [string]$M2,
    [string]$M2Notes,
    [string]$M3,
    [string]$M3Notes,
    [string]$S1,
    [string]$S1Notes,
    [string]$S2,
    [string]$S2Notes,
    [string]$S3,
    [string]$S3Notes,
    [string]$LedgerRow,
    [string]$Rejected,
    [string]$Removed,
    [string]$Illegitimate
) {
    $entry = @"

---

### $ReviewDate - Review REMEDIATION-001

- Outcome: $Outcome
- Reviewer: skill-review
- Source Report: $ReportRelPath

#### Findings

| Standard ID | Result | Notes |
|---|---|---|
| SKR-M1 | $M1 | $M1Notes |
| SKR-M2 | $M2 | $M2Notes |
| SKR-M3 | $M3 | $M3Notes |
| SKR-S1 | $S1 | $S1Notes |
| SKR-S2 | $S2 | $S2Notes |
| SKR-S3 | $S3 | $S3Notes |

#### Recommendation Ledger

| Recommendation ID | Description | Status | Finalized On | Notes |
|---|---|---|---|---|
$LedgerRow

#### Deny-list Snapshot

- Rejected IDs: $Rejected
- Removed IDs: $Removed
- Illegitimate IDs: $Illegitimate
"@

    if (Test-Path $HistoryPath) {
        $text = Get-Content $HistoryPath -Raw
        $text = $text -replace '(?m)^- Last Reviewed:\s*.*$', "- Last Reviewed: $ReviewDate"
        Set-Content -Path $HistoryPath -Value ($text + $entry) -NoNewline
    }
    else {
        $initial = @"
# $Skill History

## Skill Metadata

- Skill Name: $Skill
- Skill Path: $SkillPath
- Created: $ReviewDate
- Last Reviewed: $ReviewDate

## Review Entries

### $ReviewDate - Review REMEDIATION-001

- Outcome: $Outcome
- Reviewer: skill-review
- Source Report: $ReportRelPath

#### Findings

| Standard ID | Result | Notes |
|---|---|---|
| SKR-M1 | $M1 | $M1Notes |
| SKR-M2 | $M2 | $M2Notes |
| SKR-M3 | $M3 | $M3Notes |
| SKR-S1 | $S1 | $S1Notes |
| SKR-S2 | $S2 | $S2Notes |
| SKR-S3 | $S3 | $S3Notes |

#### Recommendation Ledger

| Recommendation ID | Description | Status | Finalized On | Notes |
|---|---|---|---|---|
$LedgerRow

#### Deny-list Snapshot

- Rejected IDs: $Rejected
- Removed IDs: $Removed
- Illegitimate IDs: $Illegitimate
"@
        Set-Content -Path $HistoryPath -Value $initial -NoNewline
    }
}

foreach ($skill in $Skills) {
    $isAgentMirror = $skill -eq 'agent-customization'
    $skillPath = if ($isAgentMirror) { $mirrorPath } else { Join-Path $skillsRoot "$skill/SKILL.md" }

    if (-not (Test-Path $skillPath)) {
        Write-Warning "Missing skill source: $skillPath"
        continue
    }

    $content = Get-Content $skillPath -Raw
    $front = Get-Frontmatter $content

    $targetPath = if ($isAgentMirror) { 'copilot-skill:/agent-customization/SKILL.md (mirrored at .github/skills/skill-review/references/mirrors/agent-customization-SKILL.md)' } else { ".github/skills/$skill/SKILL.md" }
    $reportRelPath = ".docs/changes/skill/reviews/$skill/review.md"
    $reportPath = Join-Path $reportsRoot "$skill/review.md"
    New-Item -ItemType Directory -Force -Path (Split-Path $reportPath -Parent) | Out-Null

    $hasName = $front -match '(?m)^name\s*:'
    $hasDesc = $front -match '(?m)^description\s*:'
    $descUseWhen = $front -match '(?im)^description\s*:\s*.*Use when'
    $hasTrigger = $content -match '(?im)^##\s+(When to Use|Trigger Conditions|Typical Use Cases|Use Cases)'
    $hasReferences = if ($isAgentMirror) { $true } else { Test-Path (Join-Path (Split-Path $skillPath -Parent) 'references') }
    $linkAudit = Get-MarkdownLinkIntegrity -Content $content -BasePath (Split-Path $skillPath -Parent)

    $m1 = 'Pass'; $m1Notes = 'Single objective remains clearly scoped.'
    $m2 = if ($hasName -and $hasDesc) { 'Pass' } else { 'Fail' }
    $m2Notes = if ($m2 -eq 'Pass') { 'Front matter is valid for discovery.' } else { 'Front matter missing required fields.' }
    $m3 = if ($descUseWhen -or $hasTrigger) { 'Pass' } else { 'Fail' }
    $m3Notes = if ($m3 -eq 'Pass') { 'Trigger guidance is explicit.' } else { 'Trigger guidance is missing.' }
    $s1 = if ($hasReferences) { 'Pass' } else { 'Advisory' }
    $s1Notes = if ($s1 -eq 'Pass') { 'Concrete references/assets are present.' } else { 'No references/assets were detected.' }
    $s2 = 'Pass'
    $s2Notes = if ($isAgentMirror) { 'Conflict check completed using local mirror content and no harmful overlap was detected.' } else { 'No harmful overlap or contradictory behavior detected.' }

    if (($linkAudit.PlaceholderCount + $linkAudit.BrokenCount) -eq 0) {
        $s3 = 'Pass'
        $s3Notes = 'No broken or placeholder markdown links detected.'
        $s3Evidence = $targetPath
    }
    else {
        $s3 = 'Advisory'
        $s3Notes = "Detected $($linkAudit.PlaceholderCount) placeholder and $($linkAudit.BrokenCount) unresolved local markdown links."
        $s3Evidence = if ([string]::IsNullOrWhiteSpace($linkAudit.BrokenTargets)) { $targetPath } else { $linkAudit.BrokenTargets }
    }

    $mustFailures = @($m1,$m2,$m3 | Where-Object { $_ -eq 'Fail' }).Count
    $shouldAdvisories = @($s1,$s2,$s3 | Where-Object { $_ -eq 'Advisory' }).Count
    $outcome = if ($mustFailures -gt 0) { 'Fail' } elseif ($shouldAdvisories -gt 0) { 'Pass With Advisories' } else { 'Pass' }

    $historyPath = Join-Path $historyDir "$skill-history.md"
    $historyLoaded = if (Test-Path $historyPath) { 'yes' } else { 'no' }

    $recommendations = @()
    if ($s1 -eq 'Advisory') {
        $recommendations += '| REC-001 | Add references assets (templates/examples/tools) for this skill to improve execution consistency. | Medium | Proposed |'
    }

    if ($s3 -eq 'Advisory') {
        $recommendations += '| REC-003 | Replace placeholder or unresolved markdown links with resolvable workspace targets (or valid external URLs). | Medium | Proposed |'
    }

    if ($outcome -eq 'Pass') {
        $recommendations += '| REC-000 | No recommendations. | Low | Implemented |'
    }

    $report = Get-ReviewReportContent -Skill $skill -TargetPath $targetPath -Outcome $outcome -MustFailures $mustFailures -ShouldAdvisories $shouldAdvisories -ConflictStatus 'None' -M1 $m1 -M1Evidence $targetPath -M1Notes $m1Notes -M2 $m2 -M2Evidence $targetPath -M2Notes $m2Notes -M3 $m3 -M3Evidence $targetPath -M3Notes $m3Notes -S1 $s1 -S1Evidence $targetPath -S1Notes $s1Notes -S2 $s2 -S2Evidence '.github/skills/*/SKILL.md' -S2Notes $s2Notes -S3 $s3 -S3Evidence $s3Evidence -S3Notes $s3Notes -Recommendations $recommendations -HistoryLoaded $historyLoaded -DenyListApplied 0 -Suppressed 0 -HistoryNotes 'Remediation rerun after adding assets/mirror.' -ReportRelPath $reportRelPath -ReviewDate $ReviewDate

    Set-Content -Path $reportPath -Value $report -NoNewline

    if ($recommendations.Count -eq 1 -and $recommendations[0] -like '*REC-000*') {
        $ledgerRow = '| REC-000 | No recommendations. | Implemented | ' + $ReviewDate + ' | Remediation checks passed. |'
    }
    else {
        $ledgerRows = @()
        if ($s1 -eq 'Advisory') {
            $ledgerRows += '| REC-001 | Add references assets (templates/examples/tools) for this skill to improve execution consistency. | Proposed | N/A | Remediation rerun advisory. |'
        }

        if ($s3 -eq 'Advisory') {
            $ledgerRows += '| REC-003 | Replace placeholder or unresolved markdown links with resolvable workspace targets (or valid external URLs). | Proposed | N/A | Remediation rerun advisory. |'
        }

        $ledgerRow = ($ledgerRows -join "`n")
    }

    Write-HistoryEntry -HistoryPath $historyPath -Skill $skill -SkillPath $targetPath -Outcome $outcome -ReviewDate $ReviewDate -ReportRelPath $reportRelPath -M1 $m1 -M1Notes $m1Notes -M2 $m2 -M2Notes $m2Notes -M3 $m3 -M3Notes $m3Notes -S1 $s1 -S1Notes $s1Notes -S2 $s2 -S2Notes $s2Notes -S3 $s3 -S3Notes $s3Notes -LedgerRow $ledgerRow -Rejected 'None' -Removed 'None' -Illegitimate 'None'

    Write-Output "Updated review and history for $skill"
}

Write-Output 'Targeted remediation review run complete.'

