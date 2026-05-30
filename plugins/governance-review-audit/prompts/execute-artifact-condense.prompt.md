---
name: execute-artifact-condense
description: 'Prompt for invoking skills-authoring plus agent-authoring/instructions-authoring concision mode on one named artifact or a full artifact set, returning recommendation-only grids without applying edits.'
---

# Execute Condense Prompt

Use `skills-authoring` for skill artifacts, `agent-authoring` for agents, and `instructions-authoring` for instructions to generate concise rewrite recommendations.

## Goal

Produce recommendation-only output that makes artifacts shorter without sacrificing intent, specialization, or readability.

## Mode

Pick one mode before starting:

| Mode | Behavior |
|---|---|
| `single` | Review exactly one named artifact. |
| `all` | Review all artifacts matching the selected artifact-type pattern. |

## Inputs

Provide these values at run time:

| Input | Required | Notes |
|---|---|---|
| Review Date (`YYYY-MM-DD`) | Yes | Review timestamp |
| Mode (`single` or `all`) | Yes | Determines target set size |
| Artifact Type (`Skill`/`Agent`/`Instruction`/`Prompt`/`Hub`) | Yes | Determines routing skill |
| Target Artifact Name | Only for `single` | Exact artifact identifier |
| Workspace Root Path | Yes | Scope boundary |
| Maximum reduction target (%) | No | Optional tightening goal |
| Protected sections | No | Sections excluded from rewrite |

## Scope

- Target artifacts are determined by Artifact Type using the skill's Artifact Type Reference.
- Exclude non-selected artifact types from each run.
- Do not apply edits in this prompt; recommendations only.

## Required Actions

1. Resolve artifact type:
   - `Skill`: Load and follow [SKILL.md](./../skills/skills-authoring/SKILL.md)
   - `Agent`: Load and follow [SKILL.md](./../skills/agent-authoring/SKILL.md)
   - `Instruction`: Load and follow [SKILL.md](./../skills/instructions-authoring/SKILL.md)
   - `Prompt`/`Hub`: Load and follow [SKILL.md](./../skills/route-customization/SKILL.md) to determine owning artifact and route accordingly
2. Identify the artifact type and preserve its mandatory sections.
3. Resolve target set:
   - If mode is `single`, review only the selected artifact.
   - If mode is `all`, review all artifacts matching the selected Artifact Type file pattern.
4. For each target artifact, identify verbosity, duplication, and non-essential prose.
5. Draft minimal rewrites that preserve specialization, trigger semantics, required outputs, and workflow fidelity.
6. Run a semantic parity check: purpose, trigger conditions, required outputs, and workflow remain materially equivalent.
7. Produce required grids and final disposition.
8. Route accepted recommendations to the appropriate authoring companion skill and validation handoff companion skill.

## Output Requirements

Return results in Markdown grids using this exact structure.

### Summary Grid

| Metric | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Mode | single/all |
| Artifact Type | Skill/Agent/Instruction/Prompt/Hub |
| Artifacts Reviewed | N |
| Recommendations Proposed | N |
| High-Risk Edits | N |
| Accepted | N |
| Rejected | N |
| Disposition | Proceed/Proceed With Constraints/Do Not Proceed |

### Per-Artifact Recommendation Grid

| Artifact | Type | Section | Current Wording | Proposed Wording | Rationale | Intent Risk | Recommendation Status |
|---|---|---|---|---|---|---|---|
| <artifact-name> | Skill/Agent/Instruction/Prompt/Hub | <section> | <excerpt> | <excerpt> | <why shorter is safe> | Low/Medium/High | Proposed/Accepted/Rejected/No change required |

### Companion-Skill Execution Grid

| Companion Skill | Triggered By | Executed (Yes/No) | Evidence Path | Outcome |
|---|---|---|---|---|
| <audit-skill/audit-agent/audit-instructions/skills-authoring/agent-authoring/instructions-authoring/route-customization> | <accepted recommendation or post-change validation handoff> | Yes/No | <path or N/A for recommendation-only run> | <status> |

### Disposition Constraints Grid

| Constraint | Why It Applies | Required Action | Verification | Owner | Status |
|---|---|---|---|---|---|
| <explicit constraint or N/A> | <reason or N/A> | <enforcement step or N/A> | <how checked or N/A> | <responsible role or N/A> | Open/Met/N/A |

Rules:
- Place this grid immediately before the Final Disposition Statement.
- If disposition is `Proceed With Constraints`, include one or more explicit constraint rows (no `N/A` rows).
- If disposition is `Proceed` or `Do Not Proceed`, include one `N/A` row.

### Final Disposition Statement

- Include one explicit disposition line: `Proceed`, `Proceed With Constraints`, or `Do Not Proceed`.

## Constraints

- Do not change files.
- Preserve specialization and lane boundaries.
- Do not collapse required sections defined by the selected artifact type.
- Do not convert policy rules to workflow steps for instruction artifacts.
- If no recommendations are needed, return `No change required` in the Recommendation Status column.

