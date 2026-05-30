# BenchmarkDotNet Performance Report

## 1. Objective and Decision Context

- Benchmark objective:
- Decision being informed:
- Success criteria:
- Scope boundaries (in/out):

## 2. Benchmark Design

- Benchmark project and target assembly:
- Runtime/job configuration:
- Benchmark methods:
- Baseline method:
- Parameters (`[Params]` / `[ParamsSource]`):
- Diagnosers enabled (for example: `MemoryDiagnoser`):
- Setup/cleanup strategy (`[GlobalSetup]`, `[IterationSetup]`, etc.):

## 3. Execution Environment

- Machine identifier:
- CPU model and logical cores:
- RAM:
- OS and version:
- .NET SDK/runtime version:
- Build configuration (`Release` required):
- Power profile / thermal notes:
- Background process controls:

## 4. Results Summary

### 4.1 Time Metrics

| Method | Mean | Median | StdDev | Error | Ratio vs Baseline |
|---|---:|---:|---:|---:|---:|
| Baseline | | | | | 1.00 |
| Candidate | | | | | |

### 4.2 Allocation Metrics

| Method | Allocated Bytes | Gen0 | Gen1 | Gen2 |
|---|---:|---:|---:|---:|
| Baseline | | | | |
| Candidate | | | | |

## 5. Statistical Confidence and Limitations

- Confidence statement:
- Evidence strength (high/medium/low):
- Error overlap assessment:
- Replication count and consistency:
- Sensitivity to environment noise:

## 6. Risks to Validity

- Potential dead-code elimination risk:
- Setup contamination risk:
- Data representativeness risk:
- Cross-machine comparability risk:
- Any missing instrumentation:

## 7. Recommendation and Next Decision

- Recommended option:
- Why this option is preferred:
- Expected impact:
- Risks of adopting recommendation:
- Next benchmark or profiling step:

## 8. Reproducibility Appendix

- Command used to run benchmark:

```bash
dotnet run -c Release --project <BenchmarkProjectPath>
```

- Artifact locations (BenchmarkDotNet output folder, logs, exports):
- Source commit or branch identifier:
- Date/time of runs:
