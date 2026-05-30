# performance-security-research

## Overview

- Purpose: Provide an evidence-first research bundle that separates performance and security assessment from implementation work.
- Capability Provided: Performance diagnostics, benchmarking governance, security research, and dependency risk scanning workflows.
- Why Install: Install this plugin to run high-confidence performance and security research without mixing implementation responsibilities.

## Version

- Plugin Name: performance-security-research
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:42:32.1011507Z
- Plugin SHA-256: 95bde61c08507575e53f1db485aef0c251402e8c4fbace2097519adcef8720b9

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/performance-research/SKILL.md | Skill | Use when performing research-only .NET and C# performance diagnostics focused on latency, throughput, allocation, and contention evidence with prioritized remediation reporting. |
| skills/perf-benchmark/SKILL.md | Skill | Use when designing, running, or reviewing BenchmarkDotNet performance tests in .NET solutions and workspaces. |
| skills/dependency-security-scan/SKILL.md | Skill | Use when scanning workspace or target repository dependencies for known CVEs, outdated packages, and license risks with deterministic SBOM generation and remediation-ready findings. |
| skills/benchmark-statistical-analysis/SKILL.md | Skill | Use when BenchmarkDotNet results must be interpreted beyond raw means — covering distributions, effect size, error bounds, outlier decisions, and confidence adequacy for promotion decisions. |
| skills/benchmark-source-curation/SKILL.md | Skill | Use when BenchmarkDotNet guidance must be grounded in authoritative, current sources and converted into reusable, agent-usable benchmark guidance. |
| skills/benchmark-quality-gate/SKILL.md | Skill | Use when a BenchmarkDotNet suite or benchmark-driven performance change needs an expert, evidence-first quality decision with deterministic findings and a go or no-go recommendation. |
| skills/security-research/SKILL.md | Skill | Use when performing research-only .NET and C# security assessments focused on threat exposure, exploitability, and control effectiveness with prioritized remediation reporting. |
| skills/benchmark-profiler-integration/SKILL.md | Skill | Use when BenchmarkDotNet diagnosers beyond MemoryDiagnoser are needed — covering hardware counters, ETW/perf_events setup, profiler correlation, and diagnoser co-existence rules. |
| skills/benchmark-ci-integration/SKILL.md | Skill | Use when BenchmarkDotNet results must gate PRs, track regressions across commits, or be stored as durable CI artifacts with threshold-based enforcement. |
| skills/benchmark-baseline-management/SKILL.md | Skill | Use when BenchmarkDotNet baselines must be tracked, locked, compared, or governed across commits, branches, and releases to prevent longitudinal performance regression. |
| prompts/security-research.prompt.md | Prompt | Prompt for research-only .NET/C# security assessment with a detailed remediation report and no implementation. |
| prompts/performance-research.prompt.md | Prompt | Prompt for research-only .NET/C# performance assessment with a detailed remediation report and no implementation. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| instructions/governance-release.instructions.md | Instruction | Mandatory rules for release artifact evidence, approval chain, rollback documentation, and release notes format. |
| agents/security-researcher.agent.md | Agent | Research-only .NET/C# security specialist that identifies vulnerabilities and produces remediation reports without implementing fixes. |
| agents/performance-assessor.agent.md | Agent | Research-only .NET/C# performance specialist that identifies bottlenecks and produces remediation reports without implementing fixes. |
| agents/benchmark-researcher.agent.md | Agent | BenchmarkDotNet-focused .NET performance specialist for benchmark design, execution guidance, and evidence-based benchmark reporting without production code implementation. |
| skills/benchmark-orchestrator/SKILL.md | Skill | Use when one BenchmarkDotNet request spans multiple capability areas and needs deterministic intake, explicit phase ownership, and a unified execution contract. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | 2ce7f683ea8b1b6961bb91457596ba9da189dcdfcb5591a937817c1ca62dd05a |
| skills/performance-research/references/performance-research-report-template.md | 63c2b6fa2ab5d52a83cf46d8918be528a62aed468d9350159e5e6fd618094f17 |
| skills/performance-research/SKILL.md | 34ef34aaf841d6b8c6bb8b248c99ec40d651f874a58ef4f126ecd513460740d2 |
| skills/perf-benchmark/references/benchmarkdotnet-performance-report-template.md | 74c2f024502f8f82a6b309a25c640cbe30e88cf98716cf162c037051430a2680 |
| skills/perf-benchmark/SKILL.md | e55d2c3fcd76cf29f7ebb6bcfacf6fb7ce5a63c1f05f53bf7ea4faccacc23d64 |
| skills/dependency-security-scan/references/source-catalog.md | 68f91a010480608ecfdade1e16cc95ef24b4c2b8d4b6199e0182ba0db7c06c61 |
| skills/dependency-security-scan/SKILL.md | ec9c76c3e2fa34c189d7ba7f7c44c7124e803ef878e81a4793eaeba9a5aca843 |
| skills/benchmark-statistical-analysis/SKILL.md | c73bff67669e7c1f166574e1d0d3a685355b8b604ac21ea406db00b068815c2b |
| skills/benchmark-source-curation/SKILL.md | 4aacfd19860d9aa6a13e5e8ba3254f6f696621d406bee66e62bd020dc64c5537 |
| skills/benchmark-quality-gate/SKILL.md | 48c8536efe0a030adcc692392d033fcd7261372f83be05fc3704e74a12ed1fc4 |
| skills/security-research/SKILL.md | a5476a6c1403a6013285245027d7e30c4df38ff923343abc52c4f5aec808342e |
| skills/benchmark-profiler-integration/SKILL.md | a59fe4c75bff10babbe414995fcdf664fbb1a83acf8fe305cf9bc53520d243ea |
| skills/benchmark-ci-integration/SKILL.md | 92aa91b696102b515d8d2408741da7eed03ec223578b62012c69f6e021dc97c6 |
| skills/benchmark-baseline-management/SKILL.md | bffbba78ef933e7261ad1415b93bd743333ce84bbba14d7eb3678b6638fe88b1 |
| prompts/security-research.prompt.md | 3b72f9abf6b44354e7589855016ddc490205058b4db0a9f12fb562db7f01eb93 |
| prompts/performance-research.prompt.md | d11d3a0c38c3dde8efcbe6cb92c8cb4d01e8c5bafa53a8621b3cab22876e5e8e |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| instructions/governance-release.instructions.md | de32e578be6976e5761ba008abd410ac70484826914b08b93f7b0cb198c1d8e3 |
| agents/security-researcher.agent.md | 1f5dc68f688c7664fe9d58629e771135ee996fbf2a8ffc8a2aa44cdfe832389a |
| agents/performance-assessor.agent.md | 48cd89205b399b7e3cf74e17a371e17bff49e7f84ebb65a0c5963df290f46d9e |
| agents/benchmark-researcher.agent.md | 2c45bb68c1cb2a269d44965418836c26106c13ab34248e6553ef33f50f26f291 |
| skills/benchmark-orchestrator/SKILL.md | 903abeed34f8761283431a41af1d2bf10c3fae8386a13997c8cc015acd8897cf |
| skills/security-research/references/security-research-report-template.md | ec207596cf95e55214589a81b26d08dde7b1fefffbf9ca7aa15d55006f8d855f |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
