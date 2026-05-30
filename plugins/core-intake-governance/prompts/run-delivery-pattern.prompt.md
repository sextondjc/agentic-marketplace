---
name: run-delivery-pattern
description: 'Invoke the workspace ratified delivery pattern for a named workstream. Routes through orchestrator with the approved 12-phase sequence, enforces all approval gates, and produces a durable artifact at every phase.'
---

# Run Delivery Pattern

Route this request to `orchestrator`.

Use `delivery-orchestration` as the primary skill, governed by the workspace ratified delivery pattern at `.docs/plans/delivery/pattern/delivery-pattern-plan.md`.

## Purpose

Start or resume delivery of a named workstream using the approved 12-phase delivery pattern. All phases, gates, and artifact naming conventions follow the ratified plan. Agents must not skip, compress, or reorder phases.

## Required Input

Provide at least one of the following before the prompt runs:

- **Workstream name or objective** — what is being built, changed, or reviewed
- **Change type** — new asset or update to existing asset (determines PRD depth per OD-3)
- **Starting phase** — `P1` (default for new work) or a specific phase if resuming

## Ratified Phase Sequence

| Phase | Activity | Output / Gate |
|---|---|---|
| P1 | Work Intake & Classification | `intake-record.md` |
| P2 | Discovery & Research | `[topic]-research.md` |
| P3 | Planning & Specification | `[task]-plan.md` + G-PLAN |
| P4-P5 | Acceptance Criteria + Architecture/ADRs (parallel) | acceptance + ADR artifacts |
| P6 | Test Design (TDD First) | `[task]-test-design.md` + G-TDD |
| P7 | Implementation / Asset Authoring | assets in `.github/` |
| P7a-P7c | Security + Performance + Governance reviews (parallel) | review evidence artifacts |
| P8 | Asset Review & Quality Gate | `[task]-quality-gate.md` + G-REVIEW |
| P9 | Test Orchestration | `[task]-test-orchestration.md` |
| P10 | Release Readiness & Go/No-Go | `[task]-release-readiness.md` + G-RELEASE |
| P11 | Sync / Promotion | promotion evidence |
| P12 | Retrospective & Outcome Review | `[task]-retrospective.md` |

## Gate Rules (Non-Negotiable)

| Gate | Location | Who Approves |
|---|---|---|
| G-PLAN | After P3 | User — explicit approval required before P4/P5/P6 begin |
| G-TDD | After P6 | `code-reviewer` agent; user required for high-risk or cross-cutting changes |
| G-REVIEW | After P8 | `code-reviewer` agent + user if any blocking finding |
| G-RELEASE | After P10 | User — explicit go/no-go required before P11 |

No agent may proceed past a gate without the named approver's explicit sign-off.

## Delivery Constraints (Ratified 2026-05-06)

- **Full pattern** applies to all deliveries — no abridged variant exists.
- **New asset:** full PRD required at P3. **Update to existing asset:** one-page plan is sufficient.
- **`release-simulation`** is mandatory at P10 when >3 asset files are changed.
- **Retrospective** must be completed within 5 business days of P11, or on-demand if triggered earlier.
- **Scope changes** during delivery must invoke `scope-change-control` before resuming the active phase.

## Artifact Naming

All artifacts follow the convention from the ratified plan:

```
.docs/changes/[yyyymmdd]-[task-slug]-<artifact-type>.md
.docs/plans/[domain]/[task-slug]-plan.md
.docs/plans/[domain]/[task-slug]-acceptance-criteria.md
.docs/plans/[domain]/[task-slug]-test-design.md
.docs/research/[topic]-research.md
.docs/adr/[yyyymmdd]-[title].md
```

## Orchestrator-First Routing

1. Classify the workstream against the phase sequence. Identify the starting phase.
2. Route through `orchestrator` for phase classification and specialist handoff.
3. Each phase must produce its required output artifact before the next phase begins.
4. At each gate, surface the gate condition explicitly and wait for approval before continuing.
5. Record any deviation from the phase sequence as a scope-change event in `.docs/changes/`.

## Reference

Ratified delivery pattern: `.docs/plans/delivery/pattern/delivery-pattern-plan.md`
