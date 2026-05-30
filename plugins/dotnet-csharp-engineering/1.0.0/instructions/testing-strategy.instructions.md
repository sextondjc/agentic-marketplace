---
name: testing-strategy
description: 'Unified testing strategy: naming, patterns, and tooling.'
applyTo: '**/*.cs'
---
# Testing Strategy Policy

Keep this file policy-only. Use [SKILL.md](./../skills/test-driven-development/SKILL.md) for canonical testing workflow, naming rules, structure patterns, and coverage guidance.

## Mandatory Policy

- xUnit and Moq are required; FluentAssertions is prohibited.
- Test names must follow `{Scenario}{ExpectedBehaviour}`.
- Guard tests must assert exception type and not assert exception messages.
- Architecture tests must enforce approved project-reference and namespace boundary contracts.

## Policy Rationale

- FluentAssertions is prohibited to keep assertion style consistent across test suites and avoid mixed assertion dialects during review and maintenance.
- For canonical language-level testing standards, use [csharp.instructions.md](./csharp.instructions.md).

## Cross-Cutting Test Naming

When a test verifies behavior spanning multiple layers or concerns, keep the scenario explicit and the expected result singular.

| Concern Type | Naming Pattern | Example |
|---|---|---|
| Boundary + validation | `{BoundaryScenario}{ExpectedGuardOutcome}` | `CreateOrderWithMissingCustomerIdThrowsArgumentException` |
| Async + cancellation | `{OperationScenario}{ExpectedCancellationOutcome}` | `SyncInvoicesWhenTokenCancelledStopsWithoutPartialCommit` |
| Security + persistence | `{InputScenario}{ExpectedSecurityPersistenceOutcome}` | `SaveProfileWithScriptPayloadStoresSanitizedValue` |

## Rationale Notes

- Cross-cutting names reduce ambiguity when failures occur outside a single layer.
- One expected outcome per test name keeps diagnostics crisp and avoids mixed assertions.

