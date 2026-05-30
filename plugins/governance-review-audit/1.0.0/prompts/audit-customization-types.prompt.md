---
name: audit-customization-types
description: 'On-demand prompt to run audit-customization-types for same-type and cross-type governance interaction audits across agents, instructions, prompts, and skills.'
---

# Audit Customization Types Prompt

Route this request to `orchestrator`.

Use the `audit-customization-types` skill to run a deterministic, grid-first type governance audit.

## Trigger

Invoke this prompt when any of the following is true:

- A type-level governance audit is requested.
- Cross-type conflicts or failure propagation are suspected.
- Multiple item-level audits need type-level reconciliation.
- A governance cadence check needs same-type and cross-type interaction status.

## Required Inputs

- `Target Scope`: `all` or one/more of `agents`, `instructions`, `prompts`, `skills`, `cross-type`.
- `Audit Date`: today's date in ISO format (`YYYY-MM-DD`).
- `Prior Report` (optional): path to previous type-audit report.

## Required Actions

1. Load and follow [SKILL.md](./../skills/audit-customization-types/SKILL.md).
2. Build and evaluate same-type and cross-type interaction matrices for in-scope pairs.
3. Run `.github/scripts/powershell/test-type-interaction-matrix.ps1` against the audit report path to validate pair coverage and failure-propagation totals.
4. Apply TYP-M* and TYP-S* standards with evidence.
5. Assign severities using the Severity Mapping Grid and apply consistently in failure rows.
6. Write the report to `.docs/changes/governance/type-audits/audit-customization-types.md` using [audit-customization-types-report-template.md](./../skills/audit-customization-types/references/audit-customization-types-report-template.md).
7. Do not modify customization artifacts unless the user explicitly requests remediation edits.

## Output Requirements

Return results in chat in this order:

1. Type Scope Grid
2. Standards Outcome Grid
3. Same-Type Interaction Grid
4. Cross-Type Interaction Grid
5. Severity Mapping Grid
6. Failure Detail Grid
7. Ranked Recommendations Grid
8. Disposition Grid
