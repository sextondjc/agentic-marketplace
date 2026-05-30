---
name: execute-delivery
description: 'Session-start prompt for orchestrator-first execution continuation with parallel-safe dispatch, aggressive traceability updates, and status-first reporting.'
---

# Resume Execution Prompt

Route this request to `orchestrator`.

Use the `task-execution` skill as the primary workflow.

## Purpose
Use this prompt at the start of each session to resume execution quickly for any active plan slice with orchestrator-first routing, safe parallel dispatch, and strict traceability updates.

## Session Input Discovery (Generic)

Resolve active artifacts in this order at session start:

1. Active execution authority memo from .docs/delivery/*activation*.md.
2. Active execution plan in .docs/plans/ referenced by that memo.
3. Active ticket backlog in .docs/plans/ for the current work slice.
4. Active changes artifact in .docs/changes/ for progressive updates.
5. Active status artifact in .docs/delivery/ for X-of-Y reporting.

If no authority memo exists, infer the latest merged execution plan and confirm with the user before proceeding.

## Orchestrator-First Routing (Mandatory)

| Rule | Requirement |
|---|---|
| Lane classification | Classify each item as Planning, Execution, or Review before implementation. |
| Intake path | Route non-trivial and mixed requests through orchestrator first. |
| Implementation dispatch | Dispatch to csharp-engineer only after explicit routing is established. |
| Research separation | Route research-only security/performance work to research agents; do not implement in those lanes. |

## Parallel Dispatch Rules

| Rule | Requirement |
|---|---|
| Independence | Parallelize only tickets with independent dependencies. |
| Contract safety | Do not parallelize mutations on the same contract surface without explicit sequencing. |
| Ownership | Keep one owner per ticket id. |
| Evidence | Capture evidence independently for each ticket. |

## Session Startup Checklist

- Confirm active plan id and active work slice id.
- Read and reconcile current state from all discovered active artifacts.
- Confirm deferred or blocked scope for the active slice remains excluded.
- Produce a ticket/work item snapshot before code changes begin.

## Batch Execution Protocol

- Execute in small batches mapped to ticket ids.
- For each batch, record:
  - ticketIds
  - requirementIds
  - workstreamIds
  - storyIds
  - decisionIds (if policy-coupled)
  - tests run and outcome
- Do not begin next batch until the traceability update is written.

## Traceability Update Protocol (Mandatory)

1. After every completed batch, update the active changes artifact in .docs/changes/.
2. Include plan linkage, changed artifacts, and evidence summary.
3. Log all scope/sequence deviations before proceeding.
4. No ticket can move to Done without test evidence and changed file list.
5. Refresh delivery counters in the active status artifact in .docs/delivery/ after each batch.

## Cross-Session Continuity Protocol

At the start of each new session, first output must include:

1. Last completed batch id.
2. In-flight batch id and blockers.
3. Next queued ticket ids.
4. Open risks and unresolved review findings.

## Status-First Reporting Contract (Required)

Return status updates in this order.

### Summary

| Metric | Value |
|---|---|
| Tickets Completed | X of Y |
| Workstreams Active | X of Y |
| Batch Progress | X of Y |
| Milestones Completed | X of Y |
| Blocking Items | X of Y |

### Done

| ID | Scope | Evidence | Status |
|---|---|---|---|

### Remaining

| ID | Scope | Dependency | Next Action | Status |
|---|---|---|---|---|

### Batch Delta

| Batch ID | Tickets | Areas Changed | Tests | Traceability Updated |
|---|---|---|---|---|

### Risks and Blockers

| Risk ID | Description | Impact | Owner | Mitigation | State |
|---|---|---|---|---|---|

## Scope Protection Rules

- Deferred scope items for the active slice are blocked from implementation until a new decision record is approved.
- Any scope expansion must be recorded as a decision before execution divergence.

## Session Closeout Checklist

- Update execution changes artifact with completed tasks.
- Update ticket statuses and delivery counters.
- Record deviations and unresolved findings.
- Publish a concise next-session handoff block.

