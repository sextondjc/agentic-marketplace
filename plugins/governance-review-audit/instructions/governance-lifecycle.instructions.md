---
name: governance-lifecycle
description: 'Defines mandatory Planning, Execution, and Review lane classification and traceable handoff requirements for customization artifacts.'
applyTo: '**/*.md'
---
# Planning, Execution, Review Governance

Keep this file policy-only. Use [SKILL.md](./../skills/route-customization/SKILL.md), [SKILL.md](./../skills/writing-plans/SKILL.md), [SKILL.md](./../skills/task-execution/SKILL.md), [SKILL.md](./../skills/audit-agent/SKILL.md), [SKILL.md](./../skills/audit-instructions/SKILL.md), and [SKILL.md](./../skills/audit-prompts/SKILL.md) for operational workflow detail.

## Lane Taxonomy

- Use exactly three lifecycle lanes: `Planning`, `Execution`, `Review`.
- Assign every agent, instruction, prompt, and skill to one `Primary Lane`.
- Optionally assign one `Secondary Lane` when cross-lane support is intentional.
- Resolve lane conflicts explicitly through phase split; do not leave mixed ownership implicit.
- Any change to the Discipline list in the Phase / Discipline / Lane coverage map (addition or removal) MUST trigger a full matrix revisit before the change is treated as adopted. Record the revisit outcome in the matrix footer and in an ADR or decision log entry. (DEC-PDL-07)

## Catalog Integrity

- Keep lane mappings current in:
  - [agents-discovery-index.md](./../catalogs/agents-discovery-index.md)
  - [instructions-discovery-index.md](./../catalogs/instructions-discovery-index.md)
  - [prompts-discovery-index.md](./../catalogs/prompts-discovery-index.md)
  - [skills-discovery-index.md](./../catalogs/skills-discovery-index.md)
- Update the relevant catalog row in the same change when creating, deleting, or renaming any agent, instruction, prompt, or skill. Omitting this update is a MUST failure (GOV-M3) in the next governance audit and blocks PASSED disposition.
- Skills added to `.github/skills/` MUST have a corresponding row added to `skills-discovery-index.md` in the same change. Skills removed MUST have their row removed in the same change. An unregistered skill or orphaned catalog row is treated as a MUST failure with no grace period.
- Include a one-line rationale for lane assignment in each catalog entry.

## Mandatory Intake Policy

- Every workspace request MUST route through `orchestrator` first.
- `orchestrator` MUST perform intake classification before any specialist or skill execution begins.
- Direct specialist-first execution is prohibited, including obvious single-lane requests.
- `orchestrator` MAY immediately hand off after intake when the destination specialist is clear.

## Orchestrator Boundary

- `orchestrator` is an agent-level intake and routing authority, not a standalone skill.
- This instruction defines mandatory policy; it does not replace orchestrator execution logic or specialist skill contracts.
- Skills provide procedural workflows after orchestrator intake and handoff.

## Determinism Policy

- Determinism is mandatory by default for all requests.
- `orchestrator` MUST produce explicit intake fields before execution: objective, scope boundaries, primary lane, owner, and required outputs.
- `orchestrator` MUST include deterministic candidate selection fields before execution: candidate capabilities, candidate skills, selected target, and rejected candidates with reason codes.
- Specialists and skills MUST execute only the approved scope and required outputs; no silent additions or omissions are allowed.
- Any scope change MUST be recorded as an explicit decision before implementation divergence.
- Rare bounded exploration is allowed only when novelty, ambiguity, or conflicting constraints make deterministic execution likely suboptimal.

## Composition Gate Policy

- Requests that require more than one capability MUST pass a composition gate before execution.
- The composition gate MUST include a phase-output ownership matrix.
- Every required output MUST map to exactly one owning phase.
- If any required output is unowned or multiply owned, execution MUST stop until ownership is corrected.

## Bounded Exploration Requirements

- Exploration runs MUST include a stated hypothesis, strict scope boundary, and time-box.
- Exploration runs MUST define measurable success criteria before execution begins.
- Exploration runs MUST remain governed by the same Planning, Execution, and Review lane controls.
- Exploration runs MUST end with an explicit closure decision: adopt, discard, or convert to deterministic policy/workflow.
- Exploration usage SHOULD remain rare and reviewed for policy drift.

## Planning Output Requirements

- Planning lane outputs must be markdown and grid-first.
- Planning artifacts must include durable handoff context sufficient to resume in a later session.
- Planning artifacts must include explicit IDs for plans, workstreams, and decisions.
- Planning artifacts must define workstream boundaries so execution can proceed in parallel.

## Execution Output Requirements

- Execution outputs must reference the originating plan and workstream IDs.
- Execution must produce concrete artifacts, not planning-only narrative.
- Execution scope changes must be recorded as explicit decisions before implementation divergence.
- Execution outputs must satisfy all requested deliverables with explicit completion status and no omitted mandatory items.

## Review Output Requirements

- Review outputs must evaluate artifacts against active instruction files and acceptance criteria.
- Review outputs must include severity-tagged findings and explicit dispositions.
- Review completion must identify unresolved findings and required follow-up actions.
- Review outputs must verify determinism controls: intake completeness, scope fidelity, and bounded exploration closure where used.
- Review outputs SHOULD use the standard checklist in `.github/skills/governance-audit/references/determinism-review-scorecard.md` for consistent evidence capture.

## Traceability and Governance

- Maintain traceability across lanes from vision to plan to execution to review.
- Prefer deterministic routing and explicit handoffs over ad-hoc mode switching.
- Preserve high-throughput parallel work by keeping lane boundaries explicit and documented.
- Treat this instruction as normative policy; treat agent routing tables as operational examples that must remain consistent with this file.

## Routing Notes

- Use [SKILL.md](./../skills/route-customization/SKILL.md) for lane and artifact-type routing decisions.
- Use [SKILL.md](./../skills/writing-plans/SKILL.md) when planning output is missing.
- Use [SKILL.md](./../skills/task-execution/SKILL.md) or [SKILL.md](./../skills/plans/SKILL.md) for execution workflow.
- Use [SKILL.md](./../skills/audit-agent/SKILL.md), [SKILL.md](./../skills/audit-instructions/SKILL.md), and [SKILL.md](./../skills/audit-prompts/SKILL.md) for item-level review checks by customization type.


