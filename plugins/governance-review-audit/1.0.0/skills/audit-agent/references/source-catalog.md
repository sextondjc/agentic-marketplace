# Skill Source Catalog

This catalog tracks authoritative sources used to keep this skill current and to ground AGR-S5 (Platform Currency) review findings.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [VS Code Custom Agents Documentation](https://code.visualstudio.com/docs/copilot/customization/custom-agents) | Official `.agent.md` spec: full frontmatter field reference (`name`, `description`, `tools`, `agents`, `model`, `user-invocable`, `disable-model-invocation`, `handoffs`, `hooks`, `target`, `mcp-servers`), deprecated fields (`infer`), Claude agent format, file location conventions, subagent rules, and handoff workflow. | Canonical platform authority for all AGR-S5 checks. Required to verify field currency, deprecated field usage, and available capability expansions when reviewing agent frontmatter. | Yes | 2026-04-15 | Current | Verified live (page edited 2026-04-15): `infer` explicitly deprecated; new fields `handoffs`, `hooks (Preview)`, `disable-model-invocation`, and `agents` array documented. `.github/agents` and `.claude/agents` folder conventions current. |
| [VS Code Customization Overview](https://code.visualstudio.com/docs/copilot/customization/overview) | Cross-type taxonomy of all VS Code AI customization options (agents, instructions, skills, prompt files, hooks, MCP), parent repository discovery rules, and Chat Customizations editor guidance. | Establishes the authority boundary defining when a custom agent is the right artifact versus a skill, instruction, or prompt file — grounds AGR-M1 (Specialization) and AGR-S3 (No Conflict) checks. | Yes | 2026-04-15 | Current | Verified live (page edited 2026-04-15): customization scenario table, `chat.useCustomizationsInParentRepositories` setting, monorepo discovery rules, and Chat Customizations editor (preview). |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
- Resolve any Needs Review source before publishing AGR-S5 findings.
