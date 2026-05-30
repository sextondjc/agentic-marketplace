---
name: security-research
description: 'Prompt for research-only .NET/C# security assessment with a detailed remediation report and no implementation.'
---

# Security Research Prompt

Route this request to `security-researcher`.

Perform a research-only security assessment of the requested .NET/C# scope. Use the `security-research` skill and relevant companion skills to gather evidence, identify vulnerabilities, and write a detailed remediation report without implementing fixes.

Default output:

- Report location: `/.docs/research/security/`
- Filename: `<solution-or-project-or-namespace>-security-research-report.md`

Requirements:

- Collaborate through `orchestrator` if the task spans multiple agents.
- Use existing workspace instructions and relevant skills.
- Call out missing skills, missing evidence, or missing tooling in the report.
- Keep implementation status explicit: no remediations are to be implemented.

## Output Contract

Create the report at the default output location and include these sections in order:

1. Executive Summary
2. Scope and Threat Context
3. Evidence Collected
4. Vulnerability Findings Grid
5. Prioritized Remediation Options (research-only)
6. Risk and Confidence Notes
7. Open Questions

### Vulnerability Findings Grid Schema

| Finding ID | Severity | Category | Evidence | Exploitability | Recommendation |
|---|---|---|---|---|---|

### Success Criteria

- Each finding includes concrete evidence and a severity level.
- Recommendations remain implementation-neutral and research-focused.
- Report explicitly states "No code changes implemented".
