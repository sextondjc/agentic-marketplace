# Source Catalog

Evaluation date: 2026-04-24
Freshness threshold (days): 30

## Active Sources

| Source | URL | Authority | Relevance | Freshness | Actionability | Skill Delta |
|---|---|---|---|---|---|---|
| SQL Server documentation hub | https://learn.microsoft.com/sql/ | Platform guidance | Canonical T-SQL, engine, and feature behavior | Current as of evaluation date | High | Confirmed standards should default to Microsoft Learn for syntax and engine rules |
| Transact-SQL reference | https://learn.microsoft.com/sql/t-sql/ | Platform guidance | Parameterization, syntax, compatibility, and statement behavior | Current as of evaluation date | High | Reinforced explicit syntax and version-aware guidance |
| Database Engine tutorials | https://learn.microsoft.com/sql/relational-databases/database-engine-tutorials | Platform guidance | Stepwise operational examples for safe baseline behavior | Current as of evaluation date | Medium | Strengthened deterministic workflow expectations |
| VS Code customization overview | https://code.visualstudio.com/docs/copilot/customization/overview | Platform guidance | Confirms reusable skill packaging and discoverability model | Current as of evaluation date | Medium | Kept this skill focused and self-contained for cross-project reuse |

## Disposition Rules

- Keep official Microsoft SQL sources as the canonical authority for syntax and compatibility.
- Re-evaluate this catalog whenever SQL Server version targets or workspace customization rules change.
- Record any standards change as a concrete skill delta during refresh cycles.
