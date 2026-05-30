param(
    [string]$RootPath = 'c:/Projects/agentic_templates',
    [string]$ReviewDate = '2026-04-03'
)

$ErrorActionPreference = 'Stop'

$reportRoot = Join-Path $RootPath '.docs/changes/skill/reviews'

function Add-MissingSections {
    param(
        [string]$SkillFile,
        [string[]]$MissingSections
    )

    if (-not (Test-Path $SkillFile)) {
        return
    }

    $text = Get-Content $SkillFile -Raw
    $updates = New-Object System.Collections.Generic.List[string]

    foreach ($section in $MissingSections) {
        $name = $section.Trim()

        if ($name -eq 'Inputs' -and $text -notmatch '(?im)^##\s+Inputs\s*$') {
            $updates.Add("## Inputs`n`n- User request context and target scope for this skill invocation.`n")
        }
        elseif ($name -eq 'Required Outputs' -and $text -notmatch '(?im)^##\s+Required Outputs\s*$') {
            $updates.Add("## Required Outputs`n`n- A concrete, workspace-applicable result aligned with this skill purpose.`n")
        }
        elseif ($name -eq 'Workflow' -and $text -notmatch '(?im)^##\s+Workflow\s*$') {
            $updates.Add("## Workflow`n`n1. Gather required context and constraints from the workspace and user request.`n2. Execute the skill-specific steps and produce the required artifacts or decisions.`n3. Validate outputs for completeness and consistency with active workspace instructions.`n")
        }
    }

    if ($updates.Count -gt 0) {
        $appendBlock = "`n`n" + ($updates -join "`n")
        $newText = $text.TrimEnd() + $appendBlock + "`n"
        Set-Content -Path $SkillFile -Value $newText -NoNewline
        Write-Output "Updated: $SkillFile"
    }
}

$reportPattern = 'review.md'
$reports = Get-ChildItem $reportRoot -Recurse -File -Filter $reportPattern

foreach ($report in $reports) {
    $content = Get-Content $report.FullName -Raw
    $s4 = [regex]::Match($content, '(?im)^\|\s*SKR-S4\s*\|\s*Advisory\s*\|.*?missing section\(s\):\s*(.+?)\.\s*\|\s*$')
    if (-not $s4.Success) {
        continue
    }

    $missing = $s4.Groups[1].Value.Split(',') | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
    if ($missing.Count -eq 0) {
        continue
    }

    $target = [regex]::Match($content, '(?im)^- Target Path:\s*(.+)$').Groups[1].Value.Trim()
    $skillFile = $null

    if ($target -like '.github/skills/*/SKILL.md') {
        $skillFile = Join-Path $RootPath $target
    }
    elseif ($target -like 'copilot-skill:*') {
        $m = [regex]::Match($target, 'mirrored at\s+([^\)]+)\)')
        if ($m.Success) {
            $skillFile = Join-Path $RootPath $m.Groups[1].Value.Trim()
        }
    }

    if ($skillFile) {
        Add-MissingSections -SkillFile $skillFile -MissingSections $missing
    }
}

# Resolve governance-health-overview SKR-S1 advisory by adding concrete references assets.
$govRefDir = Join-Path $RootPath '.github/skills/governance-health-overview/references'
if (-not (Test-Path $govRefDir)) {
    New-Item -ItemType Directory -Path $govRefDir -Force | Out-Null
}

$govReadme = Join-Path $govRefDir 'README.md'
if (-not (Test-Path $govReadme)) {
    $readmeLines = @(
        '# Governance Health Overview References',
        '',
        'This folder contains reusable reference assets for governance-health-overview execution.',
        '',
        '## Assets',
        '',
        '- governance-metrics-checklist.md: Minimal checklist for reconciling governance-audit, skill-review, and governance-validate-customization outputs.'
    )

    Set-Content -Path $govReadme -Value ($readmeLines -join "`n") -NoNewline
    Write-Output "Created: $govReadme"
}

$govChecklist = Join-Path $govRefDir 'governance-metrics-checklist.md'
if (-not (Test-Path $govChecklist)) {
    $checklistLines = @(
        '# Governance Metrics Checklist',
        '',
        '- Verify all required catalogs are current and lane-mapped.',
        '- Confirm latest skill review outcomes and unresolved advisories.',
        '- Confirm latest customization validation findings and dispositions.',
        '- Publish a consolidated health disposition with explicit risk levels.'
    )

    Set-Content -Path $govChecklist -Value ($checklistLines -join "`n") -NoNewline
    Write-Output "Created: $govChecklist"
}

Write-Output 'Skill audit remediation updates completed.'

