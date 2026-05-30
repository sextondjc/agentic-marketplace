---
name: dotnet-resilience
description: Use when designing, implementing, or reviewing .NET distributed-system resiliency with Microsoft.Extensions.Resilience and Polly, including safe strategy composition and failure-mode validation.
---

# .NET Resilience Skill

## Specialization

Provide expert, implementation-ready guidance for resilient .NET distributed systems using Microsoft.Extensions.Resilience namespace features and Polly without conflicting policy stacks.

## Framework Scope

- Primary framework 1: Microsoft.Extensions.Resilience and subnamespaces.
- Primary framework 2: Polly.
- Scope boundary: favor first-party integration points in Microsoft.Extensions.* for application wiring, and use Polly strategy composition where explicit pipeline control is needed.

## Trigger Conditions

- You are adding or reviewing retries, timeouts, circuit breakers, rate limiting, fallback, or hedging.
- You are registering resilience behavior via DI, HttpClientFactory, or named/keyed pipelines.
- You need a clear rule to avoid double-wrapping the same operation with overlapping resilience strategies.
- You need production-safe observability, tuning, and failure-mode tests.

## Non-Conflict Rules (Mandatory)

- Use one logical pipeline per operation path; do not stack parallel retry/circuit-breaker policies from different integration layers on the same call chain.
- When Microsoft.Extensions.Http.Resilience handlers are used for a HttpClient path, avoid adding a second independent outer resilience wrapper around the same outbound call unless a specific, documented separation of concerns exists.
- Keep retry ownership explicit: one owner per failure mode.
- Keep timeout ownership explicit: one budget authority per operation path.
- Do not introduce additional resiliency libraries in generated guidance unless the intake gate in [library-intake-gate.md](./references/library-intake-gate.md) is completed and user-approved.

## Core Patterns

See [patterns-and-practices.md](./references/patterns-and-practices.md) for the complete catalog and decision matrix.

Recommended baseline sequence for distributed calls:

1. Classify failure modes (transient, persistent, throttling, partial outage, total outage).
2. Define SLO-aligned latency budget per operation.
3. Select strategy set (retry, timeout, circuit breaker, rate limiter, fallback, hedging) with one explicit owner each.
4. Register pipeline in DI with deterministic naming.
5. Emit telemetry with operation identity and outcome dimensions.
6. Validate with targeted chaos/fault tests before rollout.

## Implementation Guidance

- Prefer named pipelines for shared cross-service semantics and keyed pipelines for tenant/workload-specific tuning.
- Use bounded retries with jitter for transient failures.
- Use circuit breakers to protect dependencies during sustained fault windows.
- Use rate limiting and concurrency controls to protect local resources.
- Use fallback only with safe, semantically valid degraded responses.
- Use hedging only for idempotent operations and controlled fan-out budgets.

## Observability and Safety

- Emit structured logs and metrics for attempts, final outcome, breaker transitions, fallback activations, and hedged branch outcomes.
- Never log secrets, tokens, or sensitive payload content.
- Keep resilience configuration externalized (app settings or approved config providers), not hardcoded.
- Validate all external endpoints and user-provided URL inputs.

## Additional Library Intake Policy

- Default state: no extra resiliency libraries beyond Microsoft.Extensions.Resilience and Polly.
- Candidate additions are evaluation-only until approved by the user.
- Use [library-intake-gate.md](./references/library-intake-gate.md) to document compatibility, value, and conflict risk before any reference is added to this skill.

## Inputs

Required:
- Operation type and idempotency profile.
- Dependency type (HTTP, message broker, cache, database, internal RPC).
- Target latency and error budget constraints.

Optional:
- Existing retry/timeout ownership details.
- Current production telemetry and failure snapshots.
- Regulatory or data-handling constraints.

## Required Outputs

- A proposed resilience design with one pipeline owner per strategy type. 
- A strategy mapping table with rationale per failure mode.
- Validation checklist for tests, telemetry, and rollout safety.
- If non-core libraries are requested: a completed intake gate marked Proposed (not Approved unless the user confirms).

## Workflow

1. Gather failure modes, latency budgets, idempotency, and dependency criticality.
2. Choose Microsoft.Extensions.Resilience integration points and Polly strategies for the target operation path.
3. Build a non-conflicting strategy map using [patterns-and-practices.md](./references/patterns-and-practices.md).
4. Validate ownership conflicts (retry and timeout especially) before implementation.
5. Produce implementation guidance and telemetry/test requirements.
6. If a new library is proposed, complete [library-intake-gate.md](./references/library-intake-gate.md) and stop at evaluation until user approval is explicit.
