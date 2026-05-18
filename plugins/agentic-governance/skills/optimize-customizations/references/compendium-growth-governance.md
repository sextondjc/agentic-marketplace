# Compendium Growth Governance

Reusable growth guidance for authoring and auditing customization assets in this workspace.

## Objective

Scale the compendium without uncontrolled drift by enforcing one coordinated growth contract across authoring and auditing workflows.

## Outcomes

- Reduce churn by preventing overlapping or speculative assets.
- Reduce rework by validating fit before artifact creation.
- Improve token economy by minimizing duplicate guidance and oversized artifacts.
- Preserve determinism with explicit intake, ownership, and verification checkpoints.

## Growth Principles

1. One capability, one owner: each new rule, template, or workflow has one canonical owning asset.
2. Reuse before create: prefer extending existing references and templates over adding new files.
3. Delta-first updates: modify the smallest viable surface area; avoid broad rewrites.
4. Deterministic intake: every change must declare objective, scope boundaries, and required outputs.
5. Review-coupled authoring: every new authoring pattern must have a corresponding audit check.

## Pre-Authoring Gate

Run these checks before creating or expanding any customization asset:

| Gate | Question | Pass Condition | Action if Fail |
|---|---|---|---|
| G1 Capability fit | Does an existing asset already cover this request shape? | Existing asset can satisfy the request with a bounded update. | Update existing asset; do not create a sibling artifact. |
| G2 Boundary clarity | Is scope singular and lane ownership explicit? | Single objective with clear primary lane ownership. | Split scope or route through intake before editing. |
| G3 Reuse plan | Are reusable references identified? | Shared references are linked and canonical owner is defined. | Create/refresh reusable reference before body edits. |
| G4 Token budget | Is the update concise and non-duplicative? | New wording adds net-new constraints or decisions only. | Remove repetitive narrative and inline duplicates. |
| G5 Auditability | Can reviewers test this deterministically? | Inputs, outputs, and verification checks are explicit. | Add measurable outputs and validation checkpoints. |

## Authoring Pattern

When creating or updating assets:

1. Declare scope delta in one sentence (what changes and what does not).
2. Reuse existing reference assets; add new references only when no canonical owner exists.
3. Record explicit output contracts (files, tables, or checklists expected).
4. Add or tighten deterministic language (`must`, `should`, pass/fail conditions).
5. Add companion audit criteria in the same change or record a blocking follow-up.

## Audit Pattern

During audits, verify growth discipline directly:

1. Duplication check: no redundant assets or repeated policy blocks.
2. Boundary check: no cross-objective scope bleed.
3. Reuse check: shared logic points to canonical references.
4. Economy check: wording is concise and avoids narrative padding.
5. Traceability check: each recommendation maps to a concrete artifact and rule ID.

## Cross-Family Coordination Contract

Use this contract when authoring and auditing are both in scope:

| Contract Item | Authoring Family Responsibility | Auditing Family Responsibility |
|---|---|---|
| Scope contract | Declare objective, boundaries, required outputs. | Verify scope fidelity and detect objective bleed. |
| Reuse contract | Link canonical shared references; avoid copy duplication. | Flag duplicate logic and orphan references. |
| Economy contract | Keep updates delta-first and concise. | Flag verbosity and non-actionable narrative. |
| Determinism contract | Add explicit pass/fail or done checks. | Verify checks are testable and consistently applied. |
| Lifecycle contract | Update catalogs/indexes when assets are added, removed, or renamed. | Verify catalog parity and traceability completeness. |

## Lightweight Metrics

Track these metrics per growth cycle (monthly or per major intake batch):

| Metric | Target Direction |
|---|---|
| New assets created vs updated | Favor updates over net-new assets |
| Duplicate guidance findings | Down over time |
| Average remediation depth | Shift from structural rewrites to targeted edits |
| Audit advisory density | Down over time for repeat categories |
| Token-heavy artifacts requiring pruning | Down over time |

## Anti-Patterns

- Creating near-duplicate skills for adjacent phrasing differences.
- Embedding multi-skill routing logic inside non-orchestrator skills.
- Expanding `applyTo` scopes to solve local gaps.
- Adding policy text that is not testable in audit outputs.
- Copying reference content into multiple SKILL files.

## Completion Checklist

Before closing a growth change:

1. Pre-authoring gate passed or explicit exception recorded.
2. Authoring delta is minimal and references are canonical.
3. Matching audit checks exist or explicit follow-up is recorded.
4. Links resolve and catalogs remain consistent.
5. Churn-reduction rationale is documented in one sentence.
