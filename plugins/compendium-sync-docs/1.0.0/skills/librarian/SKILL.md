---
name: librarian
description: Use when naming, organizing, or curating a workspace document corpus — applying consistent folder hierarchy, naming rules, and deduplication analysis across any workspace.
---

# Librarian

## Specialization

Apply and enforce consistent naming, folder structure, curation rules, and internal link integrity across a workspace documentation corpus. Detect duplicates, redundant files, removable candidates, and broken relative links. Orchestrate this skill to produce navigable indexes.

This skill has one purpose: documentation corpus governance and organization.

## Link Integrity Ownership

- Librarian is the designated owner for documentation link integrity across `.docs` and governance-facing markdown references.
- Every librarian curation pass MUST execute `.github/scripts/powershell/test-governance-link-graph.ps1` and include the result in the Link integrity status output.
- When deterministic repairs are available, librarian MUST apply or propose exact replacements and rerun link validation before closing the pass.
- When deterministic repairs are not available, librarian MUST publish an unresolved-link ledger with owner, target path, and required follow-up action.
- Governance routines should treat unresolved librarian link-integrity findings as blocking for a `PASSED` disposition.

## Naming Rules

These rules apply to all documents and folders recommended or created by this skill.

| Rule | Policy |
|---|---|
| File names | Lowercase, kebab-case (hyphens only). No spaces or underscores. |
| Date prefixes | **PROHIBITED. No exceptions.** Date metadata belongs in file frontmatter or content, never in the filename or folder name. |
| Folder names | Lowercase, single word per level. No camelCase, PascalCase, hyphens, or dots unless the dot is a dotfolder prefix (`.docs`, `.archive`). |
| Compound names | Split into parent/child hierarchy. `GovernanceReports` → `governance/reports`. |
| Hierarchy direction | Least granular → most granular. `plans/feature/auth` not `auth/feature/plans`. |
| File content accuracy | A file's name must reflect its actual content domain. `README.md` is reserved for folder entry-point guides only. Do not name a policy document, index, or report `README.md`. |

## Folder Structure Policy

- One word per folder level, always lowercase.
- Split compound concepts: `changeHistory` → `changes/history`.
- Maximum nesting depth: 4 levels. Flatten when depth would exceed this.
- Root-level folders describe the broadest domain; leaves are the most specific artifact type.

**Standard corpus layout (reference model):**

```
docs/
  reference/     ← static reference material
  plans/         ← implementation plans
  changes/       ← change and review records
  research/      ← research notes
  adr/           ← architectural decision records
  specs/         ← specifications and PRDs
```

Any workspace may vary from this model; the librarian recommends, not mandates, unless the user requests enforcement.

## Workflow

1. Determine the documentation root: default to `.docs/` unless the user or workspace rules specify a different root.
2. Scan the target directory tree and collect all document paths.
3. Pressure-test ambiguous naming or structural decisions against these naming and hierarchy rules before proposing changes.
4. Build a flat manifest: path, title (from H1 or filename), category, word count indicator.
5. Identify candidates in each category:
   - **Duplicate**: same title or near-identical content in two or more files.
   - **Redundant**: content fully superseded by another document already in the corpus.
   - **Misplaced**: file lives in a folder that does not match its content domain.
   - **Name violation**: file or folder name breaks the naming rules above.
  - **Broken link**: relative internal link target does not exist or still points to a superseded path.
6. Produce a curation report (see Output Contract).
7. Run `.github/scripts/powershell/test-governance-link-graph.ps1` and capture counts plus unresolved issue rows.
8. Repair broken relative links when the correct in-workspace target is deterministically identifiable; otherwise report them explicitly for user approval.
9. Generate or refresh `INDEX.md` files across the tree.
10. Do not move, rename, or delete any file without explicit user confirmation.

## Governance Integration

- Cross-reference findings with active governance standards to flag violations.
- Keep `.docs/` planning artifact cleanup decisions explicit in the curation report.
- Flag governance-sensitive documents (ADRs, decision records, ledgers) as keep-by-default.

## Migration Notes

When renaming or restructuring the document corpus:

1. Update the path first.
2. Update internal relative links that point to the old path.
3. Refresh `INDEX.md` files after the move set is complete.
4. Keep dates in document content or frontmatter, never in file or folder names.

## Safety Rules

- Never delete or move files automatically.
- Always produce recommendations in a report before any structural action.
- Treat ADRs, decision records, and historical ledgers as keep-by-default.
- Prefer `rename` and `move` suggestions before `delete` suggestions.
- Confirm with the user once before applying a batch of renames or moves.

## Trigger Conditions

Invoke this skill when any of the following is true:

- A workspace documentation corpus needs consistent naming and folder structure applied.
- Duplicate or redundant documents need to be identified before cleanup.
- A user asks to organize, rename, or restructure documentation without date-based names.
- A new workspace is being set up and needs a canonical folder hierarchy established.
- The corpus has grown organically and coherence must be restored.

## Inputs

- Documentation root path. Default: `.docs/`.
- Workspace root path (or scoped sub-path).
- Optional: focus domain (for example, `docs/` only).
- Optional: user-approved exceptions to naming rules.
- Optional: workspace rule override for documentation root (for example, `docs/`).

## Required Outputs

Return a structured curation report with:

1. **Naming violations** — table of file/folder paths that break naming rules with suggested corrected names.
2. **Structural recommendations** — proposed folder hierarchy changes with before/after paths.
3. **Curation candidates** — table of `Path`, `Category` (Duplicate/Redundant/Misplaced/Broken link), `Confidence`, `SuggestedAction`, `Reason`.
4. **Link integrity status** — list of broken links fixed during review and any unresolved links that still require action.
5. **Index status** — confirmation that index files were generated or refreshed in this pass, or a clear reason they were deferred.
6. **Explicit confirmation gate** — "No files will be moved or renamed without your approval."

## Done Criteria

This skill is complete when:

- All naming violations are identified and corrected names proposed.
- Folder hierarchy is mapped and a proposal is produced.
- Duplicate and redundant candidates are listed with evidence.
- Broken relative links are fixed when the target is clear, or explicitly reported when ambiguous.
- Indexes are refreshed or created as part of this workflow.
- User has been presented with the report and confirmation gate.

