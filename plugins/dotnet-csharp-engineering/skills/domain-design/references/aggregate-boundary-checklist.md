# Aggregate Boundary Checklist

## Invariants

- Are all atomic invariants enforced within one aggregate root?
- Are cross-aggregate invariants handled asynchronously or by explicit orchestration?

## Boundaries

- Does each aggregate own a clear transactional consistency boundary?
- Are cross-aggregate references by identifier unless explicitly justified?

## Behavior

- Are mutation methods intent-based rather than setter-based?
- Are value objects immutable and compared by value?

## Persistence

- Is repository scope limited to aggregate persistence and reconstruction?
- Are business rules kept out of repository implementations?

## Integration

- Is external translation isolated in an anti-corruption layer?
- Is external data validated before entering the domain model?
