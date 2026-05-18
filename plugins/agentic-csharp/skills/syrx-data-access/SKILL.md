---
name: syrx-data-access
description: Use when implementing or reviewing .NET repository data access that must use Syrx ICommander<TRepository>, explicit parameterized SQL, and project-approved command configuration patterns.
---

# Syrx Data Access Skill

## Overview

Use this skill to implement and review Syrx repository data access in a reusable way across projects, even when repository-specific docs are unavailable.

## Trigger Conditions

- Implementing or reviewing repositories that depend on Syrx.
- Mapping repository methods to SQL commands.
- Choosing builder, JSON, or XML command configuration.
- Applying paging, multi-mapping, or multi-result patterns.
- Verifying tests for repository behavior without live DB access.

## When Not to Use

- EF Core or alternate ORM implementations.
- Generic data-access advice not tied to Syrx.
- Domain/service-layer business logic decisions.

## Source of Truth

Read in this order when behavior is unclear:

1. Skill-local references in `references/`:
   - `references/quick-reference.md`
   - `references/implementation-examples.md`
   - `references/review-checklist.md`
2. Project instructions, when present (for example `/[syrx.instructions.md](./../../instructions/syrx.instructions.md)`).
3. Project reference docs, when present (for example `/.github/skills/<skill-name>/references/`).
4. Syrx framework docs and package documentation available to the project.

If guidance conflicts, prefer:

1. Security and validation rules active in the current project.
2. Project-level coding conventions.
3. Skill-local references as the portable baseline.

## Decision Path

1. Use `ICommander<TRepository>` in repository implementations.
2. Choose command mapping style:
   - Project style: configuration-driven mapping (builder/JSON/XML) with namespace.type.method resolution.
   - App style with command constants: Interface -> Implementation -> CommandStrings -> Installer -> DI.
3. Keep SQL explicit, parameterized, and method-mapped.
4. Register DI and verify with unit tests that mock `ICommander<TRepository>`.

## Detailed Guidance This Skill Owns

This skill is the on-demand destination for Syrx detail that should not live in always-on instructions:

- command mapping style selection,
- multi-mapping and multiple-result-set choices,
- materializer isolation,
- observability and performance evidence,
- repository testing workflow.

Keep the instruction layer limited to mandatory policy. Keep deep implementation and review guidance here.

## Core Rules

- Use explicit, parameterized SQL only.
- No string concatenation or interpolation for SQL.
- Use explicit column lists; avoid `SELECT *`.
- Keep repository code focused on persistence mapping only.
- Validate boundary inputs with Syrx guard semantics.
- Use async APIs and pass `CancellationToken`.
- Prefer paging for list endpoints (`OFFSET/FETCH` on SQL Server).

## Repository Pattern

Define interface -> inject `ICommander<TRepository>` -> call async query/execute methods -> isolate mapping/materialization -> register repository in DI.

## Configuration Patterns

- Select one configuration mode per bounded context and apply it consistently:
   - Configuration-driven mapping (builder/JSON/XML).
   - Command constants plus installer mapping.
- Method names should match configured command keys unless explicitly overridden.
- Keep connection aliases centralized and consistent.
- Use per-command timeout/flags only with evidence.

## Query Patterns

- Simple read/write: `QueryAsync<T>` and `ExecuteAsync(...)`.
- Multi-mapping: use when a joined row must be split into related objects.
- Multiple result sets: use when batching independent sets reduces round trips.
- Avoid N+1 repository loops; batch when feasible.

## Pattern Selection Grid

| Scenario | Preferred Pattern | Why |
|---|---|---|
| Parent plus child rows from one join | Multi-mapping | Compose related objects in one round trip |
| Independent result sets in one request | Multiple result sets | Avoid repeated repository calls |
| Cross-entity validation plus write | Stored procedure | Preserve atomicity inside one owning repository call |
| Reusable domain reconstruction | Materializer helper | Keeps persistence code thin and testable |

## Security and Reliability Checks

- Validate all external input at repository boundaries.
- Keep DB credentials/secrets out of code and logs.
- Log actionable command context (name, duration, row count) without leaking sensitive values.
- Do not swallow database exceptions silently.

## Testing Guidance

- Unit tests: mock `ICommander<TRepository>`; no live DB calls.
- Integration tests: use isolated test databases and deterministic fixtures.

## Review Checklist

- SQL is explicit and parameterized.
- Repository contracts are immutable and guarded.
- Query shape avoids N+1 patterns and unbounded reads.
- Atomic multi-entity writes are not split across repository calls.
- Logging and metrics capture command identity without leaking secrets.

See `references/review-checklist.md` for review criteria and `references/implementation-examples.md` for concrete patterns.

## Anti-Patterns

- Injecting internal command readers directly in application repositories.
- Dynamic SQL table/object name construction from untrusted input.
- Returning unbounded result sets for large collections.
- Mixing domain rules into repository persistence code.
- Using complex mapping patterns without measured need.

## Inputs

- Repository use case and method list.
- Expected SQL operations and result shapes.
- Active project constraints for Syrx configuration style.

## Required Outputs

- Repository implementation guidance aligned to Syrx patterns.
- Parameterized SQL mapping approach per method.
- Verification checklist for security, reliability, and tests.

## Workflow

1. Confirm repository scope and command mapping style.
2. Define parameterized SQL mappings and command resolution.
3. Apply DI, async, and guard requirements.
4. Validate with unit/integration testing guidance.

