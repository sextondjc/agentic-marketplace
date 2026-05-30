---
name: sync-skills
description: Use when maintaining a skill library over time and you need to evaluate source freshness, relevance, and adoption before updating skill content.
---

# Keeping Skills Current

## Specialization

Maintain skill quality over time by continuously validating that skill guidance is aligned with current external standards and platform behavior.

## Self-Containment Requirement

- REQUIRED: Keep execution self-contained within this skill. Do not delegate execution to sibling skills.
- REQUIRED: Keep execution self-contained within this skill. Do not delegate execution to sibling skills.

## Trigger Conditions

Invoke this skill when any of the following is true:

- Skills need maintenance against current standards or source freshness.
- Skill guidance may be stale, misaligned, or under-adopted.
- A maintenance pass is needed after governance or skill review findings.

## Inputs

Required inputs:

- Target skill set or explicit list of skills to maintain.
- Evaluation date in ISO format (YYYY-MM-DD).
- Source catalog file path (default: ./references/source-catalog.md).

Optional inputs:

- Scope filters (naming, domain, or owner).
- Maximum age threshold in days for source freshness (default: 30).

## Source Governance Rules

- Keep the source catalog in Markdown grid format.
- Every source row MUST include:
  - Source
  - What It Provides
  - Why It Is Valuable
  - In Use (Yes or No)
  - Last Evaluated (YYYY-MM-DD)
  - Current Status (Current, Needs Review, Deprecated)
- Mark a source as Needs Review when Last Evaluated is older than the freshness threshold.
- Mark a source as Deprecated when it is no longer maintained or no longer relevant to skill authoring.
- Do not remove historical sources without adding a short deprecation note in the Notes column.

## Maintenance Workflow

1. Open [source-catalog.md](./references/source-catalog.md).
2. Re-evaluate each active source against current platform behavior and spec guidance.
3. Update In Use, Last Evaluated, and Current Status for each source.
4. Record concrete deltas that affect workspace skills.
5. Prepare implementation-ready change instructions for impacted skill files.
6. Validate the updated skill files against this skill's quality and self-containment rules.
7. Publish a short maintenance summary in `.docs/changes/skill/maintenance/` with the date and impacted skills.

## Evaluation Criteria

Apply all checks for each source:

- Relevance: Does this source still describe how skills are discovered, loaded, and maintained?
- Authority: Is the source official, widely adopted, or actively maintained?
- Freshness: Was it updated recently enough for the configured threshold?
- Actionability: Does it provide concrete guidance that can change or validate skill behavior?
- Brevity: Do affected skills remain economical for context efficiency without losing trigger clarity or execution fidelity?

## Outputs

- Updated [source-catalog.md](./references/source-catalog.md).
- Optional source evaluation artifact using [source-evaluation-template.md](./references/source-evaluation-template.md).
- A concrete change list for impacted skill files.
- A validation checklist and outcome summary when updates were made.

## Done Criteria

This skill is complete for a run only when:

- Every in-use source has an updated Last Evaluated date.
- Any stale source is marked Needs Review or Deprecated.
- Skill updates include implementation-ready edits and rationale.
- Brevity expectations were evaluated for affected skills and included in any routed change list.
- Post-update validation outcomes are captured in the maintenance summary.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.


