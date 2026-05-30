# Determinism Review Scorecard

Use this compact scorecard during Review lane execution to verify deterministic delivery and bounded exploration governance.

## Metadata

| Field | Value |
|---|---|
| Review ID | `<REV-YYYYMMDD-###>` |
| Request / Task ID | `<ID>` |
| Reviewer | `<name>` |
| Date (UTC) | `<YYYY-MM-DD>` |
| Primary Lane | `<Planning|Execution|Review>` |
| Owner Agent/Skill | `<name>` |
| Determinism Mode | `<Default|Bounded Exploration>` |

## Determinism Checklist

Mark each item `Pass`, `Fail`, or `N/A`.

| # | Check | Status | Evidence |
|---|---|---|---|
| D1 | Intake contract includes objective, scope boundaries, required outputs, lane owner, and handoff target. | `<Pass|Fail|N/A>` | `<link or note>` |
| D2 | Delivered outputs match all required outputs with no omissions. | `<Pass|Fail|N/A>` | `<link or note>` |
| D3 | No unapproved scope expansion or silent behavior drift is present. | `<Pass|Fail|N/A>` | `<link or note>` |
| D4 | Route and ownership align with lifecycle governance policy. | `<Pass|Fail|N/A>` | `<link or note>` |
| D5 | Review findings include explicit severity and disposition. | `<Pass|Fail|N/A>` | `<link or note>` |

## Bounded Exploration Checks

Required only when Determinism Mode is `Bounded Exploration`.

| # | Check | Status | Evidence |
|---|---|---|---|
| E1 | Exploration rationale is valid (novelty, ambiguity, or conflicting constraints). | `<Pass|Fail|N/A>` | `<link or note>` |
| E2 | Hypothesis, boundary, and time-box were defined before execution. | `<Pass|Fail|N/A>` | `<link or note>` |
| E3 | Measurable success criteria were defined before execution. | `<Pass|Fail|N/A>` | `<link or note>` |
| E4 | Closure decision is explicit: adopt, discard, or convert to deterministic rule/workflow. | `<Pass|Fail|N/A>` | `<link or note>` |

## Outcome

| Field | Value |
|---|---|
| Overall Result | `<Pass|Fail|Conditional Pass>` |
| Blocking Findings Count | `<number>` |
| Follow-up Required | `<Yes|No>` |
| Follow-up Owner | `<name>` |
| Due Date (UTC) | `<YYYY-MM-DD or N/A>` |

## Notes

- Use concise, auditable evidence references.
- If any D1-D4 check fails, overall result should be `Fail` unless formally waived.