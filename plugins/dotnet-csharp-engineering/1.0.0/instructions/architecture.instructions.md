---
name: architecture
description: 'Consolidated DDD, SOLID, and .NET architecture guidance for lean application development.'
applyTo: '**/*.cs'
---
# Architecture Policy

Keep this file policy-only. Use [SKILL.md](./../skills/domain-design/SKILL.md) for aggregate discovery, domain-event patterns, ACL design, and other on-demand architecture workflows.

## Domain Model Rules

- Model bounded contexts explicitly and keep ubiquitous language consistent within each boundary.
- Aggregates own consistency boundaries and enforce invariants internally.
- Value objects must be immutable and compare by value.
- Cross-aggregate references should use identifiers unless a different consistency model is explicitly justified.

## Repository and Service Rules

- Repositories persist and reconstruct aggregates; they do not host business rules.
- Use Syrx-backed repositories only for .NET data access.
- Application services orchestrate bounded operations and stay free of transport concerns.
- A bounded write operation should inject one owning repository; cross-entity atomic validation belongs in one stored procedure invoked through that repository.
- Services and repositories must not add local `try/catch` behavior when cross-cutting exception handling is provided at the composition root.

## Domain Events and Integration Rules

- Raise domain events only for meaningful state changes.
- Persist state before dispatching domain events.
- Keep event payloads minimal and prefer identifiers over full object graphs.
- Isolate external or legacy integration translation behind an anti-corruption layer.

## Architecture Decisions

- Significant architecture changes require an ADR in `.docs/adr`.
- ADRs must record context, decision, consequences, alternatives, and security implications.

## Routing Notes

- Use [SKILL.md](./../skills/domain-design/SKILL.md) for detailed domain-design workflow.
- Use [SKILL.md](./../skills/adr-generator/SKILL.md) when recording architecture decisions.
- Use [SKILL.md](./../skills/api-design/SKILL.md) for external integration boundary design.

Do not embed procedural implementation guidance in this policy file. Place execution workflows and examples in skill references.


