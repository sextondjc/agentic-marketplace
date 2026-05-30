# Skill Source Catalog

This catalog tracks authoritative sources used to keep workspace skills current and valuable.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [Agent Skills](https://agentskills.io/home) | Open standard context, portability goals, and specification entry points. | Defines cross-agent interoperability expectations and keeps skill design vendor-neutral. | Yes | 2026-05-28 | Current | Verified live: open standard emphasis, cross-tool portability, growing adoption list, and active community channel (Discord + GitHub discussions). |
| [Anthropic Skills Repository](https://github.com/anthropics/skills) | Real-world reference implementations, templates, and evolving examples. | Provides practical patterns and anti-pattern signals from a high-volume public skill set. | Yes | 2026-05-28 | Current | Verified live: active repository with recent commits, template/spec folders, and explicit disclaimer to test skills in target environments. |
| [Claude Support: How to Create Custom Skills](https://support.claude.com/en/articles/12512198-how-to-create-custom-skills) | Platform usage constraints, metadata expectations, packaging/testing guidance, and security reminders. | Clarifies operational behavior and invocation-quality factors for custom skills. | Yes | 2026-05-28 | Current | Verified live: required metadata fields, focused-skill guidance, testing checklist, and security cautions. Platform-specific limit remains: description max 200 chars for Claude Help Center guidance. |
| [VS Code Agent Skills Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-skills) | GitHub Copilot-specific skill loading model, SKILL.md frontmatter options, directory discovery rules, and slash-command behavior. | Required for workspace compatibility and reliable invocation in VS Code and Copilot tooling. | Yes | 2026-05-28 | Current | Verified live (page edited 2026-04-08): progressive loading model, skill locations, required frontmatter, optional fields (`argument-hint`, `user-invocable`, `disable-model-invocation`), and Copilot limits (name max 64, description max 1024). |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
