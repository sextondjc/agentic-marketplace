---
name: task-execution
description: Use when executing implementation plans with independent tasks in the current session
---

# Task Execution

## Specialization

Execute an existing implementation plan in the same session using a fresh implementer subagent per task, then enforce a two-stage review gate.

## Core Principle

Fresh subagent per task plus ordered review gates equals low-context, high-confidence delivery.

## Trigger Conditions

- A concrete implementation plan already exists.
- Tasks are mostly independent.
- Work should be completed in the current session.

## When Not to Use

- Planning is incomplete.
- Tasks are tightly coupled and require continuous shared reasoning.
- Work should be split into a separate parallel session.

## Required Inputs

- Plan file path and ordered task list.
- Task-level acceptance criteria.
- Current branch and workspace constraints.

## Required Outputs

- Completed tasks with review disposition per task.
- Explicit closure status for spec compliance and code quality gates.
- Final recommendation for branch completion workflow.

## Execution Loop

1. Extract all task text and acceptance criteria before dispatch.
2. Dispatch one implementer subagent for exactly one task.
3. Handle implementer status (`DONE`, `DONE_WITH_CONCERNS`, `NEEDS_CONTEXT`, `BLOCKED`).
4. Run spec compliance review.
5. If spec review fails, fix and re-run spec review.
6. Run code quality review.
7. If quality review fails, fix and re-run quality review.
8. Mark task complete and move to the next task.

Use [command-patterns.md](./references/command-patterns.md) for canonical dispatch, status-handling, and gate-sequencing patterns.

## Gate Order

- Always run spec compliance before code quality.
- Never advance task state with open findings.

## Model Selection Rules

- Small mechanical task: fast model.
- Multi-file integration task: standard model.
- Architecture or judgment-heavy task: strongest model.

## Red Flags

- Running parallel implementers on the same code area.
- Skipping either review gate.
- Treating implementer self-review as a replacement for reviewer gates.
- Proceeding after `BLOCKED` without changing context, scope, or model.

## Integration

- Use this skill's execution loop for implementation discipline and review gates.
- Keep reviewer routing decisions explicit in task-level status updates.
- Finish by reporting branch completion recommendations in the required outputs.

## References

- [README.md](./references/README.md)
- [subagent-dispatch-patterns.md](./references/subagent-dispatch-patterns.md)
- [command-patterns.md](./references/command-patterns.md)
