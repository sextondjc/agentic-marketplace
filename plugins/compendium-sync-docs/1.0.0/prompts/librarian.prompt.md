---
name: librarian
description: 'Prompt for documentation corpus naming, structure curation, and index refresh with .docs as the default root.'
---

# Librarian Curation Prompt

Use the `librarian` skill to assess and curate a workspace documentation corpus.

## Purpose

Produce a consistent, evidence-backed curation report that identifies naming violations, structural misplacements, and duplicate or redundant files before any move, rename, or removal action is taken.

## Default Root Rule

- Use `.docs/` as the documentation root by default.
- Override this default only when the user explicitly provides a different root or when workspace rules require one.

## Scope

- Documentation files under the selected root.
- Folder hierarchy and naming policy conformance.
- Corpus indexing status via `index-docs`.

## Required Actions

1. Load and follow [SKILL.md](./../skills/librarian/SKILL.md) before starting.
2. Resolve documentation root in this order:
   - Explicit user-provided root.
   - Workspace-rule required root.
   - Default `.docs/`.
3. Scan the target tree and build a document manifest.
4. Evaluate naming and structure against librarian rules.
5. Classify curation candidates as Duplicate, Redundant, or Misplaced with confidence and reason.
6. Invoke `index-docs` after the curation pass.
7. Return recommendations only; do not move, rename, or delete files without explicit user approval.

## Output Requirements

Return results in chat using markdown grids in this order.

### Naming Violations Grid

| Path | Type | Violation | Suggested Name |
|---|---|---|---|
| ... | File/Folder | ... | ... |

### Structural Recommendations Grid

| Current Path | Suggested Path | Reason |
|---|---|---|
| ... | ... | ... |

### Curation Candidates Grid

| Path | Category | Confidence | Suggested Action | Reason |
|---|---|---|---|---|
| ... | Duplicate/Redundant/Misplaced | High/Medium/Low | Keep/Move/Rename/Remove Candidate | ... |

### Index Status Grid

| Root | Index Action | Status |
|---|---|---|
| ... | Generated/Refreshed/Skipped | ... |

### Confirmation Gate

- No files will be moved, renamed, or deleted without your approval.

## Artifact Locations

| Artifact | Location |
|---|---|
| Curation report | `.docs/changes/` (user-selected filename) |
| Generated indexes | `<selected-root>/INDEX.md` and child `INDEX.md` files |

