# Source Catalog

Evaluation date: 2026-04-24
Freshness threshold (days): 30

## Active Sources

| Source | URL | Authority | Relevance | Freshness | Actionability | Skill Delta |
|---|---|---|---|---|---|---|
| SQL Server documentation hub | https://learn.microsoft.com/sql/ | Platform guidance | Canonical permissions, auditing, and encryption behavior | Current as of evaluation date | High | Kept Microsoft Learn as the primary authority for hardening decisions |
| Database Engine tutorials | https://learn.microsoft.com/sql/relational-databases/database-engine-tutorials | Platform guidance | Security tutorials including ownership chains and signing procedures | Current as of evaluation date | Medium | Reinforced explicit security-boundary workflow |
| dbatools commands | https://dbatools.io/commands | Community tooling | Repeatable automation for certificates, permissions, audits, and configuration review | Current as of evaluation date | High | Added durable automation and evidence expectations for hardening work |
| SQLskills | https://www.sqlskills.com/ | Expert practitioner | Operational DBA perspective for real-world SQL Server hardening and health checks | Current as of evaluation date | Medium | Strengthened least-privilege and surface-area framing |

## Disposition Rules

- Use Microsoft Learn for canonical control behavior and product limits.
- Use dbatools when the hardening workflow needs repeatable evidence capture.
- Re-evaluate when new SQL Server security features or default changes materially alter the target state.
