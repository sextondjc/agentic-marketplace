param(
    [string]$RootPath = 'c:/Projects/agentic_templates',
    [string]$ReviewDate = '2026-03-29'
)

$ErrorActionPreference = 'Stop'

$historyDir = Join-Path $RootPath '.github/skills/skill-review/references/history'
$reportsRoot = Join-Path $RootPath '.docs/changes/skill/reviews'

$historyFiles = Get-ChildItem $historyDir -File -Filter '*-history.md' | Sort-Object Name

foreach ($history in $historyFiles) {
    $text = Get-Content $history.FullName -Raw
    $updated = [regex]::Replace($text, '(?m)^- Last Reviewed:\s*.*$', "- Last Reviewed: $ReviewDate")
    Set-Content -Path $history.FullName -Value $updated -NoNewline
}

$indexRows = $historyFiles | ForEach-Object {
    $text = Get-Content $_.FullName -Raw
    $skill = $_.BaseName -replace '-history$',''
    $lastReviewed = [regex]::Match($text, '(?m)^- Last Reviewed:\s*(.+)$').Groups[1].Value.Trim()
    $outcomes = [regex]::Matches($text, '(?m)^- Outcome:\s*(.+)$')
    $currentOutcome = if ($outcomes.Count -gt 0) { $outcomes[$outcomes.Count - 1].Groups[1].Value.Trim() } else { 'Unknown' }

    [pscustomobject]@{
        Skill = $skill
        HistoryFile = $_.Name
        LastReviewed = $lastReviewed
        CurrentOutcome = $currentOutcome
    }
} | Sort-Object Skill

$indexLines = @(
    '# Skill History Index',
    '',
    '| Skill | History File | Last Reviewed | Current Outcome |',
    '|---|---|---|---|'
)

$indexLines += $indexRows | ForEach-Object {
    "| $($_.Skill) | $($_.HistoryFile) | $($_.LastReviewed) | $($_.CurrentOutcome) |"
}

Set-Content -Path (Join-Path $historyDir 'index.md') -Value ($indexLines -join "`n") -NoNewline

$reportFiles = Get-ChildItem $reportsRoot -Recurse -File -Filter 'review.md' | Sort-Object FullName

$reportRows = $reportFiles | ForEach-Object {
    $text = Get-Content $_.FullName -Raw
    $skill = [regex]::Match($text, '(?m)^- Target Skill:\s*(.+)$').Groups[1].Value.Trim()
    if ([string]::IsNullOrWhiteSpace($skill)) { return }

    $outcome = [regex]::Match($text, '\| Overall Outcome \|\s*(.+?)\s*\|').Groups[1].Value.Trim()
    $must = [int]([regex]::Match($text, '\| MUST Failures \|\s*(\d+)\s*\|').Groups[1].Value.Trim())
    $should = [int]([regex]::Match($text, '\| SHOULD Advisories \|\s*(\d+)\s*\|').Groups[1].Value.Trim())
    $conflict = [regex]::Match($text, '\| Conflict Status \|\s*(.+?)\s*\|').Groups[1].Value.Trim()

    [pscustomobject]@{
        Skill = $skill
        Outcome = $outcome
        MustFailures = $must
        ShouldAdvisories = $should
        ConflictStatus = $conflict
        ReportPath = ".docs/changes/skill/reviews/$skill/review.md"
    }
} | Sort-Object Skill

$total = $reportRows.Count
$pass = ($reportRows | Where-Object Outcome -eq 'Pass').Count
$passWithAdvisories = ($reportRows | Where-Object Outcome -eq 'Pass With Advisories').Count
$fail = ($reportRows | Where-Object Outcome -eq 'Fail').Count
$blocked = ($reportRows | Where-Object Outcome -eq 'Blocked').Count
$mustTotal = ($reportRows | Measure-Object MustFailures -Sum).Sum
$advisoryTotal = ($reportRows | Measure-Object ShouldAdvisories -Sum).Sum

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

$gridLines += $reportRows | ForEach-Object {
    $reportLink = "[review.md](./$($_.Skill)/review.md)"
    "| $($_.Skill) | $($_.Outcome) | $($_.MustFailures) | $($_.ShouldAdvisories) | $($_.ConflictStatus) | $reportLink |"
}

Set-Content -Path (Join-Path $reportsRoot 'governance-audit-types-skills.md') -Value ($gridLines -join "`n") -NoNewline

Write-Output 'Refreshed history metadata, history index, and aggregate full-skill review grid.'

