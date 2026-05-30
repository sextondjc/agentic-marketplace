# Skill Source Catalog

This catalog tracks authoritative sources used to keep this skill current and valuable.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [VS Code Custom Agents Documentation](https://code.visualstudio.com/docs/copilot/customization/custom-agents) | Official guidance for creating, structuring, and invoking custom Copilot agents in VS Code, including full frontmatter field reference, handoffs, tool scoping, subagent rules, Claude format support, and file location conventions. | Provides authoritative platform spec for `.agent.md` structure, frontmatter fields, and invocation expectations — the canonical reference for this skill's authoring rules. | Yes | 2026-04-15 | Current | Verified live (page edited 2026-04-15): complete frontmatter table including `tools`, `agents`, `user-invocable`, `disable-model-invocation`, `handoffs`, and `hooks`; `infer` marked deprecated. `.github/agents` and `.claude/agents` folder conventions documented. |
| [VS Code Customization Overview](https://code.visualstudio.com/docs/copilot/customization/overview) | Cross-type taxonomy of all VS Code AI customization options (agents, instructions, skills, prompt files, hooks, MCP), parent repository discovery rules, and Chat Customizations editor guidance. | Provides the authority boundary that defines when to use a custom agent versus a skill, instruction, or prompt file — directly informs role-boundary tightening in this skill. | Yes | 2026-04-15 | Current | Verified live (page edited 2026-04-15): customization scenario table, `chat.useCustomizationsInParentRepositories` setting, monorepo discovery rules, and Chat Customizations editor (preview). |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
