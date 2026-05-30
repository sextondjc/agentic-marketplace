---
name: sql-server-security
description: Use when designing, reviewing, or hardening SQL Server security across permissions, auditing, encryption, surface area, linked access, and operational least privilege.
---

# SQL Server Security

## Specialization

Use this skill to review or design SQL Server security posture with explicit least-privilege decisions across logins, roles, auditing, encryption, network exposure, and privileged operational features.

This skill is for security and hardening decisions, not general SQL authoring or estate-wide monitoring.

## Objective

Produce one bounded security posture assessment or hardening plan with explicit permission, encryption, auditing, and surface-area decisions.

## Trigger Conditions

- A project needs SQL Server security review or hardening.
- Permissions, linked servers, certificates, TDE, or auditing require expert guidance.
- A team needs to reduce SQL Server attack surface or improve compliance posture.
- Privileged DBA operations need least-privilege review before rollout.

## Scope Boundaries

In scope:

- Logins, roles, permissions, contained access, linked-server exposure, and credential use.
- Auditing, network encryption, certificates, and at-rest protection.
- Surface-area reduction and privileged feature review.

Out of scope:

- General application authorization architecture outside SQL Server boundaries.
- Query-tuning decisions unless they create direct security risk.
- Broad release orchestration unless SQL security is one phase in a wider workflow.

## Inputs

- Target instance, database, or project boundary.
- Current or intended authentication and authorization model.
- Compliance, audit, or encryption expectations.
- Known privileged features in use: linked servers, CLR, xp_cmdshell, Agent proxies, external access, or DAC.

## Required Outputs

- Ranked security findings or one hardening plan.
- Explicit least-privilege recommendations.
- Audit and encryption posture summary.
- Surface-area decisions with accepted or rejected features.
- Residual risks, blockers, and owner-ready next actions.

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Review one security surface | One bounded access or hardening issue is assessed |
| L2 Delivery | Harden one project or database boundary | Permissions, encryption, and auditing decisions are explicit |
| L3 Hardening | Reach release-grade SQL security posture | High-risk surface area and privileged features are dispositioned |
| L4 Expert Standardization | Establish reusable SQL security model | A repeatable SQL hardening and evidence rubric is documented |

## Deterministic Workflow

1. Lock the security boundary: instance, database, application surface, or admin workflow.
2. Inventory principals, privilege paths, and privileged features within that boundary.
3. Classify controls into access, encryption, auditing, network, and operational-surface buckets.
4. Rank the highest-risk exposures first: excessive privileges, plaintext secrets, weak encryption posture, hidden cross-server trust, or unbounded surface area.
5. Produce one least-privilege target state with explicit allowed and rejected patterns.
6. Define evidence expectations for auditability and ongoing review.
7. Publish residual risks and owner-ready next actions.

## Hardening Rules

- Prefer role-based, schema-scoped permissions over blanket server or database roles.
- Treat linked servers, external script surfaces, and broad Agent privileges as explicit high-risk decisions.
- Do not normalize plaintext secrets, shared admin accounts, or silent audit gaps.
- Require certificate and key backup posture when encryption features are in scope.
- Reduce surface area before adding compensating detective controls.

## Rejected Candidate Reasons

- `R1`: Violates least privilege.
- `R2`: Increases cross-boundary trust without sufficient control.
- `R3`: Leaves auditability weaker than the target risk level requires.
- `R4`: Depends on manual tribal knowledge instead of durable controls.
- `R5`: Hardening cost exceeds benefit for the bounded scope and risk level.

## L4 Coverage Matrix

| Requested Outcome | Skill Section |
|---|---|
| Permission review | Deterministic Workflow steps 1 to 5 |
| Encryption and audit posture | Required Outputs + Hardening Rules |
| Surface-area control | Hardening Rules |
| Explicit rejected options | Rejected Candidate Reasons |
| Cross-project SQL hardening model | Depth Modes + Pragmatic Stop Rule |

## Reasoning Package

Assumptions:

- SQL Server is one security boundary inside a wider system, not the only security layer.
- The team can distinguish accepted legacy exceptions from target-state controls.

Trade-offs:

- Stronger least-privilege and auditing controls reduce operational convenience.
- Broad hardening can surface hidden application dependencies that slow rollout.

Open blockers:

- Missing privilege inventory or undocumented cross-server dependencies weaken recommendations.
- Unknown certificate backup posture blocks safe encryption expansion.

Recommendation:

- Default to explicit least-privilege design, shrink SQL Server surface area early, and require durable evidence for any exception that preserves elevated access.

## Source Governance Summary

- Active sources, evaluation date, and guidance deltas are tracked in [source-catalog.md](./references/source-catalog.md).
- Freshness threshold defaults to 30 days for active source checks.

## Reference Assets

- Use [security-hardening-decision-template.md](./references/security-hardening-decision-template.md) to record principal inventory, exposure decisions, and residual risks.

## Pragmatic Stop Rule

Stop when the highest-risk privilege and surface-area exposures have explicit target-state decisions, residual risks are named, and the next hardening steps can be assigned without reopening the threat model.

## Done Criteria

- Trigger conditions are satisfied.
- Required outputs are complete.
- Least-privilege, encryption, auditing, and surface-area decisions are explicit.
- Rejected risky patterns are recorded.
- Source catalog is current for this evaluation cycle.
