---
name: benchmark-orchestrator
description: Use when one BenchmarkDotNet request spans multiple capability areas and needs deterministic intake, explicit phase ownership, and a unified execution contract.
---

# Benchmark Orchestrator

## Specialization

Use this skill to coordinate cross-project BenchmarkDotNet requests from one intake when work spans source curation, experiment design, statistical analysis, CI integration, and quality-gate review.

This skill is specialized for intake, phase ownership, and unified synthesis. It does not replace deep execution guidance provided by individual specialist skills.

## Objective

Produce one deterministic BenchmarkDotNet execution contract from a single intake, with explicit phase ownership, evidence expectations, and completion checks.

## Trigger Conditions

- A benchmarking request spans multiple capability areas (design + stats + CI + review).
- Teams need one intake instead of disconnected benchmark guidance.
- Cross-project reuse matters more than local one-off optimization.
- A performance change requires evidence coverage across design, measurement, and promotion gates.

## Scope Boundaries

In scope:

- Deterministic benchmark intake and phased execution planning.
- Phase-output ownership with exactly one owner per required output.
- Unified execution recommendation for mixed BenchmarkDotNet requests.
- Routing to specialist skills based on request shape classification.

Out of scope:

- Product-specific implementation details unrelated to reusable benchmark patterns.
- Load testing, soak testing, or API-level throughput measurement.
- Generic project governance unrelated to the benchmark objective.

## Capability Catalog

Assign one or more phases based on request shape:

| Phase | Specialist Skill | Trigger |
|---|---|---|
| Source Curation | `benchmark-source-curation` | Guidance needs authoritative source grounding or freshness check |
| Experiment Design | `benchmark-experiment-design` | Benchmark must be designed from scratch or improved |
| Statistical Analysis | `benchmark-statistical-analysis` | Results must be interpreted beyond raw means |
| CI Integration | `benchmark-ci-integration` | Benchmark results must gate PRs or track regressions |
| Profiler Integration | `benchmark-profiler-integration` | Hardware counters, ETW/perf_events, or external profiler correlation is needed |
| Baseline Management | `benchmark-baseline-management` | Baselines must be locked, compared, or governed across commits and releases |
| Quality Gate | `benchmark-quality-gate` | Benchmark suite needs evidence-first release sign-off |

## Inputs

- User objective and target benchmark surface.
- Scope boundaries, environments, and risk level.
- Required outputs, known evidence, and delivery constraints.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness checks.

## Required Outputs

- Intake contract with objective, boundaries, and required outputs.
- Phase-output ownership matrix.
- Unified BenchmarkDotNet execution recommendation.
- Rejected-candidate table with deterministic reason codes.
- Closure check stating whether all required outputs are owned.

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Route one mixed benchmark request | One intake and one phase contract exist |
| L2 Delivery | Coordinate one cross-capability benchmark effort | Every required output has one owning phase |
| L3 Hardening | Support promotion-grade benchmark confidence | Risks, evidence expectations, and blockers are explicit |
| L4 Expert Standardization | Establish reusable BenchmarkDotNet operating model | Reusable intake, ownership, and routing rubric are documented |

## Deterministic Workflow

1. Lock objective, risk boundary, target runtime, and required outputs.
2. Classify the request into one or more capability phases from the catalog.
3. Assign exactly one owner per required output.
4. Reject any phase plan with unowned or multiply owned outputs.
5. Define evidence expectations and handoff criteria between phases.
6. Route to specialist skills; do not reimplement specialist guidance inline.
7. Collect outputs and produce one unified execution recommendation.
8. Confirm closure: all required outputs owned, all evidence expectations met.

## Phase Handoff Contract

Each phase handoff must record:
- Phase name and owning specialist skill.
- Required input artifacts from the previous phase.
- Expected output artifacts for the next phase.
- Acceptance criteria for the handoff to be complete.

## Companion Skills

- `benchmark-source-curation` — source governance and freshness checks.
- `benchmark-experiment-design` — benchmark structure, attributes, and parameterization.
- `benchmark-statistical-analysis` — distribution-aware result interpretation.
- `benchmark-ci-integration` — CI threshold enforcement and artifact storage.
- `benchmark-profiler-integration` — hardware counters, ETW/perf_events, and profiler trace correlation.
- `benchmark-baseline-management` — longitudinal baseline lock, comparison, and governance.
- `benchmark-quality-gate` — evidence-first promotion sign-off.
- `perf-benchmark` — lightweight single-purpose benchmark execution for simple scenarios.


