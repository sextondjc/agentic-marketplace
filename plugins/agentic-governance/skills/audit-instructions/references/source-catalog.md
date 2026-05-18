# Skill Source Catalog

This catalog tracks authoritative sources used to keep this skill current and to ground instruction-audit findings that depend on current VS Code custom instructions behavior.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [VS Code Custom Instructions Documentation](https://code.visualstudio.com/docs/copilot/customization/custom-instructions) | Official `.instructions.md` guidance: supported file locations, recursive discovery behavior, optional frontmatter fields (`name`, `description`, `applyTo`), workspace vs user scope, auto-application behavior, and effective authoring guidance. | Canonical platform authority for instruction review. Grounds frontmatter validity, `applyTo` expectations, file placement, and audit recommendations related to discoverability or unexpected application behavior. | Yes | 2026-04-18 | Current | Verified live (page edited 2026-04-15): `.instructions.md` files are discovered from `.github/instructions` recursively by default, `name`/`description`/`applyTo` are optional in the platform, and files without `applyTo` are not auto-applied but can still be attached manually. |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
- Resolve any Needs Review source before publishing source-sensitive findings.