# Reuse and Promotion Matrix

| Scenario | Placement | Required Follow-Up |
|---|---|---|
| Used by one skill only | skill/references/scripts | Link from that skill README or SKILL.md |
| Used by two or more skills | .github/scripts/powershell | Add catalog entry in scripts README |
| Existing shared script fits with minor gaps | Extend shared script | Update usage docs and changelog |
| Inline command appears in multiple workflows | Promote to script asset | Replace inline duplication with script calls |

## Decision Rules

- Prefer extending an existing script over creating a new near-duplicate.
- Promote to shared library only when cross-skill reuse is clear.
- Keep one-off local scripts in skill references/scripts.
