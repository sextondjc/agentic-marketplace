# SHA-256 Integrity Source Catalog

## Evaluation Metadata

| Field | Value |
|---|---|
| Evaluated On | 2026-05-30 |
| Scope | Deterministic hash integrity workflow for plugin bundles |
| Freshness Threshold | 30 days |

## Sources

| Source | Type | Relevance | Freshness | Actionability |
|---|---|---|---|---|
| NIST FIPS 180-4 (Secure Hash Standard) | Standard | Defines SHA-256 behavior and output characteristics. | Stable | High |
| Workspace plan integrity policy | Internal policy | Requires SHA-256, per-file digest, and aggregate digest evidence. | Current | High |
| Plugin lifecycle execution artifacts | Internal artifacts | Defines manifest provenance and verification expectations. | Current | High |

## Decisions From Sources

| Decision | Rationale |
|---|---|
| Use SHA-256 for file and aggregate digests. | Aligns with current integrity policy and strong hash requirement. |
| Canonicalize path ordering before digest aggregation. | Ensures deterministic reproducibility across environments. |
| Publish reproducible verification steps with expected outputs. | Enables independent user validation and tamper detection. |
