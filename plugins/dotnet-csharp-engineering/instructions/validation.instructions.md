---
name: validation
description: 'Standardized Syrx guard usage and validation rationale.'
applyTo: '**/*.cs'
---
# Validation and Guards Policy

Keep this file policy-only. Use [SKILL.md](./../skills/syrx-validation/SKILL.md) for canonical guard patterns, repository-bound model rules, nullability idioms, and examples.

## Mandatory Policy

- Use success-condition guard semantics with `Syrx.Validation.Contract` (`Throw` or `Require`).
- Validate inputs before state mutation.
- Repository-bound models must be immutable and validated at construction/factory boundaries.
- Use precise exception types with clear parameter intent.

## Guard Decision Guide

| Question | If Yes | If No |
|---|---|---|
| Does this value cross a public boundary (API, repository, message handler, constructor/factory)? | Add a guard at the boundary before mutation or persistence. | Continue to next question. |
| Is there an existing upstream guard in the same request path with equivalent constraints? | Reuse upstream contract; avoid duplicate guards in the same layer. | Add a local guard where the invariant first matters. |
| Can invalid input trigger unsafe state, data corruption, or ambiguous behavior? | Guard immediately and fail fast with specific exception intent. | Document why the value is trusted and keep code path explicit. |
| Is this internal derived value proven by prior validated invariants? | Guard is optional; keep invariant reasoning local and readable. | Add guard where derivation assumptions are introduced. |

## Rationale Notes

- Guard placement is boundary-first to keep failures deterministic and easy to diagnose.
- Duplicate guards in the same layer add noise; missing boundary guards add risk.

