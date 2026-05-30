## Integrity Verification

This plugin bundle includes deterministic SHA-256 integrity metadata.

### Metadata Fields

- `pluginVersion`: Semantic version for compatibility tracking.
- `sourceCommit`: Git commit hash used to build this bundle.
- `artifactEntries[*].sha256`: Per-file SHA-256 digest.
- `aggregateDigest`: SHA-256 over canonical `<path>:<sha256>` lines.

### Verify Per-File Digests (PowerShell)

```powershell
$manifest = Get-Content -Raw ./plugin-manifest.json | ConvertFrom-Json
foreach ($entry in $manifest.artifactEntries) {
    $actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $entry.path).Hash.ToLowerInvariant()
    if ($actual -ne $entry.sha256) {
        throw "Digest mismatch: $($entry.path)"
    }
}
Write-Host "Per-file verification passed"
```

### Verify Aggregate Digest (PowerShell)

```powershell
$manifest = Get-Content -Raw ./plugin-manifest.json | ConvertFrom-Json
$lines = $manifest.artifactEntries |
    Sort-Object path |
    ForEach-Object { "{0}:{1}" -f $_.path, $_.sha256 }
$joined = ($lines -join "`n")
$bytes = [System.Text.Encoding]::UTF8.GetBytes($joined)
$hashBytes = [System.Security.Cryptography.SHA256]::Create().ComputeHash($bytes)
$computed = -join ($hashBytes | ForEach-Object { $_.ToString('x2') })
if ($computed -ne $manifest.aggregateDigest) {
    throw "Aggregate digest mismatch"
}
Write-Host "Aggregate verification passed"
```

### Verify Source Commit Exists

```powershell
git cat-file -t <sourceCommit>
```

Expected output: `commit`
