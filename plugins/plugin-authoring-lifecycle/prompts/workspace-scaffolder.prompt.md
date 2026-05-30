---
name: workspace-scaffolder
description: 'Prompt for scaffolding lean .NET project workspace configuration and copilot instructions.'
---

# Project Setup Workflow

Route this request to `orchestrator`.

Use the `scaffold-dotnet` skill as the primary workflow.

Your goal is to create tailored workspace configuration for a new lean .NET project. Gather deep context via a questionnaire, audit the workspace for canonical patterns, curate agent and skill recommendations, and generate a complete project initialization package.

## Pre-Flight

Confirm these inputs before starting:
- `project_name` — Name of the project (e.g., AcmeInventory.API)
- `project_type` — REST API, Console Tool, Background Service, etc.
- `target_framework` — .NET version (e.g., .NET 9, .NET 8 LTS)

Request any missing inputs before proceeding.

## Questionnaire

Use the canonical questionnaire in [workspace-scaffolder-questionnaire.md](./references/workspace-scaffolder-questionnaire.md).

Key rule: do not proceed to analysis until all 12 answers are concrete and implementation-ready.

## Analysis

1. Audit workspace for canonical patterns (Syrx, validation, testing, docs structure).
2. Curate recommended agents and skills by project phase and scope.
3. Identify essential vs deferred instruction files.

## Outputs (Save to `.docs/setup/` + `.github/agents/`)

Required artifacts:

- `.github/agents/project-copilot-instructions.md`
- `.docs/setup/agents-activation.md`
- `.docs/setup/skills-recommendations.md`
- `.docs/setup/docs-baseline.md`
- `.docs/setup/quick-start-checklist.md`

Artifact schemas and examples are defined in the `scaffold-dotnet` skill references and must be followed.

## Workspace Rules

- **Syrx only** — no EF Core or alternate ORMs
- **xUnit + Moq** — no FluentAssertions
- **Documentation root canonical** — plans, research, ADRs, changes all live under `.docs/`
- **Guard semantics** — Syrx `Throw<TException>(condition, ...)` for validation
- **Lean standards** — only document what is unique; reference canonical instruction files for rest

## Guardrails

- Every output is tied to a questionnaire answer or workspace audit
- Every agent/skill recommendation includes rationale
- No irrelevant boilerplate — cut ruthlessly
- No vague non-goals like "Phase 2"; ask for explicit boundary
- Confirm with user before saving files


