---
name: test-design-review
description: Use when entering the TEST phase or when a test plan requires review — covers test strategy evaluation, coverage rationale, traceability, exit criteria definition, and multi-discipline test pass coordination.
---

# Test Design Review

## Specialization

Evaluate test design quality across disciplines and produce: a strategy review finding log, a traceability verdict, an exit-criteria statement, and a coverage gap list.

This skill spans Engineering, Security, Performance, UX, and Product acceptance testing. It does not run tests — it evaluates whether the test approach is sound before or after execution.

## Trigger Conditions

- Entering the TEST phase and a test strategy or plan must be reviewed before execution begins.
- A test plan exists but lacks explicit exit criteria, traceability, or coverage rationale.
- Multi-discipline test evidence must be collated and assessed for release readiness.
- A test execution pass has completed and the results must be reviewed for requirement completeness.

## Inputs

- Test plan or strategy document (or a description of what testing is planned).
- Requirement list or acceptance criteria that tests must cover.
- Scope of disciplines involved: Engineering, Security, Performance, UX, Product acceptance (specify which apply).
- Current test evidence if reviewing post-execution.

## Required Outputs

| Output | Description |
|---|---|
| Strategy review finding log | Findings against test strategy quality: coverage rationale, tool/environment fit, data strategy, and independence of review. Each finding: severity (Blocking / Major / Minor / Advisory) and disposition. |
| Traceability verdict | Assessment of whether each requirement or acceptance criterion has at least one mapped test case. Pass / Partial / Fail with gap list. |
| Exit-criteria statement | Explicit, agreed exit criteria for the test phase: pass threshold, defect classification rules, and evidence required to exit. |
| Coverage gap list | Disciplines or requirement areas with insufficient coverage, each with recommended action. |

## Workflow

1. Identify the disciplines in scope and the corresponding test types required for each.
2. Review the test strategy or plan against: coverage rationale, tool appropriateness, environment readiness, test data strategy, and reviewer independence.
3. Build the traceability map: for each requirement or acceptance criterion, identify whether a test case exists. Record gaps.
4. Draft the exit-criteria statement: confirm agreement on threshold, defect rules, and required evidence.
5. Compile the coverage gap list: list disciplines or areas that lack test coverage and classify risk.
6. Produce the strategy review finding log with severity and disposition for each finding.

## Discipline-Specific Considerations

| Discipline | Key review points |
|---|---|
| Engineering | Unit and integration coverage, regression safety, flaky test policy. |
| Security | Abuse-case coverage, finding severity classification, and release-blocking threshold. |
| Performance | Benchmark against budget, load profile realism, and regression threshold. |
| UX | Usability session scope, accessibility check coverage, and severity classification. |
| Product acceptance | Scenario completeness, acceptance criterion clarity, and stakeholder review. |

## Done Criteria

- Strategy review finding log is complete with no open Blocking findings (or escalation recorded).
- Traceability verdict is present with a Pass, Partial, or Fail verdict and gap list.
- Exit-criteria statement exists and is agreed.
- Coverage gap list is present with recommended actions.

## References

- Related skills: `release-readiness`, `test-driven-development`, `analysis-execution`
