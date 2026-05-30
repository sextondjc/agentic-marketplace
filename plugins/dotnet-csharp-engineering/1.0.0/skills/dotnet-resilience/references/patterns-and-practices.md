# Patterns and Practices

## Strategy Selection Grid

| Failure Pattern | Primary Strategy | Supporting Strategy | Guardrails |
|---|---|---|---|
| Short transient faults | Retry with jitter | Timeout | Cap retry count and total time budget. |
| Sustained dependency failure | Circuit breaker | Fallback | Fallback must be semantically valid and explicitly marked degraded. |
| Local saturation | Rate limiter | Timeout | Set queue limits and reject predictably when saturated. |
| Tail latency spikes | Hedging (idempotent only) | Timeout | Limit parallel branches and total hedged budget. |
| Partial response degradation | Fallback | Circuit breaker | Preserve correctness over completeness. |

## Ownership Model

| Concern | Single Owner Rule | Anti-Pattern |
|---|---|---|
| Retry | Exactly one retry strategy per operation path | Nested retries across handler + wrapper |
| Timeout | One total budget authority per path | Competing inner/outer timeout rules |
| Breaker | One breaker for each dependency boundary | Duplicate breakers with different thresholds |
| Rate control | One ingress limiter and optional dependency limiter | Layered uncoordinated limiters |

## Microsoft.Extensions.Resilience Focus Areas

- Pipeline registration and naming conventions.
- DI-friendly pipeline composition.
- HttpClient resilience handler configuration via Microsoft.Extensions.Http.Resilience.
- Standardized telemetry integration through application observability stack.

## Polly Focus Areas

- Explicit strategy composition for retries, timeouts, circuit breakers, rate limits, fallback, and hedging.
- Fine-grained control over predicate-based handling and outcome classification.
- Reusable strategy templates for dependency classes.

## Testing Checklist

| Test Category | What to Validate |
|---|---|
| Retry correctness | Attempt count, jitter behavior, terminal failure classification |
| Timeout behavior | Enforced budget, cancellation propagation, no hung calls |
| Breaker transitions | Open/half-open/closed state transitions and recovery rules |
| Rate limiting | Rejection behavior and queue saturation semantics |
| Fallback correctness | Degraded response integrity and user-visible signaling |
| Hedging safety | Idempotency guarantees and branch budget controls |

## Rollout Checklist

1. Verify strategy ownership map has no duplicates.
2. Verify telemetry dimensions include operation name, dependency, outcome, and strategy events.
3. Roll out behind a feature flag or gradual configuration ramp.
4. Monitor error rate, tail latency, and breaker activity before wider rollout.
5. Recalibrate thresholds using production evidence, not defaults alone.
