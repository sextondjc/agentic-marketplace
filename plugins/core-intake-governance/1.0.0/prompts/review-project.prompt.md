---
name: review-project
description: 'Wave-transition pre-flight prompt. Run before starting any new execution wave to verify plan alignment, artifact hygiene, and scope integrity. Satisfies GOV-S4 governance cadence requirement.'
---

# Project Checkpoint Prompt

Route this request to `orchestrator`.

Use the `task-execution` skill as the primary workflow.

Run this prompt at every wave transition (after one wave closes, before the next wave begins) and any time new concepts or artifacts are introduced mid-wave.

## Purpose

Catch plan drift, misplaced artifacts, and ungated scope additions before they compound. This prompt is intentionally cheap — it should take no more than 5 minutes and produce a Go / No-Go decision with a ranked fix list if blocked.

## Checklist Questions

Answer each question. If any answer is No, record the corrective action before proceeding to wave execution.

### 1. Plan Linkage — Is execution anchored?

| Check | Answer | Corrective Action if No |
|---|---|---|
| Does the active wave reference the active parent execution plan or a child plan with a `Parent Plan` field linking back to it? | | Link the wave to the parent plan before execution starts |
| Does the Wave N ticket backlog exist at `.docs/plans/` and reference workstream IDs? | | Produce the ticket backlog via `writing-plans` + `plan-researcher` before coding |

### 2. Changes Folder — Is it clean?

| Check | Answer | Corrective Action if No |
|---|---|---|
| Do all files in `.docs/changes/` reference an originating plan ID and workstream ID in their metadata? | | Add plan linkage or move the artifact to `.docs/plans/` or `.docs/research/` |
| Does `.docs/changes/` contain design specs, UX mockups, or feature descriptions (not change logs)? | | Move those files to `.docs/plans/` |

### 3. Scope Integrity — Is everything gated?

| Check | Answer | Corrective Action if No |
|---|---|---|
| Do all new artifacts (plans, research, specs) created since the last wave map to at least one existing REQ-XXX? | | Add the requirement to the active parent plan and a matching DEC-XXX decision record before implementation |
| Do all new workstream IDs introduced since the last wave have a `Parent Workstream` column linking to an existing parent workstream? | | Update the workstream header table in the plan to add the missing parent linkage |

### 4. ADR and Decision Health

| Check | Answer | Corrective Action if No |
|---|---|---|
| Are all ADRs in `.docs/adr/` indexed in the [README.md](./../../.docs/adr/README.md)? | | Add the missing row to the ADR README |
| Do all ratified `DEC-XXX` entries in the active parent plan have a corresponding implementation task in the active wave backlog or an explicit deferral record? | | Add the task to the wave backlog or create a `DEF-XXX` deferral entry |

### 5. Cost and Efficiency Gate

| Check | Answer | Corrective Action if No |
|---|---|---|
| Have any design or research artifacts been produced for workstreams more than two waves away? | | Mark those artifacts HELD with a gate condition tied to the appropriate wave start |
| Are any parallel planning tracks (e.g., standalone identifier plans, UX plans) now aligned under the active execution plan hierarchy? | | Fold them into the active plan hierarchy before the wave begins |

## Go / No-Go Decision

| Outcome | Condition |
|---|---|
| **GO** | All five question groups answered Yes (or corrective actions already applied) |
| **NO-GO** | Any uncorrected No answer in groups 1, 2, or 3 |
| **GO WITH ACTIONS** | Only groups 4–5 have open items, and those are low-risk advisory fixes |

## Next Steps After Checkpoint

- If GO: proceed with `plans` skill against the wave ticket backlog.
- If NO-GO: apply corrective actions, re-run this checklist, confirm GO before executing.
- Record the checkpoint outcome (GO/NO-GO + any corrective actions taken) in the active `.docs/changes/` traceability artifact for the wave.

