# Prune Doc Artifacts References

## Scripts

- [Find-StaleDocs.ps1](./scripts/Find-StaleDocs.ps1): Non-destructive scanner that finds stale documentation candidates and reports reference counts with suggested actions.

## Usage

From workspace root:

```powershell
./.github/skills/prune-doc-artifacts/references/scripts/Find-StaleDocs.ps1
```

Optional switches:

```powershell
./.github/skills/prune-doc-artifacts/references/scripts/Find-StaleDocs.ps1 -IncludeRefSnapshots -IncludeLegacyReviewDirs -IncludeDuplicateChecklists
```
