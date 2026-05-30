# Customization Type Audit Report

## Metadata

- Audit Date: YYYY-MM-DD
- Reviewer Skill: audit-customization-types
- Scope: all | agents | instructions | prompts | skills | cross-type
- Prior Report: <path or none>

## Storage

- Save this file to `.docs/changes/governance/type-audits/audit-customization-types.md`

## Type Scope Grid

| Type | Included (Yes/No) | Artifact Count | Notes |
|---|---|---:|---|
| agents | Yes/No | <n> | <notes> |
| instructions | Yes/No | <n> | <notes> |
| prompts | Yes/No | <n> | <notes> |
| skills | Yes/No | <n> | <notes> |

## Standards Outcome Grid

| Standard ID | Standard | Result | Evidence | Notes |
|---|---|---|---|---|
| TYP-M1 | Type coverage completeness | Pass/Fail | <evidence> | <notes> |
| TYP-M2 | Interaction matrix completeness | Pass/Fail | <evidence> | <notes> |
| TYP-M3 | Evidence traceability | Pass/Fail | <evidence> | <notes> |
| TYP-M4 | Deterministic disposition contract | Pass/Fail | <evidence> | <notes> |
| TYP-M5 | Severity mapping consistency | Pass/Fail | <evidence> | <notes> |
| TYP-S1 | Same-type non-conflict and non-failure | Pass/Advisory | <evidence> | <notes> |
| TYP-S2 | Cross-type non-conflict and non-failure | Pass/Advisory | <evidence> | <notes> |
| TYP-S3 | Boundary clarity | Pass/Advisory | <evidence> | <notes> |
| TYP-S4 | Catalog and taxonomy parity | Pass/Advisory | <evidence> | <notes> |
| TYP-S5 | Brevity | Pass/Advisory | <evidence> | <notes> |

## Same-Type Interaction Grid

| Pair | Outcome | Conflict Count | Failure Propagation | Evidence | Recommendation ID |
|---|---|---:|---|---|---|
| agent vs agent | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |
| instruction vs instruction | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |
| prompt vs prompt | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |
| skill vs skill | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |

## Cross-Type Interaction Grid

| Pair | Outcome | Conflict Count | Failure Propagation | Evidence | Recommendation ID |
|---|---|---:|---|---|---|
| agent vs instruction | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |
| agent vs prompt | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |
| agent vs skill | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |
| instruction vs prompt | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |
| instruction vs skill | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |
| prompt vs skill | Pass/Advisory/Fail/Blocked | <n> | Yes/No | <path/check IDs> | <REC-### or N/A> |

## Severity Mapping Grid

| Severity | Mapping Rule | Expected Action |
|---|---|---|
| High | Causes confirmed execution failure propagation across type boundary, or unresolved conflict blocks required workflow output. | Immediate remediation and blocking follow-up check required. |
| Medium | Produces non-blocking conflict/drift with material risk of failure if unchanged. | Scheduled remediation with owner and due date. |
| Low | Advisory mismatch or duplication risk without immediate execution failure. | Backlog remediation with periodic verification. |

## Metrics Grid

| Metric | Value |
|---|---|
| Interaction Pairs Evaluated | X of Y |
| MUST Standards Passed | X of Y |
| SHOULD Standards Passed | X of Y |
| Brevity Advisories | <n> |
| Blocking Conflicts Open | <n> |

## Failure Detail Grid

| Failure ID | Pair | Severity | Standard | Description | Evidence | Owner |
|---|---|---|---|---|---|---|
| TYP-001 | <pair> | High/Medium/Low | <TYP-M* / TYP-S*> | <description> | <path/check IDs> | <owner> |

## Ranked Recommendations Grid

| Recommendation ID | Description | Priority | Owner | Status |
|---|---|---|---|---|
| REC-001 | <recommendation> | High/Medium/Low | <owner> | Proposed/Accepted/Rejected/Removed/Implemented |

## Source Governance Grid

| Source Catalog Consulted | Sources Evaluated | Needs Review | Recommendation |
|---|---:|---:|---|
| Yes/No | <n> | <n> | <source-sensitive recommendation> |

## Disposition Grid

| Final Disposition | Rule Applied | Notes |
|---|---|---|
| PASSED / FAILED / PROVISIONAL-FAILED | MUST failures + blocking conflicts rule | <notes> |
