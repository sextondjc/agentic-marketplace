---
name: sql-dba
applyTo: "**/*.sql"
description: 'SQL Server standards for T-SQL files: parameterization, naming, safety, and compatibility rules.'
---

# SQL Server Standards Policy

Keep this file policy-only. Use [SKILL.md](./../skills/sql-server-standards/SKILL.md) for SQL authoring and review workflow detail, naming patterns, and implementation checklists.

## Mandatory Policy

- Always use parameterized SQL for untrusted input; string interpolation in SQL is prohibited.
- Destructive operations and multi-statement writes require explicit transaction safety and rollback-capable validation.
- `SELECT *` is prohibited in production queries; enumerate columns explicitly.
- Query behavior must be deterministic (`TOP` requires `ORDER BY`) and set-based patterns are preferred over cursors.
- SQL scripts must follow approved naming conventions for tables, columns, procedures, keys, and indexes.
- Target SQL Server compatibility rules and avoid deprecated features.
- Apply least privilege and never store plaintext secrets in SQL artifacts.
