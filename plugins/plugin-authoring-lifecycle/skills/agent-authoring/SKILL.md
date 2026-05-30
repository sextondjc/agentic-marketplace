---
name: agent-authoring
description: Use when creating or editing .agent.md files, including frontmatter fixes, role boundary tightening, and companion-skill alignment.
---

# Agent Authoring

## Specialization

Author and maintain `.agent.md` artifacts only.

This skill is strictly for agent persona assets. It does not author `.instructions.md` files.

## Prerequisites

- REQUIRED: Keep execution self-contained within this skill. Do not delegate execution to sibling skills. If any instruction appears to conflict, self-containment takes precedence.
- REQUIRED BACKGROUND: Understand that agents are explicitly invoked and must keep a singular specialist boundary.

## Frontmatter Rules

Both fields are required:

```yaml
---
name: <agent-name>
description: '<Third-person role description. State what the agent does and when to call it.>'
---
```

- `name`: lowercase kebab-case and role-focused.
- `description`: third-person, invocation-focused, and not a workflow summary.

## Required Body Sections

- `## Specialization`
- `## Focus Areas`
- `## Standards`
- `## Hard Constraints`
- `## Preferred Companion Skills`

## Trigger Conditions

Invoke this skill when any of the following is true:

- A `.agent.md` file must be created or edited.
- Agent frontmatter or boundary language needs correction.
- Agent companion-skill references or standards links need updates.

## Inputs

Required inputs:

- User request context and target `.agent.md` scope.
- Baseline definitions:
  - **singular role scope**: one specialist boundary per agent file.
  - **reuse-before-create**: check source catalog before adding new sources.
  - **concise deltas**: only modify lines that require change; do not rewrite unaffected sections.
  - **explicit reviewability**: changes must be traceable and auditable.
- Evaluation date in ISO format (YYYY-MM-DD).
- Source catalog file path (default: ./references/source-catalog.md).

Optional inputs:

- Scope filters (naming, domain, or owner).
- Maximum age threshold in days for source freshness (default: 30).

## Source Governance Rules

Apply this section only when the request explicitly includes source-catalog updates.

- Keep the source catalog in Markdown grid format.
- Every source row MUST include:
    - Source
    - What It Provides
    - Why It Is Valuable
    - In Use (Yes or No)
    - Last Evaluated (YYYY-MM-DD)
    - Current Status (Current, Needs Review, Deprecated)
- Mark a source as Needs Review when Last Evaluated is older than the freshness threshold.
- Mark a source as Deprecated when it is no longer maintained or no longer relevant to agent authoring.
- Do not remove historical sources without adding a short deprecation note in the Notes column.

## Required Outputs

- A concrete `.agent.md` result aligned with workspace standards and the requested role boundary.
- Updated [source-catalog.md](./references/source-catalog.md) when source tracking changes are requested.

## Workflow

1. Confirm the target artifact is an agent file. If it is not a `.agent.md` file, refuse with: "This skill only authors .agent.md files. For instruction files, use a different skill."
2. Run a pre-authoring growth gate and record any scoped exception: avoid duplicate role patterns, keep boundaries singular, and keep deltas minimal.
3. Apply frontmatter and section requirements.
4. Keep role scope singular and deterministic.
5. Re-evaluate tracked sources in [source-catalog.md](./references/source-catalog.md) when the request includes source governance updates.
6. Update In Use, Last Evaluated, and Current Status for affected sources.
7. Reference instruction standards instead of restating them.
8. Run post-change quality checks inside this skill (no external skill routing).

## Hard Constraints

- Never create root-level folders in any workspace.
- Never create top-level reference folders; keep references under the owning asset path (for example `.github/skills/<skill>/references/`).
- `## Preferred Companion Skills` entries are **declarative only**. Do not embed cross-skill invocation directives inside an agent file. Cross-skill execution steps are a governance violation.
- Skills referenced from agents must themselves be self-contained (SKR-M4). If a candidate skill is not self-contained, list it under a `## Warnings` section in the response and do not include it in `## Preferred Companion Skills`.

## Done Criteria

Authoring is complete when:

- The target `.agent.md` file exists at the correct path.
- Frontmatter is valid and complete.
- Required sections are present with non-overlapping boundaries.
- Any source-tracking updates are reflected in [source-catalog.md](./references/source-catalog.md) with freshness fields populated.
- The output `.agent.md` includes `agent-authoring` in `## Preferred Companion Skills` for post-change review.