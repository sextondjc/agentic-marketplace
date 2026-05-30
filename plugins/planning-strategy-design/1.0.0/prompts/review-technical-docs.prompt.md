---
name: review-technical-docs
description: 'Prompt to run a full technical documentation review, update stale docs, create missing docs, and validate links across the workspace.'
---

# Technical Documentation Review Prompt

Route this request to `orchestrator`.

Use the `write-technical-docs` skill as the primary workflow.

## Goal

Review all existing documentation, detect drift against source code, update stale content, create missing pages, and return a trustworthy technical reference documentation set for the full workspace.

## Required Execution Model

| Role/Asset | Use For |
|---|---|
| `plan-researcher` | Inventory-first documentation plan |
| `Explore` | Read-only parallel code scans by path partition |
| `architecture-designer` | Boundary or domain terminology ambiguity |
| `csharp-engineer` | Deep .NET member and behavior interpretation |
| `critical-thinking` | Assumption challenge before final claims |

## Coverage Requirements

- Attempt to document all files in the workspace.
- If a file is excluded, record the reason in coverage reporting.
- Mirror documentation structure to repository structure.
- Prefer updating existing docs in place over replacing files wholesale.

## Output Requirements

Generate or update documentation under `/.docs/components/` with at least:

- `index.md`
- `code-structure.md`
- `coverage-report.md`
- Directory-level indexes reflecting source layout
- File/module/type pages as applicable

## Quality Gates

- Every technical claim must be traceable to code or existing verified docs.
- Any historical comparison must be based on git history (`git log`, `git show`, `git diff`), not local snapshot mirrors.
- No speculative statements.
- All internal links must point to existing files.
- Regenerate index and coverage report after any file additions or moves.
- Explicitly note unresolved evidence gaps.

## Final Report Back to User

Provide a concise final report containing:

- What was created
- What was updated
- What was excluded and why
- Coverage percentage
- Link validation status
- Remaining risks or follow-up items



