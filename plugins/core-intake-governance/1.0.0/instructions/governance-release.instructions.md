---
name: governance-release
description: 'Mandatory rules for release artifact evidence, approval chain, rollback documentation, and release notes format.'
applyTo: '**'
---
# Release Governance Policy

## Global Scope Rationale

- This policy uses `applyTo: '**'` because release governance obligations apply to all artifact types and delivery lanes, not only to pipeline configuration files.
- Narrower scoping would create enforcement gaps during design, implementation, and review phases where release obligations are first established.

## Evidence Requirements

- Every promotion decision must be supported by a named evidence bundle: smoke results, gate checklist outcome, and security sign-off reference.
- Evidence must exist as durable artifacts before promotion executes. Notes or verbal summaries do not satisfy this requirement.
- Release evidence must be traceable to the originating plan or workstream ID.

## Approval Chain

- Identify the approval chain before scheduling any promotion. At minimum: one engineering owner and one product or delivery owner.
- Approvals must be recorded as named, timestamped entries in a release artifact, not inferred from chat history.
- Security-sensitive or high-risk promotions require an explicit security sign-off referencing the evidence artifact.

## Rollback Documentation

- A rollback procedure must exist and be reviewed before every promotion.
- Rollback steps must be concrete and executable without reference to in-flight context.
- The rollback owner must be identified by name or role, not left implicit.

## Release Notes Format

- Release notes must identify: scope included, known issues, rollback reference, and approval evidence reference.
- Release notes must be written before promotion begins, not after.
- Scope must distinguish delivered items from deferred or descoped items.

## Applicability

- Use the `release-readiness` skill to execute the workflow that satisfies these requirements.
- These rules apply to all release types: feature releases, hotfixes, configuration promotions, and dependency upgrades.
