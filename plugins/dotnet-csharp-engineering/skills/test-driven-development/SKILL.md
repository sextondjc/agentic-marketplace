---
name: test-driven-development
description: Use when implementing any feature or bugfix, before writing implementation code
---

# Test-Driven Development

## Core Rule

No production code without a failing test first.

## Testing Standards

- Use xUnit and Moq only. FluentAssertions is banned.
- Test method names must follow `{Scenario}{ExpectedBehaviour}`.
- Use AAA pattern and keep one assertion concept per test method.
- Unit test projects must use `{Domain}.Tests.Unit` naming and live under `tests/unit/`.

Examples:

- `<Product>.Orders.Tests.Unit`
- `<Product>.Quality.Tests.Unit`
- `<Product>.Repositories.Tests.Unit`

## Test Folder Structure

Use exactly these category folder names when organizing test projects:

| Folder pattern | Purpose |
|---|---|
| `{Subject}BehaviorTests` | Happy-path integration of domain + endpoint behavior; validates that the full flow produces the correct output for valid inputs. |
| `{Subject}RedPhaseTests` | Contract and invariant tests written red-first; validates guard clauses, error conditions, and state-machine transitions. |
| `{Subject}ModelGuardTests` | Isolation tests for model constructor guards; one test per invalid parameter per model type. |
| `QualityHappyPathTests` | Cross-cutting quality gates for happy-path behaviors (for example, response shape and HTTP status codes). |
| `QualityRedPhaseTests` | Cross-cutting quality gates for error conditions and authorization (for example, RBAC and authentication). |
| `QualityArchitectureTests` | Architecture boundary enforcement: project references, namespace rules, and assembly constraints. |

## Coverage Priorities

Prioritize tests in this order:

1. Domain invariants (model guards).
2. Repository behavior using mocked `ICommander<TRepository>` with no live database calls.
3. Service state-machine transitions and error paths.
4. Endpoint authorization and RBAC gates in quality red-phase tests.

## Guard and Architecture Test Rules

- For invalid input tests, use `Assert.Throws<TException>(() => ...)`.
- Assert exception type only; do not assert exception message text.
- Quality architecture tests must verify stable project reference contracts and namespace rules.
- Update expected architecture-reference sets only when a project-reference change is intentional and reviewed.

## Trigger Conditions

- New features.
- Bug fixes.
- Refactoring with behavior preservation.
- Behavior changes.

## Exceptions

- Throwaway prototypes.
- Generated code.
- Pure configuration files.

Confirm exceptions with the user before bypassing TDD.

## Execution Checklist

| Stage | Required Actions |
|---|---|
| RED | Write one behavior test; run and confirm expected failure reason. |
| GREEN | Implement minimal code for that test only; run targeted test then relevant suite. |
| REFACTOR | Improve structure without behavior changes; rerun tests and keep output clean. |

## Acceptance Checks

- Every new behavior has at least one failing-first test.
- Each failing test was observed before implementation.
- Targeted tests pass after code changes.
- Broader suite remains green.
- No warnings or errors are ignored.

## Rationalization Guardrail

If any test-later rationalization appears, stop and restart with test-first. See [tdd-examples-and-anti-patterns.md](./references/tdd-examples-and-anti-patterns.md) for canonical anti-pattern wording.

## Bugfix Flow

| Step | Action |
|---|---|
| 1 | Reproduce bug with a failing test. |
| 2 | Implement minimum fix. |
| 3 | Confirm test passes and run regression checks. |

Never ship a bugfix without a regression test.

## Required Inputs

- User request context and target scope.
- Existing test framework and project test command.

## Required Outputs

- A concrete implementation path that follows Red-Green-Refactor.
- Verifiable evidence that tests failed first and then passed.

## Workflow

1. Define expected behavior as a test.
2. Verify failing state.
3. Implement minimal production code.
4. Verify passing state.
5. Refactor safely.
6. Repeat for next behavior.

## References

- [README.md](./references/README.md)
- [tdd-examples-and-anti-patterns.md](./references/tdd-examples-and-anti-patterns.md)
