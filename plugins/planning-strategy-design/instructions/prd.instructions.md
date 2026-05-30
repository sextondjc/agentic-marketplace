---
name: prd
description: 'Merged specification + PRD authoring guidelines.'
applyTo: '.docs/plans/**/*.md,.docs/specs/**/*.md,**/*prd*.md'
---
# Product Specification & PRD Policy

Keep this file policy-only. Use [SKILL.md](./../skills/prd-generator/SKILL.md) for elicitation workflow, templates, drafting sequence, and validation execution detail.

## Scope

Applies to PRD and specification artifacts only. For general technical documentation, use `technical-docs.instructions.md`.

## Mandatory Policy

- All PRD and specification documents must follow unified structure: Overview → Goals → Personas → Functional Requirements → User Stories (GH-###) → Interfaces/Data Contracts → Acceptance Criteria (AC-###) → Metrics → Risks → Dependencies.
- PRD/spec artifacts must be stored in granular folder structures under `.docs/specs/` or `.docs/plans/` (minimum: `<domain>/<workstream>/`).
- Flat placement directly under `.docs/specs/` or `.docs/plans/` is disallowed unless explicitly requested by the user.
- Requirement identifiers are mandatory: REQ-, SEC-, CON-, GUD-, PAT- prefixes; user stories GH-###; acceptance criteria AC-###.
- Acceptance criteria must be binary pass/fail and directly traceable to requirement or story identifiers.
- Required metadata must be validated before generation: title, scope, personas, goals, and constraints.


