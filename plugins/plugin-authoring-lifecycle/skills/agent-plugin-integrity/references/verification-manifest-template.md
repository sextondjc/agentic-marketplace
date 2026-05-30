# Verification Manifest Template

```json
{
  "pluginId": "plg-xx",
  "pluginVersion": "1.2.3",
  "sourceCommit": "<git-commit-hash>",
  "digestAlgorithm": "SHA-256",
  "generatedAtUtc": "2026-05-30T00:00:00Z",
  "artifactEntries": [
    {
      "path": "relative/path/to/file.md",
      "sha256": "<lowercase-hex>"
    }
  ],
  "aggregateDigest": "<lowercase-hex>"
}
```

## Canonical Aggregate Procedure

1. Sort `artifactEntries` by `path` ascending.
2. Create lines as `<path>:<sha256>`.
3. Join lines with `\n`.
4. Compute SHA-256 of the joined string to produce `aggregateDigest`.

## Verification Checklist

- Recompute SHA-256 for every listed file and compare to `artifactEntries.sha256`.
- Recompute `aggregateDigest` using canonical procedure and compare.
- Confirm `sourceCommit` exists in repository history.
- Mark result as `verified` only when all comparisons match.
