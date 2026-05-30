---
name: performance-research
description: 'Prompt for research-only .NET/C# performance assessment with a detailed remediation report and no implementation.'
---

# Performance Research Prompt

Route this request to `performance-assessor`.

Perform a research-only performance assessment of the requested .NET/C# scope. Use the `performance-research` skill and relevant companion skills to gather evidence, identify bottlenecks, and write a detailed remediation report without implementing fixes.

Default output:

- Report location: `/.docs/research/performance/`
- Filename: `<solution-or-project-or-namespace>-performance-research-report.md`

Requirements:

- Collaborate through `orchestrator` if the task spans multiple agents.
- Use existing workspace instructions and relevant skills.
- Call out missing skills, missing evidence, or missing tooling in the report.
- Keep implementation status explicit: no remediations are to be implemented.

## Output Contract

Create the report at the default output location and include these sections in order:

1. Executive Summary
2. Scope and Assumptions
3. Evidence Collected
4. Bottleneck Findings Grid
5. Prioritized Remediation Options (research-only)
6. Risk and Confidence Notes
7. Open Questions

### Bottleneck Findings Grid Schema

| Finding ID | Area | Symptom | Evidence | Estimated Impact | Recommendation |
|---|---|---|---|---|---|

### Success Criteria

- At least 3 evidence-backed findings are documented unless the scope is demonstrably clean.
- Every recommendation includes rationale and an expected impact level.
- Report explicitly states "No code changes implemented".

