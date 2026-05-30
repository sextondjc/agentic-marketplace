# Prompt Audit Report

## Metadata

- Review Date: YYYY-MM-DD
- Reviewer Skill: audit-prompts
- Target Prompt: <prompt-name>
- Target Path: <path-to-prompt-md>
- Review Scope: Full | Delta

## Storage

- Save this file to `.docs/changes/prompt/reviews/<prompt-name>/review.md`

## Summary Outcome Grid

| Metric | Value |
|---|---|
| Overall Outcome | Pass \| Pass With Advisories \| Fail \| Blocked |
| MUST Failures | <count> |
| SHOULD Advisories | <count> |

## Standards Evaluation

| Standard ID | Standard | Result | Evidence | Notes |
|---|---|---|---|---|
| PRR-M1 | Singular purpose | Pass/Fail | <evidence> | <notes> |
| PRR-M2 | Valid frontmatter | Pass/Fail | <evidence> | <notes> |
| PRR-M3 | Output format declared | Pass/Fail | <evidence> | <notes> |
| PRR-M4 | Skill routing present | Pass/Fail | <evidence> | <notes> |
| PRR-S1 | No conflict with other prompts | Pass/Advisory | <evidence> | <notes> |
| PRR-S2 | Brevity | Pass/Advisory | <evidence> | <notes> |

## Source Alignment Check

- Source Catalog Consulted: <yes/no>
- Sources Evaluated: <count>
- Sources Needing Review: <count>
- File Location Valid: <yes/no>
- Frontmatter Semantics Valid: <yes/no>
- Prompt Invocation Notes: <notes>
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

## Aggregate Results Grid (Use for multi-prompt reviews)

| Prompt | Outcome | MUST Failures | SHOULD Advisories | Report |
|---|---|---:|---:|---|
| <prompt-name> | Pass/Pass With Advisories/Fail/Blocked | <n> | <n> | <report-file> |
