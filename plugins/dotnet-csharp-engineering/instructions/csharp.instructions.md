---
name: csharp
description: 'Consolidated C# development, style, and engineering standards.'
applyTo: '**/*.cs,**/*.csproj'
---
# C# Policy

Keep this file policy-only. Use [SKILL.md](./../skills/dotnet-refactor/SKILL.md) for modernization workflow and evidence gates, and [SKILL.md](./../skills/test-driven-development/SKILL.md) for behavior-first implementation flow.

## Language and Tooling

- Target the latest stable C# version supported by the target framework.
- Enable nullable reference types and treat warnings as errors.
- For projects with more than one C# file, use a project-level `Usings.cs` for global imports.
- `Usings.cs` is the only allowed file name for project-wide global imports.
- Prefer file-scoped namespaces.

## Structure and Naming

- Use PascalCase for types and methods, camelCase for locals, and `I`-prefixed interfaces.
- Keep exactly one top-level type per `*.cs` file unless the extra type is nested inside the containing type.
- Minimal API route mappings must live outside `Program.cs` in dedicated endpoint or extension files.
- Namespace type aliases are prohibited.
- Enum names must remain domain-precise and unambiguous.

## Documentation and Design

- Comments must explain design intent, not restate obvious code.
- XML documentation is mandatory on public and internal types, constructors, methods, and properties.
- Model constructors and record constructors may contain only guards and simple assignments.
- Complex parsing, normalization, or calculation logic must be extracted to public utility code with tests.
- Service methods must not accept or return API contract types.

## Async

- Public async methods must end with `Async` and accept `CancellationToken`.
- Do not block on async work.

## Dependencies

- Do not introduce FluentValidation or FluentAssertions.
- Keep abstractions minimal and justified by testing or boundary needs.

## Deprecation and Breaking Change Cadence

- Mark members as `[Obsolete]` before removal and provide a migration hint in the message.
- Maintain at least one planned release cycle between deprecation notice and removal for non-emergency changes.
- Document any breaking change in the relevant `.docs/changes/` artifact with migration steps.
- Prefer additive compatibility shims during transition windows when practical.

## Deprecation Communication Rules

- Include deprecation reason, replacement API, and removal target window in change notes.
- For high-impact removals, add a short upgrade checklist to reduce migration ambiguity.

## Security and Prohibited Patterns

- No secrets in code.
- Validate external inputs before persistence or integration work.
- Use structured logging without leaking secrets or sensitive values.
- Prohibited: sync-over-async, silent catches, culture-dependent parsing without explicit culture, speculative reflection micro-optimizations.

## Routing Notes

- Use [SKILL.md](./../skills/dotnet-refactor/SKILL.md) for modernization sequencing, evidence capture, and refactor depth.
- Use [SKILL.md](./../skills/test-driven-development/SKILL.md) for behavior-first delivery flow.
- Use [validation.instructions.md](./validation.instructions.md) for guard and immutability policy.
- Use [async-programming.instructions.md](./async-programming.instructions.md) for concurrency and ValueTask policy.
- Use [syrx.instructions.md](./syrx.instructions.md) for data-access and repository policy.
- Use [testing-strategy.instructions.md](./testing-strategy.instructions.md) for test policy specifics.

