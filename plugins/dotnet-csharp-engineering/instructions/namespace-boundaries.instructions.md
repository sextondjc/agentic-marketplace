---
name: namespace-boundaries
description: 'Namespace and assembly boundary rules to minimize coupling and keep AI-generated code aligned with layered architecture.'
applyTo: '**/*.cs,**/*.csproj'
---
# Namespace & Assembly Boundaries

Keep this file policy-only. Use [SKILL.md](./../skills/layer-boundaries/SKILL.md) for namespace/assembly implementation workflows, dependency-direction checks, and refactor execution detail.

## Mandatory Policy

- Enforce stable boundaries across `Models`, `Services`, and `Repositories` layers.
- Use feature-first namespaces with explicit layer suffixes: `<RootNamespace>.<Context>.<Subcontext>.<Layer>`.
- Keep project-reference direction one-way: models -> none, services -> models and abstractions, repositories -> models and data access only, hosts/composition roots -> all layers for DI.
- Keep project and namespace naming aligned 1:1 where practical.
- Prevent namespace and type-name collisions; temporary aliases must be documented and later removed.
- Keep one top-level type per `*.cs` file (nested types may share the containing file).

## Good vs Bad Boundary Examples

| Scenario | Good | Bad |
|---|---|---|
| Service depending on repository details | `Application.Services` depends on `Domain.Models` and `Application.Abstractions` only | `Application.Services` references `Infrastructure.Repositories.SqlServer` directly |
| Repository depending on application service | `Infrastructure.Repositories` references `Domain.Models` and data-access abstractions only | `Infrastructure.Repositories` references `Application.Services.OrderService` |
| Composition root dependency direction | Host project wires DI for all layers without leaking host types into lower layers | `Domain.Models` references host-specific startup/configuration classes |

## Rationale Notes

- One-way reference direction preserves replaceability and testability of each layer.
- Feature-first namespaces reduce accidental cross-context coupling as the codebase grows.
- Explicit boundary contracts prevent infrastructure concerns from leaking into domain and application logic.
