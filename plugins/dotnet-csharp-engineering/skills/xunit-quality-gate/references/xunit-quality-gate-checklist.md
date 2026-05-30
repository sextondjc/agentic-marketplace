# xUnit Quality Gate Checklist

Use this checklist when issuing an xUnit quality recommendation.

## Coverage Intent

- Success-path behavior is explicitly covered.
- Failure-path behavior is explicitly covered.
- Boundary and edge conditions are covered or intentionally deferred.

## Fixture and Isolation

- Fixture scope is documented and justified.
- Cleanup strategy is explicit for shared resources.
- Parallelization risk is assessed and mitigated.

## Async and Cancellation

- Async completion behavior is asserted deterministically.
- Cancellation semantics are tested where applicable.
- Async exception behavior is verified.

## Moq Collaboration

- Collaborator seams are intentional and bounded.
- Interaction verification is used only where contract-critical.
- Mock setup is minimal and scenario-specific.

## Determinism and Maintainability

- Tests avoid timing-only assertions.
- Flaky patterns are identified and mitigated.
- Assertions remain behavior-focused and readable.

## Verdict

- Recommendation: `pass` | `pass-with-conditions` | `fail`
- Residual risks:
- Required remediation owners and due dates:
