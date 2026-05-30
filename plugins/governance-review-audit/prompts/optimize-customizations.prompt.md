---
name: optimize-customizations
description: 'On-demand prompt to run optimize-customizations for authoring/review quality of agents, instructions, skills, and prompts.'
---

# Optimize Customizations Prompt

Deep-Scan Requirement: when used in governance reporting, evaluate all available customizations across `.github/agents`, `.github/instructions`, `.github/prompts`, and `.github/skills` in one full-workspace pass.

Use the `optimize-customizations` skill to run an on-demand optimization review of customization artifacts.

## Trigger

Invoke this prompt when you are authoring or reviewing any of the following:

- `.github/agents/*.agent.md`
- `.github/instructions/*.instructions.md`
- `.github/prompts/*.prompt.md`
- `.github/skills/*/SKILL.md`

## Required Actions

1. Load and follow [SKILL.md](./../skills/optimize-customizations/SKILL.md).
2. Set scope explicitly to full workspace for governance runs.
3. Evaluate with OPR-M* (MUST) and OPR-S* (SHOULD) standards.
4. Produce an optimization-factor report at `.docs/changes/customization/reviews/governance-audit-types-optimization.md`.
5. Return a consolidated outcomes grid and a ranked remediation grid.
6. Do not apply edits unless the user explicitly asks for remediation.

## Output Requirements

Return results in chat in this order:

### Summary Grid

| Metric | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Artifacts Reviewed | N |
| MUST Failures | N |
| SHOULD Advisories | N |
| Overall Outcome | Pass/Pass With Advisories/Fail |

### Results Grid

| Artifact | Type | Outcome | MUST Failures | SHOULD Advisories | Evidence |
|---|---|---|---:|---:|---|
| <path> | agent/instruction/prompt/skill | Pass/Pass With Advisories/Fail | N | N | <path or line evidence> |

### Ranked Remediation Grid

| ID | Action | Target | Priority |
|---|---|---|---|
| R1 | <change> | <artifact path> | High/Medium/Low |

- If there are no findings, state that explicitly and include residual risks or watch-items.



