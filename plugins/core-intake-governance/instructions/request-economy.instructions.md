---
name: request-economy
description: 'Policy to minimize premium-request usage and context-window consumption while preserving high-confidence reasoning.'
applyTo: '**'
---
# Request Economy Policy

## Global Scope Rationale

- This policy intentionally uses `applyTo: '**'` because request economy controls are cross-cutting guardrails for all agent interactions, regardless of file type.
- Localized applyTo narrowing would create inconsistent behavior and reduce determinism for tool usage and context budget controls.

## Scope

- Do not plan or claim actions that depend on controlling model routing, billing, backend token budgets, or internal orchestration.

## Context Window Budget

- Avoid re-reading unchanged files in the same request.
- Return delta updates instead of restating prior plans and findings.

## Tooling Economy

- Batch read-only discovery into one parallel tool pass when feasible.
- Stop searching after two corroborating results unless risk requires more or confidence remains low.
- Treat corroborating results as sufficient only when they are materially independent.
- Run the smallest relevant verification scope first; expand when change impact or uncertainty is non-local.
- Do not repeat passes for stylistic rewrites.

## Subagent Economy

- Do not invoke subagents for simple or localized tasks.
- Use subagents only for broad research, cross-cutting audits, or uncertain file discovery.
- Require explicit purpose and expected deliverable before each subagent call.
- Workspace-mandated agent hops (e.g. orchestrator intake) are exempt from this economy rule; apply economy to all discretionary subagent calls only.

## Escalation Criteria

- If any trigger is true, suspend economy rules for that task and expand depth and validation.
- Record escalation decisions explicitly before diverging in the active task artifact (or response when none exists), including trigger, rationale, expanded scope, and closure decision.
- Economy rules never override mandatory intake or determinism controls; when risk classification is uncertain or domain novelty is high, treat risk as present and run one bounded expansion pass before closure.

- Security, data-loss, or compliance risk is present.
- Code on a critical or production path is being mutated.
- Evidence is conflicting after bounded checks.
- User requests deeper validation explicitly.
