# Source Catalog

Evaluation date: 2026-04-24
Freshness threshold (days): 30

## Active Sources

| Source | URL | Authority | Relevance | Freshness | Actionability | Skill Delta |
|---|---|---|---|---|---|---|
| SQL Server documentation hub | https://learn.microsoft.com/sql/ | Platform guidance | Canonical DMV, XE, and engine feature behavior | Current as of evaluation date | High | Kept first-party telemetry as the top evidence tier |
| Database Engine tutorials | https://learn.microsoft.com/sql/relational-databases/database-engine-tutorials | Platform guidance | Baseline operational and tuning walkthroughs | Current as of evaluation date | Medium | Strengthened stepwise triage flow |
| Glenn's SQL Server Performance resources | https://glennsqlperformance.com/resources/ | Expert practitioner | Diagnostic query packs, notebooks, and version-matched health checks | Current as of evaluation date | High | Added explicit evidence ladder and diagnostic query pack support |
| SQLskills | https://www.sqlskills.com/ | Expert practitioner | High-signal performance, recovery, and troubleshooting expertise | Current as of evaluation date | High | Reinforced bottleneck classification and escalation discipline |
| dbatools commands | https://dbatools.io/commands | Community tooling | Repeatable evidence collection and diagnostic automation | Current as of evaluation date | High | Added trusted admin-tool output as a supported evidence surface |

## Disposition Rules

- Use Microsoft Learn for canonical engine behavior.
- Use Glenn Berry and SQLskills for diagnostic interpretation patterns.
- Use dbatools as the preferred automation surface when operational evidence gathering must be repeatable.
