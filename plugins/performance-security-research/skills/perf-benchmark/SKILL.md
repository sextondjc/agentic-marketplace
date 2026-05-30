---
name: perf-benchmark
description: Use when designing, running, or reviewing BenchmarkDotNet performance tests in .NET solutions and workspaces.
---

# BenchmarkDotNet Performance Testing

## Specialization

This skill is specialized for the workflow described in this file and should remain narrowly bounded to that responsibility.

It should not absorb adjacent planning, execution, or review responsibilities that belong to other assets.

## Overview

Use this skill to produce reliable, repeatable, and decision-grade .NET performance benchmarks with BenchmarkDotNet.

Core principle: benchmark for decisions, not vanity numbers.

## Trigger Conditions

Use this skill when you need to:
- Validate whether a code change is actually faster
- Compare implementation options under controlled conditions
- Track regressions with reproducible benchmark baselines
- Convert profiler suspicions into measurable experiments

Do not use this skill for:
- End-to-end load testing, soak testing, or API throughput under concurrency
- One-off stopwatch timing in debug mode

## Benchmark Design Rules

- Benchmark one concern per test method.
- Keep input data explicit and realistic with `[Params]`/`[ParamsSource]`.
- Avoid hidden allocations in benchmark setup code.
- Use `[GlobalSetup]` for expensive one-time preparation.
- Separate cold-start and steady-state scenarios when startup matters.
- Benchmark sync and async paths separately.

## Environment Discipline

- Always run Release builds.
- Prefer dedicated benchmark projects.
- Pin runtime and framework versions explicitly.
- Run on quiet machines (minimal background noise).
- Record CPU model, core count, OS, runtime, and power profile.
- Keep benchmark dependencies stable between comparison runs.

## Recommended Baseline Configuration

Use these defaults unless there is evidence to change them:
- Add `MemoryDiagnoser` for allocation visibility.
- Use a baseline method (`[Benchmark(Baseline = true)]`) for ratio comparisons.
- Use at least one warmup and multiple measurement iterations.
- Keep outliers visible first; remove only with explicit rationale.

## Statistical Interpretation

Treat results as distributions, not single numbers:
- Primary signals: mean/median, error, stddev, and allocation columns.
- Compare both time and allocation impact.
- Large overlap in error bounds implies weak evidence.
- Prefer effect size and consistency over tiny percentage differences.

## Common Pitfalls

- Benchmarking dead-code-eliminated work.
- Benchmarking tiny methods where timer noise dominates.
- Mixing setup cost into measured method accidentally.
- Comparing runs across different hardware/power states.
- Declaring wins from one run without replication.

## CI and Governance

- Keep benchmark execution separate from unit test gates unless required.
- Store benchmark artifacts for trend analysis.
- Fail PR checks only on agreed thresholds and stable benchmark suites.
- Require a benchmark note in change records for performance-sensitive work.

## Minimal Project Setup

```bash
dotnet new console -n MyProject.Benchmarks
dotnet add MyProject.Benchmarks package BenchmarkDotNet
dotnet add MyProject.Benchmarks reference ../MyProject/MyProject.csproj
dotnet run -c Release --project MyProject.Benchmarks
```

## Minimal Benchmark Skeleton

```csharp
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

[MemoryDiagnoser]
public class ParserBenchmarks
{
    [Params(100, 1000)]
    public int Size { get; set; }

    private string _input = string.Empty;

    [GlobalSetup]
    public void Setup()
    {
        _input = new string('x', Size);
    }

    [Benchmark(Baseline = true)]
    public int Current() => _input.Length;

    [Benchmark]
    public int Candidate() => _input.AsSpan().Length;
}

public static class Program
{
    public static void Main(string[] args) => BenchmarkRunner.Run<ParserBenchmarks>();
}
```

## Report Template

Use the [benchmarkdotnet-performance-report-template.md](./references/benchmarkdotnet-performance-report-template.md) for every benchmark report. Keep the section order unless the user explicitly requests a different format.

## Output Expectation

When asked for benchmark guidance, provide:
- Experiment goal
- Benchmark design
- Environment controls
- Result interpretation rubric
- Risk notes and next optimization decision

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.

