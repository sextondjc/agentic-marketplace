# Query Tuning Evidence

## Metadata

- Review Date: YYYY-MM-DD
- Database: <database-name>
- Query or Procedure: <name-or-handle>
- Compatibility Level: <level>

## Baseline Grid

| Metric | Before | After | Delta | Notes |
|---|---|---|---|---|
| Duration | <value> | <value> | <delta> | <notes> |
| CPU | <value> | <value> | <delta> | <notes> |
| Logical Reads | <value> | <value> | <delta> | <notes> |
| Writes | <value> | <value> | <delta> | <notes> |
| Memory Grant | <value> | <value> | <delta> | <notes> |
| Wait Profile | <value> | <value> | <delta> | <notes> |

## Bottleneck Classification

- Dominant bottleneck: <classification>
- Evidence: <plan, Query Store, wait, XE, or stats evidence>

## Option Grid

| Option | Result | Reason Code | Notes |
|---|---|---|---|
| <candidate-change> | Chosen/Rejected | R1/R2/R3/R4/R5 | <notes> |

## Chosen Change

- Change: <rewrite/index/stats/plan-stability action>
- Expected Benefit: <benefit>
- Rollback Path: <rollback>

## Regression Notes

- <write-cost, storage, or adjacent-query risk>
