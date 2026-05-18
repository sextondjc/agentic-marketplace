---
name: dotnet-refactor
description: Use when modernizing .NET code with safe, behavior-preserving improvements such as nullable adoption and obsolete API cleanup.
---

# .NET Modernization Skill

## Specialization

This skill is specialized for the workflow described in this file and should remain narrowly bounded to that responsibility.

It should not absorb adjacent planning, execution, or review responsibilities that belong to other assets.

## Scope

Apply focused cleanup and modernization passes that improve maintainability, safety, and performance without introducing unnecessary layers.

## Rules

- Preserve behavior unless the task explicitly changes behavior.
- Keep changes small and verifiable.
- Prefer measurable improvements over stylistic churn.
- Add or adjust tests when public behavior changes.

## Typical Tasks

- Remove obsolete patterns and APIs.
- Correct async and cancellation usage.
- Improve nullability annotations.
- Reduce warnings and analyzer findings.
- Replace legacy syntax with modern, readable C# where supported by the target framework.

## Modernization Workflow

1. Inventory the legacy construct or smell being targeted.
2. Confirm the change is behavior-preserving unless the request explicitly says otherwise.
3. Prefer automated or mechanical refactors in small batches.
4. Re-run tests and compare warnings, analyzer output, or benchmark evidence as appropriate.
5. Escalate to ADR or architecture review when the change stops being purely local modernization.

## Evidence Gates

- Do not introduce `ValueTask`, `Span<T>`, pooling, or similar performance-sensitive changes without measurement.
- Keep before/after evidence when the change claims performance, warning reduction, or modernization benefit.
- If a refactor touches public behavior, tests must prove the preserved contract.

## Trigger Conditions

Invoke this skill when any of the following is true:

- The user wants safe, behavior-preserving .NET modernization work.
- Nullable cleanup, obsolete API removal, or similar refactoring is required.
- A focused modernization pass is needed without broader redesign.

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.

