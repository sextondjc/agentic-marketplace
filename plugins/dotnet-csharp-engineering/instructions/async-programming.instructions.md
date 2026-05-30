---
name: async-programming
description: 'Consolidated async/await and concurrency guidance with ValueTask policy.'
applyTo: '**/*.cs'
---
# Async Programming Policy

Keep this file policy-only. Use [SKILL.md](./../skills/async-programming/SKILL.md) for async/concurrency implementation workflow, streaming/backpressure decisions, and verification execution detail.

## Scope

This file governs async and concurrency policy for C# code. Baseline C# conventions are governed by `csharp.instructions.md`.

## Mandatory Policy

- Use bounded concurrency for high-fanout work and prohibit unbounded task creation over external inputs.
- Fire-and-forget execution is disallowed unless supervised by managed background services.
- Introduce `ValueTask` only with measured evidence.
- Concurrency changes must include verification for cancellation, timeout, and exception propagation.

## ValueTask Selection Guide

Use `Task` by default. Consider `ValueTask` only when all conditions below are satisfied.

| Decision Question | Use `ValueTask` | Use `Task` |
|---|---|---|
| Is this method on a measured hot path with allocation pressure evidence? | Yes, continue evaluation. | No, keep `Task`. |
| Does the method frequently complete synchronously? | Yes, `ValueTask` may reduce allocations. | No, keep `Task`. |
| Will the result be awaited exactly once by consumers? | Yes, `ValueTask` remains safe. | No or unknown, keep `Task`. |
| Is API simplicity and interoperability more important than micro-allocations? | No, continue with `ValueTask`. | Yes, prefer `Task`. |

## Rationale Notes

- `ValueTask` is a targeted optimization, not a default style choice.
- Misuse of `ValueTask` can increase complexity and create subtle correctness issues.

