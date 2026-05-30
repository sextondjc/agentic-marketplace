---
name: governance-audit-types
description: 'Canonical type governance prompt for governance across and between customization types, including standards drift detection.'
---

# Governance Type Audit Prompt

Route this request to `orchestrator`.

Use the `execute-customization-audit` skill as the orchestration workflow and then render the requested type slice.

## Purpose

Produce a type governance report that covers both:

- governance within each customization type, and
- governance between customization types (cross-type conflicts and standards drift).

Keep delta and failure-ID schema aligned to the executive report.

## Required Input

- `Target Scope`: `agents` | `instructions` | `prompts` | `skills` | `optimization` | `cross-type`
- `Cross-Type Matrix` (required when `Target Scope = cross-type`): one or more of
	- `agents-vs-instructions`
	- `agents-vs-skills`
	- `skills-vs-prompts`
	- `instructions-vs-skills`
	- `prompts-vs-instructions`

## Source Audit Requirement (Mandatory)

Type reporting must aggregate from current source audits first:

- `.docs/changes/governance/audits/governance-audit.md`
- `.docs/changes/skill/reviews/governance-audit-types-skills.md`
- `.docs/changes/customization/reviews/governance-audit-types-customizations.md`
- `.docs/changes/customization/reviews/governance-audit-types-optimization.md`

Then render findings/metrics to the requested scope.

## Required Actions

1. Load and follow [SKILL.md](./../skills/execute-customization-audit/SKILL.md).
2. Use full-workspace evidence collection from `fresh-run required` execution.
3. For single-type requests, render the selected type with links to item evidence.
4. For cross-type requests, render conflict and standards-drift findings between the selected type pairs and link each finding to item evidence.
5. Maintain standardized schemas identical to executive report for delta and failure detail sections.

## Output Contract

**Output file path:** `.docs/changes/customization/reviews/governance-audit-types-<scope>-<YYYY-MM-DD>.md`
where `<scope>` is the lowercase `Target Scope` value (e.g., `skills`, `cross-type`) and `<YYYY-MM-DD>` is the audit date.

Return sections in this order:

1. Type Scope Grid
2. Aggregate Outcome Grid
3. Standards Health Grid (type-specific + cross-type standards where applicable)
4. Cross-Type Conflict and Drift Grid (required when `Target Scope = cross-type`)
5. Failure Detail Grid
6. Delta vs Prior Report Grid (Metric, Prior, Current, Delta, Trend)
7. Ranked Recommendations Grid
8. Final Disposition (`PASSED`, `FAILED`, or `PROVISIONAL-FAILED`)

**Aggregate Outcome Grid columns:** `Check ID`, `Description`, `Result` (`PASS` | `FAIL` | `ADVISORY`), `Severity` (`CRITICAL` | `HIGH` | `MEDIUM` | `LOW`), `Finding ID`

**Failure Detail Grid columns:** `Finding ID`, `Severity`, `Asset`, `Description`, `Recommendation`, `Disposition` (`Open` | `Accepted` | `Resolved`)

**Valid Final Disposition values:** `PASSED` (zero MUST failures), `FAILED` (one or more MUST failures), `PROVISIONAL-FAILED` (MUST failures present but all have accepted mitigations on record)

## Failure ID Format

Use normalized IDs in the form `GOV-<DOMAIN>-NNN` where `<DOMAIN>` is one of:

- `CUS` for customization findings
- `OPT` for optimization findings
- `SK` for skill findings
