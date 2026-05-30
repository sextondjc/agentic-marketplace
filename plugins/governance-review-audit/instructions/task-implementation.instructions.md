---
name: task-implementation
applyTo: '.docs/changes/*.md'
description: 'Policy boundaries for executing approved plans and maintaining change traceability artifacts.'
---

# Task Plan Implementation Instructions

Keep this file policy-only. Use [SKILL.md](./../skills/task-execution/SKILL.md) for same-session execution workflow and [SKILL.md](./../skills/plans/SKILL.md) for dedicated-session execution checkpoints.

## Scope

- Applies to change artifacts in `.docs/changes/*.md` produced while implementing approved plans.
- Governs traceability between plan files in `.docs/plans/**`, research notes in `.docs/research/**`, and delivered implementation artifacts.

## Mandatory Policy Requirements

- Execution work MUST reference an originating plan identifier.
- Change artifacts MUST record deviations from the approved plan with rationale.
- Change artifacts MUST be updated progressively during implementation, not only at completion.
- Quality and security standards from active instruction files remain mandatory for all implementation output.
- Release summary sections MUST be completed only after plan phases are finished.

## Workflow Ownership

- Use skill workflows for execution procedure details:
   - `task-execution` for same-session execution with task-level orchestration.
   - `plans` for dedicated-session execution and checkpointed handoff.
   - `writing-plans` when an implementation-ready plan does not yet exist.
- This instruction does not define step-by-step task execution flows or templates.

## Success Criteria

- ✅ Change artifacts preserve plan linkage and deviation traceability.
- ✅ Progressive updates are present across the implementation lifecycle.
- ✅ Final release summary is present after completion.

## Routing Notes

- Use [SKILL.md](./../skills/task-execution/SKILL.md) for same-session plan execution.
- Use [SKILL.md](./../skills/plans/SKILL.md) for dedicated-session execution with explicit checkpoints.
- Use [SKILL.md](./../skills/write-technical-docs/SKILL.md) when change artifact quality or formatting guidance is needed.

