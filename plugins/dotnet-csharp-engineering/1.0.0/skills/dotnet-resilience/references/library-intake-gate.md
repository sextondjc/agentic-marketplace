# Library Intake Gate

Use this gate before introducing any resiliency library beyond Microsoft.Extensions.Resilience and Polly.

## Decision State Rules

- Proposed: evaluation complete, waiting for user decision.
- Approved: user explicitly approved for inclusion in skill guidance.
- Rejected: user rejected or conflict risk unacceptable.

No library can be referenced in primary guidance while in Proposed state.

## Intake Grid

| Intake ID | Candidate Library | Purpose | Overlap With Existing Strategies | Conflict Risk | Net New Capability | Operational Cost | Recommendation | User Decision | State |
|---|---|---|---|---|---|---|---|---|---|
| LIB-000 | None | Baseline | N/A | None | N/A | N/A | Keep baseline frameworks only | N/A | Baseline |

## Compatibility Checklist

| Check | Pass/Fail | Notes |
|---|---|---|
| No duplicate retry ownership with existing pipelines | TBD | |
| No duplicate timeout ownership with existing pipelines | TBD | |
| No conflicting circuit-breaker semantics | TBD | |
| Telemetry model can remain unified | TBD | |
| Does not weaken security posture | TBD | |
| Adds clear capability unavailable in baseline | TBD | |

## Evaluation Workflow

1. Record a new Intake ID.
2. Map candidate features against existing Microsoft.Extensions.Resilience and Polly capabilities.
3. Identify conflict vectors (ownership, telemetry, execution order ambiguity, operational complexity).
4. Mark recommendation as Proposed only.
5. Wait for explicit user approval before any skill references are added.
