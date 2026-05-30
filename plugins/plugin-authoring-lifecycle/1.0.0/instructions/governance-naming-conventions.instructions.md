---
name: governance-naming-conventions
description: 'Asset naming standards for agents, instructions, skills, and prompts to ensure consistency, discoverability, and cross-project portability.'
applyTo: '.github/**/*.md'
---
# Naming Policy

Keep this file policy-only. Use [SKILL.md](./../skills/instructions-authoring/SKILL.md), [SKILL.md](./../skills/skills-authoring/SKILL.md), [SKILL.md](./../skills/agent-authoring/SKILL.md), and [SKILL.md](./../skills/librarian/SKILL.md) for migration playbooks, corpus restructuring, and authoring workflow detail.

## Core Rules

- Prefer short, clear, portable names.
- Avoid abbreviations, conjunction-heavy names, and redundant qualifiers.
- One canonical source wins when naming overlap exists across skills, agents, and instructions.

## Asset Naming Patterns

- Skills: `<verb>-<domain>` or `<noun>-<domain>`.
- Instructions: `<domain>` or `<domain>-<policy>`.
- Agents: `<domain>-<specialist>` unless a single meta-role name is already unambiguous.
- Prompts: task-focused names such as `<verb>-<domain>` or `<domain>-<action>`.
- Catalogs and indexes: descriptive names such as `*-catalog.md` or `*-index.md`; do not use `README.md` for inventory or mapping tables.

## Length and Clarity

- Target most skills and instructions at 12 to 20 characters when practical.
- Target most agents at 12 to 25 characters when practical.
- Names must remain understandable without reading frontmatter.

## `.docs` and `.archive` Naming Rules

- Date prefixes in file or folder names are prohibited.
- Folder names must be lowercase kebab-case.
- Folders that mirror a skill, agent, instruction, or prompt name must exactly match that asset's canonical name, including hyphens for multi-word names.
- The one-word-per-level preference applies to generic documentation folders only; it does not apply to artifact-mirroring folders under `.docs/changes/**`.
- `README.md` is reserved for true folder entry-point guidance only.
- `INDEX.md` is reserved for generated indexes.
- File names must reflect the actual content domain.

## Routing Notes

- Use [SKILL.md](./../skills/librarian/SKILL.md) for documentation-corpus restructuring and naming remediation.
- Use the relevant authoring skill when creating or renaming `.github` customization assets.







