# Skill Source Catalog

This catalog tracks authoritative sources used to keep the skills-authoring guidance current and actionable.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [VS Code Agent Skills Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-skills) | GitHub Copilot-specific skill loading model, SKILL.md frontmatter rules, directory discovery behavior, and reference-link expectations. | Canonical platform source for authoring skills that load reliably in VS Code and Copilot tooling. | Yes | 2026-04-19 | Current | Primary authority for workspace-compatible skill structure and metadata limits. |
| [Anthropic Skills Repository](https://github.com/anthropics/skills) | Public examples of skill structures, templates, and reusable execution patterns. | Helpful comparative source for authoring maintainable skills and spotting practical structure patterns beyond the platform baseline. | Yes | 2026-04-19 | Current | Reference-only source; platform-specific authoring requirements still come from VS Code documentation. |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.