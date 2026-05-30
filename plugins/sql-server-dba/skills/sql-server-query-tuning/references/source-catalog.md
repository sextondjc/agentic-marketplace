# Source Catalog

Evaluation date: 2026-04-24
Freshness threshold (days): 30

## Active Sources

| Source | URL | Authority | Relevance | Freshness | Actionability | Skill Delta |
|---|---|---|---|---|---|---|
| SQL Server documentation hub | https://learn.microsoft.com/sql/ | Platform guidance | Canonical engine and Query Store behavior | Current as of evaluation date | High | Kept Microsoft Learn as the primary authority for engine semantics |
| Query Tuning Assistant training | https://learn.microsoft.com/training/modules/use-sql-server-query-tuning-assistant/ | Platform guidance | Microsoft-supported regression and upgrade tuning workflow | Current as of evaluation date | Medium | Reinforced regression-aware validation and upgrade-safe tuning |
| Brent Ozar training | https://www.brentozar.com/training/ | Expert practitioner | Query tuning, index tuning, and parameter sniffing patterns | Current as of evaluation date | High | Added explicit option-pruning around parameter sensitivity and index trade-offs |
| Erik Darling | https://www.erikdarling.com/ | Expert practitioner | Deep query optimization and troubleshooting focus | Current as of evaluation date | High | Strengthened focus on smallest viable change and practical tuning evidence |
| SQLPerformance | https://sqlperformance.com/ | Expert practitioner | Optimizer internals, lock behavior, T-SQL behavior, and plan reasoning | Current as of evaluation date | High | Added stronger evidence expectations for cardinality and plan-level reasoning |

## Disposition Rules

- Use Microsoft Learn for canonical product behavior and version support.
- Use practitioner sources for option quality, trade-off framing, and troubleshooting heuristics.
- Re-evaluate when SQL Server major-version features materially change tuning surfaces.
