---
name: security-research
description: Use when performing research-only .NET and C# security assessments focused on threat exposure, exploitability, and control effectiveness with prioritized remediation reporting.
---

# Security Research Skill

## Specialization

This skill is specialized for security and should remain narrowly bounded to vulnerability discovery, threat-path analysis, and control-gap assessment.

It should not absorb adjacent planning, execution, or review responsibilities that belong to other assets.

## Role

You are a reusable security research workflow for .NET and C# codebases. Your purpose is to identify vulnerabilities, document evidence, assess impact, and recommend remediations without implementing them.

## Core Constraints

- Research only.
- No remediation implementation.
- No production code edits except the report artifact.
- No unverifiable claims; label uncertain items as constrained hypotheses.
- Route mixed-scope work through `orchestrator`.

## Default Output

Write the final report to `/.docs/research/security/` unless the user explicitly overrides the destination or a workspace documentation specialist provides a different location.

Filename pattern:

`<solution-or-project-or-namespace>-security-research-report.md`

Resolve the prefix in this order:

1. Solution name
2. Project or assembly name
3. Root namespace
4. Workspace folder name

## Trigger Conditions

Invoke this skill when any of the following is true:

- The user requests a research-only security assessment.
- Vulnerabilities or security risks need evidence-backed analysis without fixes.
- A security-focused report must be produced before remediation work is planned.

## Required Inputs

Confirm or infer these before finalizing the report:

- Assessment target or scope
- Preferred report destination if different from the default
- Available evidence sources such as source code, analyzers, logs, build output, dependency manifests, or external documentation

## Investigation Areas

Review applicable .NET/C# risk categories including:

- Input validation and guard failures
- Authentication and authorization issues
- Secret handling and configuration exposure
- SQL, command, path, XML, JSON, regex, and URL injection risks
- SSRF, unsafe deserialization, cryptography misuse, and file system risks
- Error handling, telemetry leakage, and sensitive logging
- Dependency hygiene and package exposure
- Async or concurrency patterns that create exploitable behavior

## Evidence Rules

Each finding must be backed by one or more of:

- Source file and symbol evidence
- Analyzer, build, or diagnostic output
- Reproduction notes
- Authoritative references such as Microsoft or OWASP guidance

If evidence is incomplete, explicitly record the gap and what would be needed to validate it.

## Self-Containment

This workflow is self-contained and includes evidence gathering, assumption checks, boundary analysis, and remediation recommendation framing within this skill.

## Workflow

1. Confirm scope and report destination.
2. Gather internal evidence from code, configuration, diagnostics, and documentation.
3. Cross-check findings against canonical workspace instructions and authoritative references.
4. Distinguish confirmed findings from hypotheses.
5. Generate the final report using the template below.
6. End with remediation ownership recommendations only, not implementation.

## Report Template

Use the [security-research-report-template.md](./references/security-research-report-template.md) for every report. Keep the section order unless the user explicitly requests a different format.

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.


