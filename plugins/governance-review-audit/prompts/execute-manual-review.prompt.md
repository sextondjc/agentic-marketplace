---
name: execute-manual-review
description: 'Applies saved manual review findings only after explicit invocation; consumes inline REVIEW markers and/or a findings note file.'
---

# Execute Manual Review Prompt

Route this request to `orchestrator`.

Use the `remediate-review` skill as the primary workflow.

## Purpose

Use this prompt only after a manual review pass is complete and findings are saved.

## Inputs

Provide the following:

1. Scope to process (files/folders).
2. Findings source:
   - inline markers (REVIEW-HIGH, REVIEW-MED, REVIEW-LOW, REVIEW-QUESTION),
   - a findings markdown file,
   - or both.
3. Optional deferrals (finding IDs to defer with rationale).

## Required Behavior

1. Parse findings and group by severity.
2. Ask clarifying questions only for unresolved REVIEW-QUESTION items that block safe implementation.
3. Implement REVIEW-HIGH and REVIEW-MED findings unless explicitly deferred by the user.
4. Implement REVIEW-LOW findings when low risk and in scope.
5. Preserve existing architecture, security, and repository conventions.
6. Run relevant tests for changed areas when possible.
7. Remove or resolve obsolete REVIEW markers touched by the change.

## Output Contract

Return results in this order.

### Findings Intake

| Severity | Count | Source |
|---|---|---|
| HIGH | X | inline/notes |
| MED | X | inline/notes |
| LOW | X | inline/notes |
| QUESTION | X | inline/notes |

### Implementation Summary

| Finding ID | Status | Files Changed | Notes |
|---|---|---|---|

### Deferred Items

| Finding ID | Reason | Next Action |
|---|---|---|

### Validation

| Check | Result |
|---|---|
| Build | pass/fail/not-run |
| Tests | pass/fail/not-run |
| Security-sensitive changes reviewed | yes/no |

## Invocation Template

Use this block when invoking:

Scope: <paths>
Findings Source: <inline|notes|both>
Notes File: <optional path>
Deferrals: <optional finding ids and reasons>
Constraints: no unrelated refactors; preserve behavior unless finding requires change
