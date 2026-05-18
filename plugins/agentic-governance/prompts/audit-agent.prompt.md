---
name: audit-agent
description: 'On-demand prompt to run audit-agent for one or more workspace .agent.md files with platform-currency-aware quality evaluation and remediation recommendations.'
---

# Audit Agent Prompt

Route this request to `orchestrator`.

Use the `audit-agent` skill to run an on-demand quality review of one or more `.agent.md` files.

## Trigger

Invoke this prompt when any of the following is true:

- A `.agent.md` file was created or modified and needs quality validation.
- A periodic quality audit of workspace agents is requested.
- An agent fails discovery, invocation, or behavior expectations.
- Two agents appear to overlap or contradict each other.
- A platform-currency check is needed to identify deprecated fields or applicable new capabilities.

## Required Inputs

- `Target`: one agent name, a comma-separated list, or `all` to review every `.agent.md` under `.github/agents/`.
- `Review Date`: today's date in ISO format (`YYYY-MM-DD`).

## Required Actions

1. Load and follow [SKILL.md](./../skills/audit-agent/SKILL.md).
2. Resolve the target agent file(s) from `.github/agents/`.
3. Evaluate all AGR-M* (MUST) and AGR-S* (SHOULD) standards with evidence.
4. Consult [source-catalog.md](./../skills/audit-agent/references/source-catalog.md) for AGR-S5 platform-currency checks. Resolve any Needs Review sources before issuing frontmatter recommendations.
5. Load per-agent history from `.docs/changes/agent/history/` and apply the recommendation deny-list.
6. Write per-agent review reports to `.docs/changes/agent/reviews/<agent-name>/review.md` using [audit-agent-report-template.md](./../skills/audit-agent/references/audit-agent-report-template.md).
7. Update per-agent history files.
8. Do not apply edits to agent files unless the user explicitly requests remediation.

## Output Requirements

Return results in chat in this order:

### Summary Grid

| Metric | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Agents Reviewed | N |
| MUST Failures | N |
| SHOULD Advisories | N |
| Conflict Findings | N |
| Overall Outcome | Pass / Pass With Advisories / Fail / Blocked |

### Results Grid

| Agent | Outcome | MUST Failures | SHOULD Advisories | Platform Currency | Conflict Status | Report |
|---|---|---:|---:|---|---|---|
| <agent-name> | Pass/Fail/… | N | N | Current/Needs Update/Blocked | None/Detected | <report path> |

### Ranked Recommendations Grid

| Priority | Agent | Standard | Recommendation |
|---|---|---|---|
| High/Medium/Low | <agent-name> | AGR-M*/AGR-S* | <concise recommendation> |

