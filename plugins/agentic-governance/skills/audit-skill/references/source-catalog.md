# Skill Source Catalog

This catalog tracks authoritative sources used to keep this skill current and to ground skill-audit recommendations.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [VS Code Agent Skills Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-skills) | Official skill discovery, structure, and usage patterns for VS Code Copilot skills, including references patterns and discoverability guidance. | Canonical platform authority for skill behavior expectations and lifecycle alignment during skill reviews. | Yes | 2026-04-18 | Current | Primary source for workspace skill governance baseline in VS Code environments. |
| [VS Code Copilot Customization Overview](https://code.visualstudio.com/docs/copilot/copilot-customization) | Cross-type customization model and boundaries among instructions, prompts, agents, and skills. | Ensures `audit-skill` recommendations preserve correct customization boundaries and avoid cross-type drift. | Yes | 2026-04-18 | Current | Used to validate specialization and avoid mixed-responsibility recommendations. |
| [Anthropic Skills Repository](https://github.com/anthropics/skills) | Public examples of skill structures and reusable execution patterns. | Helpful comparative source for identifying maintainable skill patterns and anti-patterns during reviews. | Yes | 2026-04-18 | Current | Reference-only source; platform-specific rules still come from VS Code docs. |
| [Agent Skills](https://agentskills.io/home) | Curated skill examples and community patterns for prompt/skill composition. | Supports pattern benchmarking when evaluating clarity, trigger quality, and reuse opportunities. | Yes | 2026-04-18 | Current | Supplemental source; use with caution and reconcile against canonical platform guidance. |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
- Resolve any Needs Review source before publishing final recommendations.