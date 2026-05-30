# Subagent Dispatch Patterns

## Implementer Dispatch Template

Use this structure for each task dispatch.

```text
Task ID: <id>
Task Goal: <goal>
Scope In: <files and behavior>
Scope Out: <explicit exclusions>
Acceptance Criteria:
- <criterion 1>
- <criterion 2>
Required Verification:
- <tests or checks>
Return Format:
- Status: DONE | DONE_WITH_CONCERNS | NEEDS_CONTEXT | BLOCKED
- Evidence: changed files, checks run, open concerns
```

## Reviewer Dispatch Template

```text
Review Type: Spec Compliance | Code Quality
Task ID: <id>
Expected Criteria:
- <criterion 1>
- <criterion 2>
Evidence Inputs:
- <diff summary>
- <tests>
Return:
- Outcome: PASS | FAIL
- Findings: ranked list with remediation guidance
```

## Status Handling Matrix

| Status | Controller Action |
|---|---|
| DONE | Start spec review gate. |
| DONE_WITH_CONCERNS | Evaluate concerns, resolve blockers, then run spec review. |
| NEEDS_CONTEXT | Provide missing context and re-dispatch. |
| BLOCKED | Change model, split task, or escalate if plan is flawed. |

## Task Completion Checklist

- Implementer finished task scope.
- Spec compliance gate passed.
- Code quality gate passed.
- Task marked complete in active tracking.
