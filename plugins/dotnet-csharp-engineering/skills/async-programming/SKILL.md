---
name: async-programming
description: Use when implementing or reviewing async/await and concurrency behavior in .NET code, including ValueTask decisions and streaming backpressure.
---

# Async Programming Execution

## Specialization

Implement and review async and concurrency behavior in .NET code with deterministic safety, bounded concurrency, and measurable performance decisions.

## Scope

This skill covers advanced async and concurrency behavior. Baseline C# conventions are governed by active C# policy.

## Core Rules

- Prefer `Task.WhenAll` for independent I/O operations when aggregate failure semantics are acceptable.
- Use bounded concurrency (`SemaphoreSlim` or channel-based worker limits) for high-fanout workloads.
- Avoid unbounded task creation in loops over external inputs.
- Fire-and-forget tasks are disallowed unless execution is supervised by a managed background service.
- Any detached task execution requires structured exception handling and observable lifecycle signaling.
- Consider `ValueTask` only after measured allocation or throughput evidence.
- Document benchmark evidence before broad `Task` to `ValueTask` migration.
- Do not expose `ValueTask` in APIs where consumers are likely to await multiple times.
- Prefer `IAsyncEnumerable<T>` for large result streaming when consumer-side backpressure is required.
- Ensure cancellation is honored during async enumeration.

## Verification Rules

- Validate concurrency changes with repeatable tests covering cancellation, timeout, and exception propagation.
- Treat verification failures as blocking defects for async behavior changes.

## Trigger Conditions

Use this skill when one or more are true:

- Async throughput, cancellation, or fanout behavior is being changed.
- New streaming behavior (`IAsyncEnumerable<T>`) is introduced.
- `Task`/`ValueTask` choices are being added or revised.
- Fire-and-forget or background execution behavior is proposed or reviewed.

## Inputs

- User request context and target scope.
- Existing async code path or symbols being changed.
- Expected failure semantics and cancellation behavior.

## Required Outputs

- Clear async design decisions for each changed path.
- Verification plan or executed tests covering cancellation, timeout, and exception propagation.
- Evidence summary for any `ValueTask` introduction.

## Workflow

1. Identify async boundaries and classify work as independent I/O, bounded fanout, or streaming.
2. Select concurrency pattern and failure semantics intentionally.
3. Apply cancellation and exception-flow behavior before performance tuning.
4. Add or run verification for cancellation, timeout, and exception propagation.
5. Produce outcome summary including any performance evidence and residual risks.
