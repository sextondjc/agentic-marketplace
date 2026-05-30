---
name: syrx
description: 'Definitive Syrx 2.4.1 repository and SQL Server usage instructions.'
applyTo: '**/*.cs'
---
# Syrx Policy

Keep this file policy-only. Use [SKILL.md](./../skills/syrx-data-access/SKILL.md) for detailed mapping patterns, command configuration choices, testing workflows, and performance trade-offs.

## Repository Placement

- .NET data access must be implemented through Syrx-backed repositories only.
- Repository interfaces and concrete implementations must live in `.Repositories` namespaces and `.Repositories` assemblies.
- The repository interface and its concrete implementation must share the same namespace.
- Do not place direct data access in services, handlers, controllers, or domain types.

## Repository Contract Rules

- Models crossing repository boundaries must be immutable.
- Validate repository-bound inputs at construction time using `Syrx.Validation.Contract` guards.
- Repository methods must remain focused on persistence mapping, not business rules.
- Repository methods must be async and accept `CancellationToken`.

## SQL Rules

- Use explicit, parameterized SQL only.
- Centralize SQL in command mapping assets such as `CommandStrings` or approved configuration-driven command maps.
- Use explicit column lists; do not use `SELECT *`.
- Prefer soft-delete filtering where the model supports soft deletion.

## Atomicity and Error Handling

- Repository methods must not contain local `try/catch` behavior when exception handling is provided cross-cutting.
- When an operation must validate across entity boundaries and write atomically, use one stored procedure through the owning repository.
- Do not replace one atomic repository operation with multiple sequential repository calls.

## Performance and Safety

- Page large result sets and avoid unbounded reads.
- Batch related queries to avoid N+1 access patterns.
- Use optimistic concurrency when updates depend on versioned state.
- Keep SQL injection defenses mandatory through parameterization and static command text.

## Routing Notes

- Use [SKILL.md](./../skills/syrx-data-access/SKILL.md) for multi-mapping, multiple result sets, command configuration style, testing patterns, and review checklists.

