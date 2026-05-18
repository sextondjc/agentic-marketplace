# Governance Health Overview - Human Summary

| Metric | Value |
|---|---|
| Review Date | 2026-04-18 |
| Total Checks | 22 |
| Passed Checks | 11 |
| Failed Checks | 11 |
| Material Failures | 8 |
| Likely False Positives | 3 |
| Asset Total | 126 |
| Open Conflicts | 0 |

## Strengths
- Asset coverage complete across agents, instructions, prompts, and skills (126 total artifacts).
- No open customization conflict files detected.
- Responsibility overlap remains within threshold (2/8).

## Weaknesses
- catalog-agents: Get-Content: C:\Projects\agentic\.github\scripts\powershell\test-catalog-integrity.ps1:53:3 Line | 53 | Get-Content $catalogPath | | ~~~~...
- catalog-instructions: Write-Error: C:\Projects\agentic\.github\scripts\powershell\invoke-governance-health-overview.ps1:198:55 Line | 198 | … Command = { ./.gi...
- frontmatter-agents: architecture-designer.agent.md: missing valid frontmatter delimiters benchmark-researcher.agent.md: missing valid frontmatter delimiters ...
- hub-sync: { "Missing instructions in catalog": [ "mobile-frontend.instructions.md", "ux-design.instructions.md", "web-frontend.instructions.md" ] }
- link-graph: { "CheckedFiles": 649, "CheckedLinks": 1466, "BrokenLinks": 100, "Issues": [ { "Source": "C:\\Projects\\agentic\\.docs\\changes\\taxonomy...
- artifact-reference-hygiene: ArtifactPath ------------ .github/skills/governance-health-overview/references/.artifacts/governance-heal… .github/skills/governance-heal...
- docs-naming: Path Kind Violation ---- ---- --------- changes\agent\reviews\architecture-designer Folder Folder not single lowercase … changes\agent\re...
- must-finding-traceability: FindingId Issue Detail --------- ----- ------ F-001 EvidenceMismatch MUST check 'catalog-agents' must reference evidence … F-002 Evidence...

## Opportunities
- Fix exit-code behavior for likely false-positive checks: frontmatter-prompts, frontmatter-instructions, index-refresh.
- Publish top-N link graph issues as curated remediation batches to reduce noise and speed triage.
- Promote catalog updates into CI guardrails so new instructions and prompts cannot drift from lifecycle catalogs.

## Threats
- 8 material check failures are currently blocking PASSED disposition.
- Large-volume broken links (100) can degrade trust in governance navigation and evidence traceability.

## Top Failing Checks

| Check | ExitCode | Evidence Snippet |
|---|---:|---|
| catalog-agents | 1 | Get-Content: C:\Projects\agentic\.github\scripts\powershell\test-catalog-integrity.ps1:53:3 Line | 53 | Get-Content $catalogPath | | ~~~~~~~~~~~~~~~~~~~~~~~~ | Cannot find path | 'C:\Projects\agentic\.github\agents\ag... |
| catalog-instructions | 1 | Write-Error: C:\Projects\agentic\.github\scripts\powershell\invoke-governance-health-overview.ps1:198:55 Line | 198 | … Command = { ./.github/scripts/powershell/test-catalog-integrity.ps1 - … | ~~~~~~~~~~~~~~~~~~~~~~~... |
| frontmatter-agents | 1 | architecture-designer.agent.md: missing valid frontmatter delimiters benchmark-researcher.agent.md: missing valid frontmatter delimiters code-reviewer.agent.md: missing valid frontmatter delimiters csharp-engineer.age... |
| hub-sync | 1 | { "Missing instructions in catalog": [ "mobile-frontend.instructions.md", "ux-design.instructions.md", "web-frontend.instructions.md" ] } |
| link-graph | 1 | { "CheckedFiles": 649, "CheckedLinks": 1466, "BrokenLinks": 100, "Issues": [ { "Source": "C:\\Projects\\agentic\\.docs\\changes\\taxonomy-review.md", "Target": "./../.github/skills/governance-taxonomy/references/namin... |
| artifact-reference-hygiene | 1 | ArtifactPath ------------ .github/skills/governance-health-overview/references/.artifacts/governance-heal… .github/skills/governance-health-overview/references/.artifacts/governance-heal… .github/skills/governance-hea... |
| docs-naming | 1 | Path Kind Violation ---- ---- --------- changes\agent\reviews\architecture-designer Folder Folder not single lowercase … changes\agent\reviews\benchmark-researcher Folder Folder not single lowercase … changes\agent\re... |
| must-finding-traceability | 1 | FindingId Issue Detail --------- ----- ------ F-001 EvidenceMismatch MUST check 'catalog-agents' must reference evidence … F-002 EvidenceMismatch MUST check 'catalog-instructions' must reference evi… F-003 EvidenceMis... |

## Evidence Artifacts

- Raw machine evidence: [governance-health-overview.latest.json](./governance-health-overview.latest.json)
- Responsibility overlap payload: [responsibility-overlap.routing.json](./responsibility-overlap.routing.json)

