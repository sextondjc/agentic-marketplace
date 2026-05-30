# Current Test Coverage Scripts

These scripts are reusable assets for the `current-test-coverage` skill.

## Scripts

- `invoke-quality-gate.ps1`
  - Purpose: self-contained quality gate that runs restore, build, and full-solution coverage, then enforces line and branch coverage thresholds using this skill's aggregation script.
  - Usage:
    - `pwsh ./.github/skills/current-test-coverage/references/scripts/invoke-quality-gate.ps1`
    - `pwsh ./.github/skills/current-test-coverage/references/scripts/invoke-quality-gate.ps1 -WorkspaceRoot c:/Projects/Rook -SolutionPath Rook.sln -LineCoverageThreshold 60 -BranchCoverageThreshold 60`

- `invoke-full-solution-coverage.ps1`
  - Purpose: runs the built-in full-solution fallback coverage command against `Rook.sln`, writes artifacts under a deterministic directory, captures console output to a log, and returns run metadata.
  - Usage:
    - `pwsh ./.github/skills/current-test-coverage/references/scripts/invoke-full-solution-coverage.ps1`
    - `pwsh ./.github/skills/current-test-coverage/references/scripts/invoke-full-solution-coverage.ps1 -WorkspaceRoot c:/Projects/Rook -ArtifactsDirectory .github/skills/governance-health-overview/references/.artifacts/full-solution-coverage`
    - `pwsh ./.github/skills/current-test-coverage/references/scripts/invoke-full-solution-coverage.ps1 -AllowTestFailures`

- `get-cobertura-coverage-summary.ps1`
  - Purpose: aggregates Cobertura files from a coverage artifact root, deduplicates line and branch counts, and produces aggregate plus per-package coverage objects.
  - Usage:
    - `pwsh ./.github/skills/current-test-coverage/references/scripts/get-cobertura-coverage-summary.ps1`
    - `pwsh ./.github/skills/current-test-coverage/references/scripts/get-cobertura-coverage-summary.ps1 -CoverageRoot c:/Projects/Rook/.github/skills/governance-health-overview/references/.artifacts/full-solution-coverage`

## Notes

- Prefer `invoke-quality-gate.ps1` before using the fallback scripts.
- These scripts exist because built-in commands do not reliably emit deduplicated aggregate and per-package coverage summaries in one reusable step.