---
name: api-design
description: Use when designing external API integrations with resilient client patterns, DTO contracts, and clear integration boundaries.
---

# API Design Skill

## Specialization

Design external API integrations with resilient client patterns, DTO contracts, and clear integration boundaries.

## Mandatory Inputs

- Language
- Endpoint or API surface
- At least one HTTP verb or operation

Optional inputs:

- Request and response DTOs
- Authentication model
- Resilience requirements such as retry, timeout, circuit breaker, bulkhead, or throttling
- Required tests

## Design Model

Use a three-layer pattern when it adds value:

1. Service: raw transport and protocol handling
2. Manager: orchestration and abstraction
3. Resilience: policy execution and failure handling

## .NET-Specific Rules

- Use `HttpClient` correctly through DI.
- Prefer records for immutable DTOs.
- Validate all public entry points.
- Map errors explicitly instead of leaking transport exceptions blindly.
- Use Polly or the team's current resilience stack when resilience is required.

## Security & Reliability

- Never hardcode secrets.
- Prefer HTTPS.
- Validate outbound URLs and configuration.
- Define timeout, retry, and failure behavior deliberately.

## Trigger Conditions

Invoke this skill when any of the following is true:

- The user asks for API integration design rather than direct implementation.
- The work needs DTO, client-boundary, or resilience guidance for an external API surface.
- The task requires a clear integration boundary before coding begins.

## Inputs

- Required: language, endpoint or API surface, and at least one operation.
- Optional: DTOs, authentication model, resilience constraints, and test expectations.

## Required Outputs

- Integration boundary proposal (service/manager/resilience where applicable).
- DTO contract guidance and error-mapping approach.
- Security and reliability constraints for outbound calls.

## Workflow

1. Confirm API scope and required operations.
2. Select boundary structure and resilience approach.
3. Define DTO contracts and error mapping.
4. Return implementation-ready integration guidance.


