---
name: data-design
description: Use when designing the data layer for a system — covers schema design, migration planning, data governance requirements, and query optimisation strategy.
---

# Data Design

## Specialization

Design and document the data layer for a system or feature: entity relationships, schema decisions, migration sequencing, data governance controls, and query optimisation strategy. Produces artefacts that database engineers and application engineers can execute against without requiring further data-layer design decisions during implementation.

This skill is distinct from operational DBA work (query tuning against a live system, incident response, backup administration — those belong to the `sql-dba` agent and X09 bundle) and from application-layer data access implementation (`syrx-data-access`). It owns the design phase of the data layer.

## Trigger Conditions

- A new feature requires schema changes and the impact on existing data has not been analysed.
- A migration must be planned with explicit rollback, data integrity, and sequencing decisions.
- Data governance requirements (retention, access control, audit trail, sensitivity classification) must be designed before implementation begins.
- Query performance concerns are identified during design and must be addressed structurally before the schema is implemented.
- An implementation review has identified schema drift or undocumented migration decisions.

## Inputs

- Feature or system description: what data must be stored, queried, and managed.
- Existing schema or ERD (if any — empty is valid for greenfield).
- Data governance requirements: retention policy, sensitivity classification, access control obligations.
- Performance constraints: known query patterns, expected data volumes, and latency targets.
- Originating plan or workstream ID for traceability.

## Required Outputs

| Output | Description |
|---|---|
| Schema design | Entity definitions, attribute types, primary keys, foreign keys, indexes, and constraints. Includes rationale for non-obvious decisions. |
| Migration plan | Ordered migration steps with rollback procedure for each step. Each step: action, risk, validation query, and rollback action. |
| Data governance spec | Sensitivity classification per entity/attribute, retention policy, access control requirements, and audit trail obligations. |
| Query optimisation notes | For identified high-frequency or high-impact queries: access patterns, index recommendations, and any schema trade-offs made to support them. |
| Integrity checklist | Constraints and validation rules that must be enforced at the schema level, not just the application level. |

## Workflow

1. Map the required data: identify entities, attributes, relationships, and cardinalities from the feature description.
2. Design the schema: define tables, columns, types, constraints, and indexes. Record rationale for non-obvious choices.
3. Plan migrations: for each schema change, define the migration step, risk, validation query, and rollback action. Sequence migration steps to be independently executable.
4. Apply governance requirements: classify each entity and sensitive attribute. Define retention, access control, and audit trail requirements.
5. Identify query patterns: for each known high-frequency or high-impact query, verify the schema and index design supports it efficiently.
6. Write the integrity checklist: constraints that must be enforced at the database level.
7. Record the originating plan or workstream ID on all outputs.

## Migration Safety Rules

- Each migration step must be independently revertible before the next step is executed.
- Never combine destructive changes (column drops, table drops) with additive changes in a single migration step.
- Validate data integrity after each migration step before proceeding.
- Rollback actions must be executable without access to the application — they must be pure database operations.

## Done Criteria

- Schema design covers all required entities with types, keys, and constraints documented.
- Migration plan has a rollback action for every step.
- Governance spec classifies all sensitive entities and attributes.
- Query optimisation notes exist for all known high-frequency queries.
- Integrity checklist is present.
- Originating plan or workstream ID is on the output.

## Guardrails

- Do not defer governance classification to implementation — sensitivity classification must be in the design output.
- Do not write migrations without rollback steps — a migration without a rollback is not complete.
- Do not trade off integrity constraints for performance without documenting the trade-off explicitly.

## References

- Related skills: `syrx-data-access`, `sql-server-standards`, `acceptance-governance`, `release-readiness`
- Related agents: `sql-dba` (operational DBA work)
