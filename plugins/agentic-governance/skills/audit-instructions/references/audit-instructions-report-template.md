# Instruction Audit Report

## Metadata

- Review Date: YYYY-MM-DD
- Reviewer Skill: audit-instructions
- Target Instruction: <instruction-name>
- Target Path: <path-to-instructions-md>
- Review Scope: Full | Delta

## Storage

- Save this file to `.docs/changes/instruction/reviews/<instruction-name>/review.md`

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | Pass \| Pass With Advisories \| Fail \| Blocked |
| MUST Failures | <count> |
| SHOULD Advisories | <count> |

## Standards Evaluation

| Standard ID | Standard | Result | Evidence | Notes |
|---|---|---|---|---|
| INR-M1 | Singular policy domain | Pass/Fail | <evidence> | <notes> |
| INR-M2 | Valid frontmatter | Pass/Fail | <evidence> | <notes> |
| INR-M3 | `applyTo` is appropriately scoped | Pass/Fail | <evidence> | <notes> |
| INR-M4 | No task workflow content | Pass/Fail | <evidence> | <notes> |
| INR-S1 | No conflict with other instruction files | Pass/Advisory | <evidence> | <notes> |
| INR-S2 | Rationale present for non-obvious rules | Pass/Advisory | <evidence> | <notes> |
| INR-S3 | No conflict with agent or skill boundaries | Pass/Advisory | <evidence> | <notes> |
| INR-S4 | Brevity | Pass/Advisory | <evidence> | <notes> |

## Source Alignment Check

- Source Catalog Consulted: <yes/no>
- Sources Evaluated: <count>
- Sources Needing Review: <count>
- File Location Valid: <yes/no>
- Frontmatter Semantics Valid: <yes/no>
- `applyTo` Behavior Notes: <notes>
- Recommendation: <source-aware recommendation>

## Recommendations

| Recommendation ID | Description | Priority | Status |
|---|---|---|---|
| REC-001 | <recommendation> | High/Medium/Low | Proposed/Accepted/Rejected/Removed/Implemented |

## History Guard Check

- History File Loaded: <yes/no>
- Deny-list Entries Applied: <count>
- Suppressed Repeat Recommendations: <count>
- Notes: <what was suppressed and why>

## Next Actions

1. <action>
2. <action>

## Aggregate Results Grid (Use for multi-instruction reviews)

| Instruction | Outcome | MUST Failures | SHOULD Advisories | Report |
|---|---|---:|---:|---|
| <instruction-name> | Pass/Pass With Advisories/Fail/Blocked | <n> | <n> | <report-file> |
