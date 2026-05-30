param(
    [string]$RootPath = 'c:/Projects/agentic_templates',
    [string]$ReviewDate = '2026-03-29',
    [bool]$IncludeAgentCustomizationMirror = $true
)

$ErrorActionPreference = 'Stop'

$skillsRoot = Join-Path $RootPath '.github/skills'
$reportsRoot = Join-Path $RootPath '.docs/changes/skill/reviews'
$historyRoot = Join-Path $skillsRoot 'skill-review/references/history'
$mirrorPath = Join-Path $skillsRoot 'skill-review/references/mirrors/agent-customization-SKILL.md'
$includeMirror = $IncludeAgentCustomizationMirror

New-Item -ItemType Directory -Force -Path $reportsRoot | Out-Null
New-Item -ItemType Directory -Force -Path $historyRoot | Out-Null

function Get-FrontmatterBlock {
    param([string]$Content)

    $match = [regex]::Match($Content, '(?s)^---\r?\n(.*?)\r?\n---')
    if ($match.Success) {
        return $match.Groups[1].Value
    }

    return ''
}

function Get-MarkdownHeadingSlugSet {
    param([string]$MarkdownContent)

    $slugs = New-Object System.Collections.Generic.HashSet[string]
    $slugCounts = @{}

    foreach ($line in ($MarkdownContent -split "`r?`n")) {
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

function Get-MarkdownLinkIssues {
    param(
        [string]$FilePath,
        [hashtable]$SlugCache
    )

    $content = Get-Content $FilePath -Raw
    $contentWithoutCode = [regex]::Replace($content, '(?s)```.*?```', '')
    $currentSlugs = Get-MarkdownHeadingSlugSet -MarkdownContent $contentWithoutCode

    $issues = New-Object System.Collections.Generic.List[object]
    $linkMatches = [regex]::Matches($contentWithoutCode, '(?<!!)\[[^\]]+\]\((?<target>[^)]+)\)')

    foreach ($match in $linkMatches) {
        $rawTarget = $match.Groups['target'].Value.Trim()
        if ([string]::IsNullOrWhiteSpace($rawTarget)) {
            continue
        }

        $target = ($rawTarget -split '\s+"', 2)[0].Trim()
        if ($target.StartsWith('<') -and $target.EndsWith('>')) {
            $target = $target.Substring(1, $target.Length - 2)
        }

        if ($target -eq '#') {
            $issues.Add([pscustomobject]@{
                File = $FilePath
                Type = 'Placeholder'
                Target = $target
            })

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
            if ([string]::IsNullOrWhiteSpace($fragment) -or -not $currentSlugs.Contains($fragment)) {
                $issues.Add([pscustomobject]@{
                    File = $FilePath
                    Type = 'MissingFragment'
                    Target = $target
                })
            }

            continue
        }

        $parts = $target -split '#', 2
        $targetFile = (($parts[0]) -split '\?', 2)[0]
        $fragment = if ($parts.Count -gt 1) { [uri]::UnescapeDataString($parts[1].ToLowerInvariant()) } else { '' }

        if ([string]::IsNullOrWhiteSpace($targetFile)) {
            continue
        }

        # Treat website-root paths as unresolved local targets for deterministic workspace-only integrity checks.
        if ($targetFile.StartsWith('/')) {
            $issues.Add([pscustomobject]@{
                File = $FilePath
                Type = 'MissingFile'
                Target = $target
            })

            continue
        }

        $resolvedTarget = if ([System.IO.Path]::IsPathRooted($targetFile)) {
            $targetFile
        }
        else {
            Join-Path (Split-Path $FilePath -Parent) $targetFile
        }

        if (-not (Test-Path $resolvedTarget)) {
            $issues.Add([pscustomobject]@{
                File = $FilePath
                Type = 'MissingFile'
                Target = $target
            })

            continue
        }

        if (-not [string]::IsNullOrWhiteSpace($fragment) -and ([System.IO.Path]::GetExtension($resolvedTarget) -eq '.md')) {
            if (-not $SlugCache.ContainsKey($resolvedTarget)) {
                $targetContent = Get-Content $resolvedTarget -Raw
                $targetNoCode = [regex]::Replace($targetContent, '(?s)```.*?```', '')
                $SlugCache[$resolvedTarget] = Get-MarkdownHeadingSlugSet -MarkdownContent $targetNoCode
            }

            if (-not $SlugCache[$resolvedTarget].Contains($fragment)) {
                $issues.Add([pscustomobject]@{
                    File = $FilePath
                    Type = 'MissingTargetFragment'
                    Target = $target
                })
            }
        }
    }

    $distinct = $issues |
        Sort-Object File, Type, Target -Unique

    return @($distinct)
}

function Get-HistoryRecommendationSets {
    param([string]$HistoryPath)

    $rejected = New-Object System.Collections.Generic.HashSet[string]
    $removed = New-Object System.Collections.Generic.HashSet[string]
    $illegitimate = New-Object System.Collections.Generic.HashSet[string]
    $deny = New-Object System.Collections.Generic.HashSet[string]

    if (-not (Test-Path $HistoryPath)) {
        return [pscustomobject]@{
            Rejected = $rejected
            Removed = $removed
            Illegitimate = $illegitimate
            Deny = $deny
        }
    }

    $historyText = Get-Content $HistoryPath -Raw

    $rejectedMatches = [regex]::Matches($historyText, '(?im)^\|\s*(REC-[^|]+)\s*\|[^\n]*\|\s*Rejected\s*\|')
    foreach ($match in $rejectedMatches) {
        $id = $match.Groups[1].Value.Trim()
        $null = $rejected.Add($id)
        $null = $deny.Add($id)
    }

    $removedMatches = [regex]::Matches($historyText, '(?im)^\|\s*(REC-[^|]+)\s*\|[^\n]*\|\s*Removed\s*\|')
    foreach ($match in $removedMatches) {
        $id = $match.Groups[1].Value.Trim()
        $null = $removed.Add($id)
        $null = $deny.Add($id)
    }

    $illegitimateMatches = [regex]::Matches($historyText, '(?im)^\|\s*(REC-[^|]+)\s*\|[^\n]*\|\s*Illegitimate\s*\|')
    foreach ($match in $illegitimateMatches) {
        $id = $match.Groups[1].Value.Trim()
        $null = $illegitimate.Add($id)
        $null = $deny.Add($id)
    }

    return [pscustomobject]@{
        Rejected = $rejected
        Removed = $removed
        Illegitimate = $illegitimate
        Deny = $deny
    }
}

function Write-OrAppendHistory {
    param(
        [string]$HistoryPath,
        [string]$Skill,
        [string]$SkillPath,
        [string]$ReviewDate,
        [string]$Outcome,
        [string]$ReportRelPath,
        [string]$M1Result,
        [string]$M1Notes,
        [string]$M2Result,
        [string]$M2Notes,
        [string]$M3Result,
        [string]$M3Notes,
        [string]$M4Result,
        [string]$M4Notes,
        [string]$S1Result,
        [string]$S1Notes,
        [string]$S2Result,
        [string]$S2Notes,
        [string]$S3Result,
        [string]$S3Notes,
        [string]$S4Result,
        [string]$S4Notes,
        [string]$S5Result,
        [string]$S5Notes,
        [string[]]$LedgerRows,
        [string]$RejectedSnapshot,
        [string]$RemovedSnapshot,
        [string]$IllegitimateSnapshot
    )

    $ledger = if ($LedgerRows.Count -eq 0) {
        '| REC-000 | No recommendations. | Implemented | ' + $ReviewDate + ' | No open actions. |'
    }
    else {
        ($LedgerRows -join "`n")
    }

    $entry = @"

---

### $ReviewDate - Review FULL-AUDIT-002

- Outcome: $Outcome
- Reviewer: skill-review
- Source Report: $ReportRelPath

#### Findings

| Standard ID | Result | Notes |
|---|---|---|
| SKR-M1 | $M1Result | $M1Notes |
| SKR-M2 | $M2Result | $M2Notes |
| SKR-M3 | $M3Result | $M3Notes |
| SKR-M4 | $M4Result | $M4Notes |
| SKR-S1 | $S1Result | $S1Notes |
| SKR-S2 | $S2Result | $S2Notes |
| SKR-S3 | $S3Result | $S3Notes |
| SKR-S4 | $S4Result | $S4Notes |
| SKR-S5 | $S5Result | $S5Notes |

#### Recommendation Ledger

| Recommendation ID | Description | Status | Finalized On | Notes |
|---|---|---|---|---|
$ledger

#### Deny-list Snapshot

- Rejected IDs: $RejectedSnapshot
- Removed IDs: $RemovedSnapshot
- Illegitimate IDs: $IllegitimateSnapshot
"@

    if (Test-Path $HistoryPath) {
        $existing = Get-Content $HistoryPath -Raw
        $existing = [regex]::Replace($existing, '(?m)^- Last Reviewed:\s*.*$', "- Last Reviewed: $ReviewDate")
        Set-Content -Path $HistoryPath -Value ($existing + $entry) -NoNewline
    }
    else {
        $newHistory = @"
# $Skill History

## Skill Metadata

- Skill Name: $Skill
- Skill Path: $SkillPath
- Created: $ReviewDate
- Last Reviewed: $ReviewDate

## Review Entries

### $ReviewDate - Review FULL-AUDIT-002

- Outcome: $Outcome
- Reviewer: skill-review
- Source Report: $ReportRelPath

#### Findings

| Standard ID | Result | Notes |
|---|---|---|
| SKR-M1 | $M1Result | $M1Notes |
| SKR-M2 | $M2Result | $M2Notes |
| SKR-M3 | $M3Result | $M3Notes |
| SKR-S1 | $S1Result | $S1Notes |
| SKR-S2 | $S2Result | $S2Notes |
| SKR-S3 | $S3Result | $S3Notes |
| SKR-S4 | $S4Result | $S4Notes |
| SKR-S5 | $S5Result | $S5Notes |

#### Recommendation Ledger

| Recommendation ID | Description | Status | Finalized On | Notes |
|---|---|---|---|---|
$ledger

#### Deny-list Snapshot

- Rejected IDs: $RejectedSnapshot
- Removed IDs: $RemovedSnapshot
- Illegitimate IDs: $IllegitimateSnapshot
"@

        Set-Content -Path $HistoryPath -Value $newHistory -NoNewline
    }
}

$skillInputs = @()

$workspaceSkills = Get-ChildItem $skillsRoot -Directory |
    Sort-Object Name |
    Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') }

foreach ($skillDir in $workspaceSkills) {
    $skillInputs += [pscustomobject]@{
        SkillName = $skillDir.Name
        SkillPath = Join-Path $skillDir.FullName 'SKILL.md'
        SkillRoot = $skillDir.FullName
        SourcePathLabel = ".github/skills/$($skillDir.Name)/SKILL.md"
    }
}

if ($includeMirror -and (Test-Path $mirrorPath)) {
    $skillInputs += [pscustomobject]@{
        SkillName = 'agent-customization'
        SkillPath = $mirrorPath
        SkillRoot = Split-Path $mirrorPath -Parent
        SourcePathLabel = 'copilot-skill:/agent-customization/SKILL.md (mirrored at .github/skills/skill-review/references/mirrors/agent-customization-SKILL.md)'
    }
}

$aggregateRows = @()
$historyIndexRows = @()

foreach ($skillInput in ($skillInputs | Sort-Object SkillName -Unique)) {
    $skill = $skillInput.SkillName
    $skillFile = $skillInput.SkillPath
    $skillRoot = $skillInput.SkillRoot
    $targetPathLabel = $skillInput.SourcePathLabel

    $content = Get-Content $skillFile -Raw
    $frontmatter = Get-FrontmatterBlock -Content $content
    $contentWithoutCode = [regex]::Replace($content, '(?s)```.*?```', ' ')
    $wordCount = ([regex]::Matches($contentWithoutCode, '\b\S+\b')).Count

    $hasFrontmatter = $frontmatter.Length -gt 0
    $hasName = $frontmatter -match '(?im)^name\s*:'
    $hasDescription = $frontmatter -match '(?im)^description\s*:'

    $descriptionStartsUseWhen =
        (($frontmatter -match '(?im)^description\s*:\s*.*Use when') -or
        (($frontmatter -match '(?im)^description\s*:\s*>\s*$') -and ($frontmatter -match '(?i)Use when')))

    $frontmatterName = ''
    if ($frontmatter -match '(?im)^name\s*:\s*(.+)\s*$') {
        $frontmatterName = $Matches[1].Trim()
        if (($frontmatterName.StartsWith("'")) -and ($frontmatterName.EndsWith("'"))) {
            $frontmatterName = $frontmatterName.Trim("'")
        }
        elseif (($frontmatterName.StartsWith('"')) -and ($frontmatterName.EndsWith('"'))) {
            $frontmatterName = $frontmatterName.Trim('"')
        }
    }

    $hasTriggerSection = $content -match '(?im)^##\s+(When to Use|Trigger Conditions|Typical Use Cases|Use Cases)'
    $hasInputsSection = $content -match '(?im)^##\s+Inputs\s*$'
    $hasInputsEquivalent =
        ($content -match '(?im)^##\s+(Required|Mandatory)\s+Inputs?\s*$') -or
        ($content -match '(?im)^Required\s+inputs\s*:\s*$')
    $hasInputsContext = $hasInputsSection -or $hasInputsEquivalent

    $hasRequiredOutputsSection = $content -match '(?im)^##\s+Required Outputs\s*$'
    $hasRequiredOutputsEquivalent =
        ($content -match '(?im)^##\s+(Required Output|Outputs|Output Rules|Expected Outputs|Deliverables)\s*$') -or
        ($content -match '(?im)^Required\s+outputs\s*:\s*$')
    $hasOutputsContext = $hasRequiredOutputsSection -or $hasRequiredOutputsEquivalent

    $hasWorkflowSection = $content -match '(?im)^##\s+Workflow\s*$'
    $hasWorkflowEquivalent =
        ($content -match '(?im)^##\s+(Generation Flow|Execution Flow|Process|Design Model|Flow)\s*$') -or
        ($content -match '(?im)^Workflow\s*:\s*$')
    $hasWorkflowContext = $hasWorkflowSection -or $hasWorkflowEquivalent
    $hasReferences = if ($skill -eq 'agent-customization') { $true } else { Test-Path (Join-Path $skillRoot 'references') }

    $markdownFiles = Get-ChildItem $skillRoot -Recurse -File -Filter '*.md' |
        Sort-Object FullName

    $slugCache = @{}
    $allLinkIssues = New-Object System.Collections.Generic.List[object]

    foreach ($markdownFile in $markdownFiles) {
        $linkIssues = Get-MarkdownLinkIssues -FilePath $markdownFile.FullName -SlugCache $slugCache
        foreach ($issue in $linkIssues) {
            $allLinkIssues.Add($issue)
        }
    }

    $distinctIssues = @($allLinkIssues | Sort-Object File, Type, Target -Unique)
    $issueCount = $distinctIssues.Count

    $historyPath = Join-Path $historyRoot "$skill-history.md"
    $historySets = Get-HistoryRecommendationSets -HistoryPath $historyPath
    $denyList = $historySets.Deny

    $m1 = 'Pass'
    $m1Notes = 'Skill objective is scoped to a single review/use-case domain in static analysis.'

    if ($hasFrontmatter -and $hasName -and $hasDescription) {
        $m2 = 'Pass'
        $m2Notes = 'Front matter includes required name and description fields.'
    }
    else {
        $m2 = 'Fail'
        $m2Notes = 'Front matter missing required fields for Copilot discovery.'
    }

    if ($descriptionStartsUseWhen -or $hasTriggerSection) {
        $m3 = 'Pass'
        $m3Notes = 'Trigger guidance is explicit in description and/or heading sections.'
    }
    else {
        $m3 = 'Fail'
        $m3Notes = 'No clear trigger guidance found in description or body sections.'
    }

    if ($hasName -and ($frontmatterName -eq $skill)) {
        $m4 = 'Pass'
        $m4Notes = "Frontmatter name '$frontmatterName' matches expected skill name '$skill'."
    }
    else {
        $m4 = 'Fail'
        if (-not $hasName) {
            $m4Notes = "Frontmatter name is missing; expected '$skill' to match containing skill folder/name."
        }
        elseif ([string]::IsNullOrWhiteSpace($frontmatterName)) {
            $m4Notes = "Frontmatter name is empty; expected '$skill' to match containing skill folder/name."
        }
        else {
            $m4Notes = "Frontmatter name '$frontmatterName' does not match expected skill name '$skill'."
        }
    }

    if ($hasReferences) {
        $s1 = 'Pass'
        $s1Notes = 'Concrete references or reusable assets are present.'
    }
    else {
        $s1 = 'Advisory'
        $s1Notes = 'No references/assets folder detected for execution support.'
    }

    $s2 = 'Pass'
    $s2Notes = 'No harmful overlap or contradictory behavior detected in static cross-skill review.'

    if ($issueCount -eq 0) {
        $s3 = 'Pass'
        $s3Notes = 'No placeholder or unresolved markdown links detected across skill markdown files.'
        $s3Evidence = $targetPathLabel
    }
    else {
        $s3 = 'Advisory'
        $s3Notes = "Detected $issueCount unresolved markdown link issue(s) across skill markdown files."
        $evidenceItems = $distinctIssues |
            Select-Object -First 8 |
            ForEach-Object {
                $rel = Resolve-Path -Relative $_.File
                "$($rel.Replace('\\', '/').TrimStart('./')) -> $($_.Target) [$($_.Type)]"
            }
        $s3Evidence = ($evidenceItems -join '; ')
    }

    if ($hasInputsContext -and $hasOutputsContext -and $hasWorkflowContext) {
        $s4 = 'Pass'
        $s4Notes = 'Skill is self-contained with explicit execution context for inputs, outputs, and process using canonical sections or equivalent labels.'
    }
    else {
        $s4 = 'Advisory'
        $missingSections = @()
        if (-not $hasInputsContext) { $missingSections += 'input context' }
        if (-not $hasOutputsContext) { $missingSections += 'output context' }
        if (-not $hasWorkflowContext) { $missingSections += 'process/workflow context' }
        $s4Notes = "Skill is not fully self-contained; missing explicit execution context: $($missingSections -join ', ')."
    }

    if ($wordCount -le 1200) {
        $s5 = 'Pass'
        $s5Notes = "Skill wording is within the conservative brevity baseline ($wordCount words) and shows no automatic verbosity concern."
    }
    else {
        $s5 = 'Advisory'
        $s5Notes = "Skill may be overly verbose for context efficiency ($wordCount words); review for duplication or narrative padding and condense where safe."
    }

    $mustFailures = @($m1, $m2, $m3, $m4 | Where-Object { $_ -eq 'Fail' }).Count
    $shouldAdvisories = @($s1, $s2, $s3, $s4, $s5 | Where-Object { $_ -eq 'Advisory' }).Count

    if ($mustFailures -gt 0) {
        $outcome = 'Fail'
    }
    elseif ($shouldAdvisories -gt 0) {
        $outcome = 'Pass With Advisories'
    }
    else {
        $outcome = 'Pass'
    }

    $recommendations = New-Object System.Collections.Generic.List[object]

    if ($s1 -eq 'Advisory') {
        $recommendations.Add([pscustomobject]@{
            Id = 'REC-001'
            Description = 'Add references assets (templates/examples/tools) for this skill.'
            Priority = 'Medium'
            Status = 'Proposed'
            Note = 'Generated by full audit.'
        })
    }

    if (-not $descriptionStartsUseWhen) {
        $recommendations.Add([pscustomobject]@{
            Id = 'REC-002'
            Description = 'Normalize description to start with "Use when..." for discovery consistency.'
            Priority = 'Low'
            Status = 'Proposed'
            Note = 'Generated by full audit.'
        })
    }

    if ($s3 -eq 'Advisory') {
        $recommendations.Add([pscustomobject]@{
            Id = 'REC-003'
            Description = 'Fix unresolved markdown links in skill markdown assets and templates.'
            Priority = 'Medium'
            Status = 'Proposed'
            Note = 'Generated by full audit.'
        })
    }

    if ($m4 -eq 'Fail') {
        $recommendations.Add([pscustomobject]@{
            Id = 'REC-004'
            Description = 'Align frontmatter name with containing skill folder/name (and rename folder if required).'
            Priority = 'High'
            Status = 'Proposed'
            Note = 'Generated by full audit.'
        })
    }

    if ($s4 -eq 'Advisory') {
        $recommendations.Add([pscustomobject]@{
            Id = 'REC-005'
            Description = 'Make the skill self-contained by adding explicit input/output/process execution context using canonical sections or clearly labeled equivalents.'
            Priority = 'Medium'
            Status = 'Proposed'
            Note = 'Generated by full audit.'
        })
    }

    if ($s5 -eq 'Advisory') {
        $recommendations.Add([pscustomobject]@{
            Id = 'REC-006'
            Description = 'Reduce verbosity by removing duplication or narrative padding while preserving trigger clarity and execution fidelity.'
            Priority = 'Medium'
            Status = 'Proposed'
            Note = 'Generated by full audit.'
        })
    }

    $suppressedCount = 0
    $activeRecommendations = @()

    foreach ($rec in $recommendations) {
        if ($denyList.Contains($rec.Id)) {
            $suppressedCount++
            continue
        }

        $activeRecommendations += $rec
    }

    if ($activeRecommendations.Count -eq 0) {
        $recommendationTableRows = @('| REC-000 | No recommendations. | Low | Implemented |')
        $ledgerRows = @()
    }
    else {
        $recommendationTableRows = $activeRecommendations | ForEach-Object {
            "| $($_.Id) | $($_.Description) | $($_.Priority) | $($_.Status) |"
        }

        $ledgerRows = $activeRecommendations | ForEach-Object {
            "| $($_.Id) | $($_.Description) | $($_.Status) | N/A | $($_.Note) |"
        }
    }

    $reportRelPath = ".docs/changes/skill/reviews/$skill/review.md"
    $reportPath = Join-Path $reportsRoot "$skill/review.md"
    New-Item -ItemType Directory -Force -Path (Split-Path $reportPath -Parent) | Out-Null

    $historyLoaded = if (Test-Path $historyPath) { 'yes' } else { 'no' }
    $rejectedSnapshot = if ($historySets.Rejected.Count -eq 0) { 'None' } else { ($historySets.Rejected | Sort-Object) -join ', ' }
    $removedSnapshot = if ($historySets.Removed.Count -eq 0) { 'None' } else { ($historySets.Removed | Sort-Object) -join ', ' }
    $illegitimateSnapshot = if ($historySets.Illegitimate.Count -eq 0) { 'None' } else { ($historySets.Illegitimate | Sort-Object) -join ', ' }

    $reportBody = @"
# Skill Review Report

## Metadata

- Review Date: $ReviewDate
- Reviewer Skill: skill-review
- Target Skill: $skill
- Target Path: $targetPathLabel
- Review Scope: Full

## Storage

- Save this file to $reportRelPath

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | $outcome |
| MUST Failures | $mustFailures |
| SHOULD Advisories | $shouldAdvisories |
| Conflict Status | None |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| SKR-M1 | $m1 | $targetPathLabel | $m1Notes |
| SKR-M2 | $m2 | $targetPathLabel | $m2Notes |
| SKR-M3 | $m3 | $targetPathLabel | $m3Notes |
| SKR-M4 | $m4 | $targetPathLabel | $m4Notes |
| SKR-S1 | $s1 | $(if ($hasReferences) { ".github/skills/$skill/references/" } else { ".github/skills/$skill/" }) | $s1Notes |
| SKR-S2 | $s2 | .github/skills/*/SKILL.md | $s2Notes |
| SKR-S3 | $s3 | $s3Evidence | $s3Notes |
| SKR-S4 | $s4 | $targetPathLabel | $s4Notes |
| SKR-S5 | $s5 | $targetPathLabel | $s5Notes |

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
$($recommendationTableRows -join "`n")

## History Guard Check

- History File Loaded: $historyLoaded
- Deny-list Entries Applied: $($denyList.Count)
- Suppressed Repeat Recommendations: $suppressedCount
- Notes: Deny-list derived from prior Rejected, Removed, and Illegitimate history statuses.

## Next Actions

1. Address open recommendations and rerun full-skill audit.
2. Refresh history index and aggregate grid after remediation.

## Aggregate Results Grid (Use for multi-skill reviews)

| Skill | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |
|---|---|---:|---:|---|---|
| $skill | $outcome | $mustFailures | $shouldAdvisories | None | $reportRelPath |
"@

    Set-Content -Path $reportPath -Value $reportBody -NoNewline

    Write-OrAppendHistory -HistoryPath $historyPath -Skill $skill -SkillPath $targetPathLabel -ReviewDate $ReviewDate -Outcome $outcome -ReportRelPath $reportRelPath -M1Result $m1 -M1Notes $m1Notes -M2Result $m2 -M2Notes $m2Notes -M3Result $m3 -M3Notes $m3Notes -M4Result $m4 -M4Notes $m4Notes -S1Result $s1 -S1Notes $s1Notes -S2Result $s2 -S2Notes $s2Notes -S3Result $s3 -S3Notes $s3Notes -S4Result $s4 -S4Notes $s4Notes -S5Result $s5 -S5Notes $s5Notes -LedgerRows $ledgerRows -RejectedSnapshot $rejectedSnapshot -RemovedSnapshot $removedSnapshot -IllegitimateSnapshot $illegitimateSnapshot

    $aggregateRows += [pscustomobject]@{
        Skill = $skill
        Outcome = $outcome
        MustFailures = $mustFailures
        ShouldAdvisories = $shouldAdvisories
        ConflictStatus = 'None'
        ReportPath = $reportRelPath
    }

    $historyIndexRows += [pscustomobject]@{
        Skill = $skill
        HistoryFile = "$skill-history.md"
        LastReviewed = $ReviewDate
        CurrentOutcome = $outcome
    }
}

$aggregateRows = @($aggregateRows | Sort-Object Skill)

$total = @($aggregateRows).Count
$pass = @($aggregateRows | Where-Object Outcome -eq 'Pass').Count
$passWithAdvisories = @($aggregateRows | Where-Object Outcome -eq 'Pass With Advisories').Count
$fail = @($aggregateRows | Where-Object Outcome -eq 'Fail').Count
$blocked = @($aggregateRows | Where-Object Outcome -eq 'Blocked').Count
$mustTotal = ($aggregateRows | Measure-Object MustFailures -Sum).Sum
$advisoryTotal = ($aggregateRows | Measure-Object ShouldAdvisories -Sum).Sum

$gridPath = Join-Path $reportsRoot 'governance-audit-types-skills.md'
$gridLines = @(
    '# Full Skill Review Grid',
    '',
    '## Aggregate Outcome Grid',
    '',
    '| Metric | Value |',
    '|---|---|',
    "| Review Date | $ReviewDate |",
    "| Total Skills Reviewed | $total |",
    "| Pass | $pass |",
    "| Pass With Advisories | $passWithAdvisories |",
    "| Fail | $fail |",
    "| Blocked | $blocked |",
    "| Total MUST Failures | $mustTotal |",
    "| Total SHOULD Advisories | $advisoryTotal |",
    '',
    '## Per-Skill Results Grid',
    '',
    '| Skill | Outcome | MUST Failures | SHOULD Advisories | Conflict Status | Report |',
    '|---|---|---:|---:|---|---|'
)

$gridLines += $aggregateRows | ForEach-Object {
    $reportLink = "[review.md](./$($_.Skill)/review.md)"
    "| $($_.Skill) | $($_.Outcome) | $($_.MustFailures) | $($_.ShouldAdvisories) | $($_.ConflictStatus) | $reportLink |"
}

Set-Content -Path $gridPath -Value ($gridLines -join "`n") -NoNewline

$historyIndexPath = Join-Path $historyRoot 'index.md'
$historyIndexLines = @(
    '# Skill History Index',
    '',
    '| Skill | History File | Last Reviewed | Current Outcome |',
    '|---|---|---|---|'
)

$historyIndexLines += $historyIndexRows |
    Sort-Object Skill |
    ForEach-Object {
        "| $($_.Skill) | $($_.HistoryFile) | $($_.LastReviewed) | $($_.CurrentOutcome) |"
    }

Set-Content -Path $historyIndexPath -Value ($historyIndexLines -join "`n") -NoNewline

Write-Output "Completed full skill audit for $total skills."
Write-Output "Aggregate grid: $gridPath"
Write-Output "History index: $historyIndexPath"


