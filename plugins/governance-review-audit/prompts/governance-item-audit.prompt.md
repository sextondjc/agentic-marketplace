---
name: governance-item-audit
description: 'Canonical item governance prompt for one customization item against workspace and type-specific standards.'
---

# Governance Item Audit Prompt

Route this request to `orchestrator`.
Use `execute-customization-audit` to gather full-workspace evidence and use `audit-agent` / `audit-instructions` / `audit-prompts` / `audit-skill` / `optimize-customizations` for item-level findings as applicable.

## Purpose

Produce an item report for one customization evaluated against:

- workspace-wide standards
- standards applicable to the item's customization type.

The report must provide evidence-backed findings that roll up into type and executive reports.

## Required Input

- `Item Path`: path to one customization file under `.github/agents`, `.github/instructions`, `.github/prompts`, or `.github/skills`
- `Item Type`: `agents` | `instructions` | `prompts` | `skills` (derive from path when omitted)

## Source Audit Requirement (Mandatory)

Do not run isolated item-only checks. First aggregate from current source audits, then focus the report on the requested item.

## Required Actions

1. Run full-workspace governance evidence collection (`fresh-run required`).
2. Evaluate the item against all applicable MUST/SHOULD standards.
3. Emit normalized failure IDs and remediation actions.
4. Link each finding to the corresponding type or cross-type aggregate.
5. Link the item report to its type aggregate and executive report.

## Output Contract

**Output file path:** `.docs/changes/governance/audits/audit-<item-name>-<YYYY-MM-DD>.md`
`<item-name>` is the asset filename without extension (for example, `audit-csharp-engineer-2026-05-06.md`) and `<YYYY-MM-DD>` is the audit date.

Return sections in this order:

1. Item Scope Grid
2. Applicable Standards Grid
3. Failure Detail Grid (standardized schema)
4. Delta vs Prior Item Grid (Metric, Prior, Current, Delta, Trend)
5. Ranked Recommendations Grid
6. Final Disposition (`PASSED`, `FAILED`, or `PROVISIONAL-FAILED`)

**Item Scope Grid columns:** `Field`, `Value` — rows: Item Path, Item Type, Audit Date, Standards Applied, Prior Audit Date

**Failure Detail Grid columns:** `Finding ID`, `Severity` (`CRITICAL` | `HIGH` | `MEDIUM` | `LOW`), `Standard`, `Description`, `Recommendation`, `Disposition` (`Open` | `Accepted` | `Resolved`)

**Valid Final Disposition values:** `PASSED` (zero MUST failures), `FAILED` (one or more MUST failures), `PROVISIONAL-FAILED` (MUST failures present but all have accepted mitigations on record)

## Failure ID Format

Use normalized IDs in the form `GOV-<DOMAIN>-NNN` where `<DOMAIN>` is one of:

- `M`, `S`, `SK`, `CUS`, `OPT`

