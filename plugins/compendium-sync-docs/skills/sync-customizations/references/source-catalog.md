# Customization Source Catalog

This catalog tracks authoritative sources used to keep workspace `.instructions.md` and `.agent.md` files current and valuable.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [VS Code Copilot Instructions](https://code.visualstudio.com/docs/copilot/copilot-customization) | `.instructions.md` frontmatter fields, `applyTo` semantics, loading model, and scoping rules. | Defines the canonical behavior for how instruction files are discovered and applied in VS Code Copilot. | Yes | 2026-05-28 | Current | Required review source for `applyTo` and frontmatter correctness; the page currently redirects through broader customization overview content. |
| [VS Code Copilot Chat Agents](https://code.visualstudio.com/docs/copilot/chat/chat-agents) | `.agent.md` frontmatter fields, tool restriction syntax, and agent invocation model. | Authoritative source for agent file structure, activation conditions, and behavioral constraints. | Yes | 2026-05-28 | Current | Required review for agent frontmatter and tool permission accuracy; if retrieval intermittently fails, re-check via the customization overview and custom agents pages. |
| [GitHub Copilot Customization Docs](https://docs.github.com/en/copilot/customizing-copilot) | Repository-level customization options, workspace-scoped instructions, and organization policy governance. | Useful for verifying repository-level vs user-level scoping and policy applicability. | Yes | 2026-05-28 | Current | Cross-check when `applyTo` patterns involve CI or repo-level paths; GitHub Docs IA currently emphasizes "Provide context" and MCP navigation. |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
