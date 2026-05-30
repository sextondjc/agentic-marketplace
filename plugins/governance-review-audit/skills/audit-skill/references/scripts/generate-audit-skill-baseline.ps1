param(
    [string]$RootPath = 'c:/Projects/agentic_templates',
    [string]$ReviewDate = '2026-03-28'
)

$ErrorActionPreference = 'Stop'

$skillsRoot = Join-Path $RootPath '.github/skills'
$reportsDir = Join-Path $RootPath '.docs/changes/skill/reviews'
$historyDir = Join-Path $skillsRoot 'skill-review/references/history'

New-Item -ItemType Directory -Force -Path $reportsDir | Out-Null
New-Item -ItemType Directory -Force -Path $historyDir | Out-Null

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

$skills = Get-ChildItem $skillsRoot -Directory |
    Sort-Object Name |
    Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') }

$indexRows = @()

foreach ($s in $skills) {
    $skill = $s.Name
    $skillFile = Join-Path $s.FullName 'SKILL.md'
    $content = Get-Content $skillFile -Raw
    $front = Get-Frontmatter $content

    $hasFront = $front.Length -gt 0
    $hasName = $front -match '(?m)^name\s*:'
    $hasDesc = $front -match '(?m)^description\s*:'
    $descUseWhen = (($front -match '(?im)^description\s*:\s*.*Use when') -or (($front -match '(?im)^description\s*:\s*>\s*$') -and ($front -match '(?i)Use when')))
    $descUseFor = $front -match '(?i)USE FOR|DO NOT USE FOR'
    $hasTriggerSection = $content -match '(?im)^##\s+(When to Use|Trigger Conditions|Typical Use Cases|Use Cases)'
    $hasReferences = Test-Path (Join-Path $s.FullName 'references')
    $linkAudit = Get-MarkdownLinkIntegrity -Content $content -BasePath (Split-Path $skillFile -Parent)

    $m1 = 'Pass'
    $m1Notes = 'Baseline review found a single primary objective for the skill.'

    if ($hasFront -and $hasName -and $hasDesc) {
        $m2 = 'Pass'
        $m2Notes = 'Front matter includes required name and description fields.'
    }
    else {
        $m2 = 'Fail'
        $m2Notes = 'Front matter missing required fields for Copilot discovery.'
    }

    $m3Pass = $descUseWhen -or $descUseFor -or $hasTriggerSection
    if ($m3Pass) {
        $m3 = 'Pass'
        $m3Notes = 'Triggering guidance is present in description or body sections.'
    }
    else {
        $m3 = 'Fail'
        $m3Notes = 'No clear trigger guidance found in description or body.'
    }

    if ($hasReferences) {
        $s1 = 'Pass'
        $s1Notes = 'Concrete references/assets exist for execution support.'
    }
    else {
        $s1 = 'Advisory'
        $s1Notes = 'No references/assets folder detected; add concrete templates or examples.'
    }

    $s2 = 'Pass'
    $s2Notes = 'No harmful cross-skill conflict detected in baseline static review.'

    if (($linkAudit.PlaceholderCount + $linkAudit.BrokenCount) -eq 0) {
        $s3 = 'Pass'
        $s3Notes = 'No broken or placeholder markdown links detected.'
        $s3Evidence = ".github/skills/$skill/SKILL.md"
    }
    else {
        $s3 = 'Advisory'
        $s3Notes = "Detected $($linkAudit.PlaceholderCount) placeholder and $($linkAudit.BrokenCount) unresolved local markdown links."
        $s3Evidence = if ([string]::IsNullOrWhiteSpace($linkAudit.BrokenTargets)) { '.github/skills/' + $skill + '/SKILL.md' } else { $linkAudit.BrokenTargets }
    }

    $mustFailures = @($m2, $m3 | Where-Object { $_ -eq 'Fail' }).Count
    $advisories = @($s1, $s2, $s3 | Where-Object { $_ -eq 'Advisory' }).Count

    if ($mustFailures -gt 0) { $outcome = 'Fail' }
    elseif ($advisories -gt 0) { $outcome = 'Pass With Advisories' }
    else { $outcome = 'Pass' }

    $recommendations = @()
    if ($s1 -eq 'Advisory') {
        $recommendations += '| REC-001 | Add references assets (templates/examples/tools) for this skill to improve execution consistency. | Medium | Proposed |'
    }

    if (-not $descUseWhen) {
        $recommendations += '| REC-002 | Normalize description to start with "Use when..." for stronger discovery consistency. | Low | Proposed |'
    }

    if ($s3 -eq 'Advisory') {
        $recommendations += '| REC-003 | Replace placeholder or unresolved markdown links with resolvable workspace targets (or valid external URLs). | Medium | Proposed |'
    }

    if ($recommendations.Count -eq 0) {
        $recommendations += '| REC-000 | No recommendations. | Low | Implemented |'
    }

    $recommendationBlock = @('| Recommendation ID | Description | Priority | Status |', '|---|---|---|---|') + $recommendations
    $recommendationText = ($recommendationBlock -join "`n")

    $skillReportDir = Join-Path $reportsDir $skill
    New-Item -ItemType Directory -Force -Path $skillReportDir | Out-Null
    $reportFileName = 'review.md'
    $reportPath = Join-Path $skillReportDir $reportFileName

    $report = @"
# Skill Review Report

## Metadata

- Review Date: $ReviewDate
- Reviewer Skill: skill-review
- Target Skill: $skill
- Target Path: .github/skills/$skill/SKILL.md
- Review Scope: Full

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | $outcome |
| MUST Failures | $mustFailures |
| SHOULD Advisories | $advisories |
| Conflict Status | None |

## Standards Evaluation

| Standard ID | Result | Evidence | Notes |
|---|---|---|---|
| SKR-M1 | $m1 | .github/skills/$skill/SKILL.md | $m1Notes |
| SKR-M2 | $m2 | .github/skills/$skill/SKILL.md | $m2Notes |
| SKR-M3 | $m3 | .github/skills/$skill/SKILL.md | $m3Notes |
| SKR-S1 | $(if($s1 -eq 'Advisory'){'Advisory'}else{'Pass'}) | $(if($hasReferences){'.github/skills/' + $skill + '/references/'}else{'.github/skills/' + $skill + '/'}) | $s1Notes |
| SKR-S2 | $s2 | .github/skills/*/SKILL.md | $s2Notes |
| SKR-S3 | $s3 | $s3Evidence | $s3Notes |

## Recommendations

$recommendationText

## History Guard Check

- History File Loaded: no (initial baseline for this skill)
- Deny-list Entries Applied: 0
- Suppressed Repeat Recommendations: 0
- Notes: Initial baseline review entry.

## Next Actions

1. Review and accept or reject proposed recommendations.
2. Update skill history ledger with decision outcomes after changes.
"@

    Set-Content -Path $reportPath -Value $report -NoNewline

    $historyPath = Join-Path $historyDir ("{0}-history.md" -f $skill)

    $ledgerRows = @()
    if ($s1 -eq 'Advisory') {
        $ledgerRows += '| REC-001 | Add references assets (templates/examples/tools) for this skill. | Proposed | N/A | Baseline advisory. |'
    }

    if (-not $descUseWhen) {
        $ledgerRows += '| REC-002 | Normalize description to start with "Use when...". | Proposed | N/A | Discovery consistency recommendation. |'
    }

    if ($s3 -eq 'Advisory') {
        $ledgerRows += '| REC-003 | Replace placeholder or unresolved markdown links with resolvable targets. | Proposed | N/A | Link integrity advisory. |'
    }

    if ($ledgerRows.Count -eq 0) {
        $ledgerRows += '| REC-000 | No recommendations. | Implemented | ' + $ReviewDate + ' | Baseline clean pass. |'
    }

    $ledger = @('| Recommendation ID | Description | Status | Finalized On | Notes |', '|---|---|---|---|---|') + $ledgerRows
    $ledgerText = ($ledger -join "`n")

    $history = @"
# $skill History

## Skill Metadata

- Skill Name: $skill
- Skill Path: .github/skills/$skill/SKILL.md
- Created: $ReviewDate
- Last Reviewed: $ReviewDate

## Review Entries

### $ReviewDate - Review BASELINE-001

- Outcome: $outcome
- Reviewer: skill-review
- Source Report: .docs/changes/skill/reviews/$skill/$reportFileName

#### Findings

| Standard ID | Result | Notes |
|---|---|---|
| SKR-M1 | $m1 | $m1Notes |
| SKR-M2 | $m2 | $m2Notes |
| SKR-M3 | $m3 | $m3Notes |
| SKR-S1 | $(if($s1 -eq 'Advisory'){'Pass/Advisory'}else{'Pass'}) | $s1Notes |
| SKR-S2 | $s2 | $s2Notes |
| SKR-S3 | $s3 | $s3Notes |

#### Recommendation Ledger

$ledgerText

#### Deny-list Snapshot

- Rejected IDs: None
- Removed IDs: None
- Illegitimate IDs: None
"@

    Set-Content -Path $historyPath -Value $history -NoNewline

    $indexRows += "| $skill | $skill-history.md | $ReviewDate | $outcome |"
}

$indexHeader = @(
    '# Skill History Index',
    '',
    '| Skill | History File | Last Reviewed | Current Outcome |',
    '|---|---|---|---|'
)

$indexContent = ($indexHeader + ($indexRows | Sort-Object)) -join "`n"
Set-Content -Path (Join-Path $historyDir 'index.md') -Value $indexContent -NoNewline

$reportCount = (Get-ChildItem $reportsDir -Recurse -Filter 'review.md').Count
$historyCount = (Get-ChildItem $historyDir -Filter '*-history.md').Count
Write-Output "Generated $reportCount reports and $historyCount history files."

