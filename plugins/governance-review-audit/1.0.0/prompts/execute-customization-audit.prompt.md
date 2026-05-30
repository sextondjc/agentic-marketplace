---
name: execute-customization-audit
description: 'Canonical executive governance aggregation prompt that produces one consolidated report from existing source audits.'
---

# Execute Customization Audit Prompt

Route this request to `orchestrator`.

Use the `execute-customization-audit` skill as the primary workflow.

## Purpose

Produce one executive governance report that aggregates all governance source audits into a single disposition.

## Mandatory Source Audits

- `.docs/changes/governance/audits/governance-audit.md`
- `.docs/changes/skill/reviews/governance-audit-types-skills.md`
- `.docs/changes/customization/reviews/governance-audit-types-customizations.md`
- `.docs/changes/customization/reviews/governance-audit-types-optimization.md`

If any source is missing, output `PROVISIONAL-FAILED` with missing-source rows.

## Required Actions

1. Load and follow [SKILL.md](./../skills/execute-customization-audit/SKILL.md).
2. Validate all required source audit artifacts exist.
3. Aggregate outcomes and produce one report at `.docs/changes/governance/audits/execute-customization-audit.md`.
4. Ensure report section order is exactly:
   1. Executive Briefing
   2. Aggregate Outcome Grid
   3. Failure Matrix
   4. Per-Type Results
   5. Ranked Recommendations
5. Ensure any single fail at any source level forces executive `FAILED`.
6. Use markdown hyperlinks to human-readable evidence only.
7. Do not emit standalone findings that are not traceable to source audits.
