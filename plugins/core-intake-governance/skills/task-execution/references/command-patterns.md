# Task Execution Command Patterns

Use these patterns to keep task execution deterministic and repeatable.

## Dispatch Pattern

- One task, one implementer subagent, one completion payload.
- Never dispatch two implementers into the same code region simultaneously.

## Review Gate Pattern

1. Spec compliance review.
2. Remediate only spec findings.
3. Re-run spec review until clear.
4. Code-quality review.
5. Remediate only quality findings.
6. Re-run quality review until clear.

## Status Handling Pattern

- `DONE`: continue to reviews.
- `DONE_WITH_CONCERNS`: continue with explicit concern tracking.
- `NEEDS_CONTEXT`: add missing context and re-dispatch same task.
- `BLOCKED`: stop loop and escalate with explicit blocker reason.

## Completion Pattern

- Mark task complete only when both gates are clear.
- Record disposition and unresolved risks before moving to the next task.