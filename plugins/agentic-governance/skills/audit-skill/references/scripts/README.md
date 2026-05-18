# Audit Skill Scripts

These scripts are reusable assets for the `audit-skill` workflow.

## Scripts

- generate-audit-skill-baseline.ps1
  - Purpose: Runs a baseline review across all workspace skills, generates per-skill reports in .docs/changes/skill/reviews/<skill-name>/review.md, and updates history files plus history index.
  - Usage:
    - pwsh ./.github/skills/audit-skill/references/scripts/generate-audit-skill-baseline.ps1
    - pwsh ./.github/skills/audit-skill/references/scripts/generate-audit-skill-baseline.ps1 -RootPath c:/Projects/agentic -ReviewDate 2026-03-28

- get-audit-skill-metadata.ps1
  - Purpose: Produces a quick metadata matrix for frontmatter, trigger discoverability, references availability, and markdown link integrity signals.
  - Usage:
    - pwsh ./.github/skills/audit-skill/references/scripts/get-audit-skill-metadata.ps1
    - pwsh ./.github/skills/audit-skill/references/scripts/get-audit-skill-metadata.ps1 -SkillsRoot c:/Projects/agentic/.github/skills

- build-audit-skill-grid.ps1
  - Purpose: Rebuilds the aggregate full-skill review grid from per-skill review folders.
  - Usage:
    - pwsh ./.github/skills/audit-skill/references/scripts/build-audit-skill-grid.ps1
    - pwsh ./.github/skills/audit-skill/references/scripts/build-audit-skill-grid.ps1 -RootPath c:/Projects/agentic -ReviewDate 2026-03-28

- generate-audit-skill-targeted.ps1
  - Purpose: Re-runs reviews for a focused subset of skills (including mirrored external skills), updates per-skill reports, appends history entries for remediation passes, and evaluates markdown link integrity advisories.
  - Usage:
    - pwsh ./.github/skills/audit-skill/references/scripts/generate-audit-skill-targeted.ps1
    - pwsh ./.github/skills/audit-skill/references/scripts/generate-audit-skill-targeted.ps1 -ReviewDate 2026-03-29 -Skills curate-copilot,agent-authoring,instructions-authoring,route-customization,agent-customization

- refresh-audit-skill-history.ps1
  - Purpose: Normalizes history metadata dates, rebuilds history index, and regenerates the aggregate skill review grid.
  - Usage:
    - pwsh ./.github/skills/audit-skill/references/scripts/refresh-audit-skill-history.ps1
    - pwsh ./.github/skills/audit-skill/references/scripts/refresh-audit-skill-history.ps1 -RootPath c:/Projects/agentic -ReviewDate 2026-03-29

- generate-audit-skill-full.ps1
  - Purpose: Runs a deterministic full workspace skill audit, writes per-skill reports, appends history entries, applies deny-list suppression from history statuses (Rejected/Removed/Illegitimate), and rebuilds the aggregate grid plus history index.
  - Usage:
    - pwsh ./.github/skills/audit-skill/references/scripts/generate-audit-skill-full.ps1
    - pwsh ./.github/skills/audit-skill/references/scripts/generate-audit-skill-full.ps1 -RootPath c:/Projects/agentic -ReviewDate 2026-03-29

- remediate-20260403-skill-audit.ps1
  - Purpose: Applies the dated remediation workflow captured for the 2026-04-03 skill audit follow-up.
  - Usage:
    - pwsh ./.github/skills/audit-skill/references/scripts/remediate-20260403-skill-audit.ps1
    - pwsh ./.github/skills/audit-skill/references/scripts/remediate-20260403-skill-audit.ps1 -RootPath c:/Projects/agentic

## Notes

- These scripts are intended as review support assets (SKR-S1) and should be versioned with the skill.
- Keep ad hoc run artifacts out of .docs/changes/skill/reviews; use only the versioned scripts in this folder for repeatable audits.
- Usage examples in this README should use the current workspace root and current skill names.

