# Skill Source Catalog

This catalog tracks authoritative sources used to keep this skill current and to ground prompt-audit findings that depend on current VS Code prompt-file behavior.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [VS Code Prompt Files Documentation](https://code.visualstudio.com/docs/copilot/customization/prompt-files) | Official `.prompt.md` guidance: supported file locations, optional frontmatter fields (`name`, `description`, `argument-hint`, `agent`, `model`, `tools`), Markdown body behavior, prompt invocation patterns, and authoring guidance for references and output instructions. | Canonical platform authority for prompt review. Grounds frontmatter validity, file placement, prompt routing expectations, output-contract recommendations, and audit recommendations related to discoverability or prompt behavior. | Yes | 2026-04-18 | Current | Verified live (page edited 2026-04-15): workspace prompt files live under `.github/prompts`, frontmatter fields are optional at the platform level, prompt files are invoked manually in chat, and the docs recommend explicit output expectations and Markdown links to reused instructions. |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
- Resolve any Needs Review source before publishing source-sensitive findings.