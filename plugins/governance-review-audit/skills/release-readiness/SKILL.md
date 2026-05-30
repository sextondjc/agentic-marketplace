---
name: release-readiness
description: Use before any promotion from one environment to the next — covers gate checklist, rollback validation, smoke test coordination, release evidence collation, and go/no-go sign-off.
---

# Release Readiness

## Specialization

Drive a promotion from code-complete to go/no-go sign-off by producing: a gate checklist result, an evidence bundle, a rollback confirmation, and a named sign-off record.

This skill satisfies the `governance-release.instructions.md` policy requirements. It does not perform deployment — it organises and validates the evidence that authorises deployment.

## Trigger Conditions

- A build artifact is candidate for promotion to any environment (staging, production, canary).
- A release or deployment is scheduled and evidence must be collated before the promotion window.
- A go/no-go review is needed before a release call.
- Rollback readiness must be confirmed explicitly before the promotion proceeds.

## Inputs

- Promotion target: environment name, release ID or version, and originating plan or workstream ID.
- Smoke test results or evidence of their planned execution.
- Security sign-off reference (or explicit note that it is pending).
- Rollback procedure document (or path to it).
- Approval chain: named engineering owner and delivery or product owner.

## Required Outputs

| Output | Description |
|---|---|
| Gate checklist result | Completed checklist covering: build integrity, test evidence, security gate, performance gate (if applicable), rollback doc, and approval chain. Each gate: Pass / Fail / Waived (with waiver reason). |
| Evidence bundle | Named references to each piece of evidence: smoke results, test summary, security sign-off, performance signal (if applicable). |
| Rollback confirmation | Explicit statement that the rollback procedure has been reviewed, is executable, and has an identified owner. |
| Sign-off record | Named approvals with timestamp and role. Records the go/no-go decision. |

## Workflow

1. Confirm promotion target and link to originating plan or workstream ID.
2. Populate the gate checklist: for each gate, retrieve named evidence or record a fail.
3. Validate rollback: confirm the rollback procedure is present, is executable without in-flight context, and has a named owner.
4. Assemble the evidence bundle: list every artifact by name and location.
5. Obtain approvals: record names, roles, and timestamp for each approver.
6. Produce the go/no-go decision: Pass (all gates pass or waived with rationale), Hold (gates open), or No-Go (blocking gate unresolved).
7. If No-Go: document the blocking gate and required resolution before the next review.

## Gate Reference

| Gate | Pass Criteria |
|---|---|
| Build integrity | Artifact produced from a clean pipeline run with no suppressed failures. |
| Test evidence | Unit, integration, and smoke evidence present and dated. |
| Security gate | Security sign-off reference present; no unresolved blocking findings. |
| Performance gate | Signal reviewed against thresholds (waivable if no budget change). |
| Rollback doc | Document exists, is current, and has a named owner. |
| Approval chain | At minimum: one engineering owner and one product or delivery owner named. |

## Done Criteria

- Gate checklist is complete with no open gates (or waivers with recorded rationale).
- Evidence bundle references all required artifacts.
- Rollback confirmation is explicit.
- Sign-off record exists with named approvers, roles, and timestamp.
- Go/no-go decision is recorded.

## References

- Policy: `governance-release.instructions.md`
- Related skills: `operability-design`, `test-design-review`
