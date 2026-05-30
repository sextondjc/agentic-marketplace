---
name: experiment-design
description: Use when designing technical spikes, threat experiments, benchmark experiments, or usability tests — produces a structured experiment with hypothesis, success criteria, scope boundary, and evidence format before execution begins.
---

# Experiment Design

## Specialization

Produce a structured experiment definition before execution begins: a clear hypothesis, success and failure criteria, scope boundary, evidence format, and a time-box. This skill applies across Analysis, Design, and Test cells where exploration work must stay bounded and produce usable evidence.

This skill designs the experiment. It does not execute the spike (`csharp-engineer` or domain engineers own execution), run security tests (`security-research` owns execution), or conduct usability sessions (`usability-test-scripts` owns script authoring) — it defines the structure that makes any of those executable with confidence.

## Trigger Conditions

- A technical spike is needed to de-risk an unknown before planning or implementation can proceed.
- A security threat experiment, chaos exercise, or failure-mode drill needs a defined scope and evidence standard.
- A performance benchmark or load test requires a hypothesis and measurement plan before tooling is set up.
- A usability or accessibility experiment requires a structured research framing before a session is conducted.
- Any exploratory work is at risk of scope creep, inconclusive results, or lost evidence without a bounding structure.

## Inputs

- Exploration trigger: what question, risk, or unknown is prompting the experiment.
- Context: system, feature, or scenario being investigated.
- Available resources: time budget, tooling, environment access, and participant availability (for usability experiments).
- Originating plan or workstream ID for traceability.

## Required Outputs

| Output | Description |
|---|---|
| Hypothesis statement | One falsifiable statement: what the experiment expects to confirm or refute. |
| Success criteria | Observable, measurable conditions under which the hypothesis is confirmed. |
| Failure criteria | Observable, measurable conditions under which the hypothesis is refuted or the experiment is inconclusive. |
| Scope boundary | What is in scope for this experiment and what is explicitly out of scope. Prevents scope creep during execution. |
| Evidence format | What will be captured: log excerpts, benchmark numbers, test recordings, finding notes. Defined before execution so evidence collection is intentional. |
| Time-box | Maximum time or effort budget for the experiment. If the time-box is reached without a result, the experiment terminates and findings are recorded as inconclusive. |
| Closure decision criteria | How the outcome will be acted on: what a confirmed hypothesis triggers, what a refuted hypothesis triggers, and what an inconclusive result triggers. |

## Experiment Type Reference

| Type | Typical context | Key output |
|---|---|---|
| Technical spike | ANALYSIS/DESIGN Engineering or Architecture | Feasibility verdict with measure evidence |
| Threat experiment | ANALYSIS/DESIGN/TEST Security | Exposure finding with severity and reproduction evidence |
| Benchmark experiment | ANALYSIS/DESIGN/TEST Performance | Comparative measurement with baseline and delta |
| Usability experiment | ANALYSIS/DESIGN/TEST UX | Participant observation with finding taxonomy |
| Chaos / failure-mode drill | TEST Support or Architecture | System behaviour record under induced failure |

## Workflow

1. Confirm the exploration trigger: what question does this experiment answer?
2. Write the hypothesis: one falsifiable statement. Reject vague statements ("performance will be acceptable") — require measurable specifics.
3. Define success and failure criteria: what numbers, observations, or states confirm or refute the hypothesis.
4. Set the scope boundary: what is tested, what is not, and what environment conditions apply.
5. Define the evidence format: what will be captured and how it will be recorded.
6. Set the time-box: maximum effort or calendar time before the experiment must terminate.
7. Define the closure decision: what each possible outcome (confirmed, refuted, inconclusive) triggers for the downstream plan.
8. Record the originating plan or workstream ID.

## Done Criteria

- Hypothesis is falsifiable and specific — no vague quality claims.
- Success and failure criteria are observable and measurable.
- Scope boundary explicitly names what is out of scope.
- Evidence format is defined before execution begins.
- Time-box is set.
- Closure decision covers all three outcome paths: confirmed, refuted, inconclusive.
- Originating plan or workstream ID is on the output.

## Guardrails

- Do not start an experiment without a time-box — open-ended exploration is not an experiment.
- Do not conflate hypothesis confirmation with implementation decision — record the evidence; let the planning layer make the decision.
- Do not write a hypothesis that cannot be tested within the stated scope and time-box; narrow the scope or split into multiple experiments.

## References

- Related skills: `analysis-execution`, `perf-benchmark`, `security-research`, `usability-test-scripts`, `test-design-review`, `critical-thinking`

