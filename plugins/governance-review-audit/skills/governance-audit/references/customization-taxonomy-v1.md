# Customization Taxonomy v1

Status: Approved baseline (conceptual model, no catalog schema rewrites)
Date: 2026-04-02
Related Plan: `PLAN-20260402-001`

## Purpose

Define a conceptual 5-field taxonomy for workspace customizations without changing folder structure or lifecycle catalog schema.

## Source-Of-Truth Precedence

This taxonomy is authoritative for conceptual classification and naming analysis only.

Operational routing and lane ownership remain governed by:

1. [planning-execution-review-governance.md](./planning-execution-review-governance.md)
2. [agents-discovery-index.md](./../../../catalogs/agents-discovery-index.md)
3. [instructions-discovery-index.md](./../../../catalogs/instructions-discovery-index.md)
4. [prompts-discovery-index.md](./../../../catalogs/prompts-discovery-index.md)
5. [skills-discovery-index.md](./../../../catalogs/skills-discovery-index.md)

## Governing Assets

The accepted taxonomy is maintained and applied through these governing assets:

1. Agent: [agents-discovery-index.md](./../../../catalogs/agents-discovery-index.md) defines `orchestrator` as the mandatory intake and routing entry point.
2. Instruction: [governance-lifecycle.instructions.md](./../../../instructions/governance-lifecycle.instructions.md) is the normative policy for lane ownership, routing, and traceable handoff.
3. Skills: [agent-authoring SKILL.md](./../../../skills/agent-authoring/SKILL.md) and [instructions-authoring SKILL.md](./../../../skills/instructions-authoring/SKILL.md) govern taxonomy-adjacent customization edits by artifact type, [write-technical-docs SKILL.md](./../../../skills/write-technical-docs/SKILL.md) governs documentation maintenance and link integrity, and [governance-audit SKILL.md](./../../../skills/governance-audit/SKILL.md) governs review of the resulting governance state.

## Field Definitions

| Field | Meaning |
|---|---|
| ASSET | Canonical asset name (agent, instruction, prompt, or skill) |
| LANE | Lifecycle lane: planning, execution, review |
| FAMILY | Conceptual grouping: governance, planning, delivery, execution, orchestration, review, test, security, standards, synchronization |
| TYPE | Asset kind: agent, instruction, prompt, skill |
| ROLE | Primary functional role for routing and intent matching |

## Approved v1 Family Decisions

| Topic | Decision | Rationale |
|---|---|---|
| `delivery` vs `execution` | Keep separate families in v1 | Preserves distinction between implementation work and delivery/completion workflows without requiring catalog rewrites. |
| `performance` vs `test` | Keep performance assets under `test` in v1 | Avoids introducing a new family while the model remains conceptual; revisit in v2. |
| `architecture-designer` family placement | Keep under `standards` in v1 | Matches current taxonomy semantics and avoids cross-catalog churn in this promotion pass. |

## Taxonomy Grid (Approved v1)

| ASSET | LANE | FAMILY | TYPE | ROLE |
|---|---|---|---|---|
| orchestrator | planning | orchestration | agent | router |
| plan-researcher | planning | planning | agent | planner-researcher |
| architecture-designer | planning | standards | agent | architecture-designer |
| csharp-engineer | execution | execution | agent | implementer |
| defect-debugger | execution | execution | agent | defect-fixer |
| sql-dba | execution | standards | agent | database-operator |
| workspace-scaffolder | execution | delivery | agent | scaffolder |
| code-reviewer | review | review | agent | reviewer |
| powershell-reviewer | review | standards | agent | script-reviewer |
| security-researcher | review | security | agent | security-assessor |
| performance-assessor | review | test | agent | performance-assessor |
| benchmark-researcher | review | test | agent | benchmark-assessor |
| lifecycle-governance | planning | governance | instruction | lane-policy |
| architecture | planning | standards | instruction | architecture-policy |
| prd | planning | planning | instruction | requirements-policy |
| technical-docs | planning | standards | instruction | documentation-policy |
| naming-conventions | execution | governance | instruction | naming-policy |
| csharp | execution | standards | instruction | csharp-policy |
| async-programming | execution | standards | instruction | async-policy |
| syrx | execution | standards | instruction | data-access-policy |
| ci-cd | execution | standards | instruction | pipeline-policy |
| sql-dba | execution | standards | instruction | sql-policy |
| powershell | execution | standards | instruction | scripting-policy |
| task-implementation | execution | delivery | instruction | execution-governance |
| testing-strategy | execution | test | instruction | testing-policy |
| validation-and-guards | execution | standards | instruction | input-validation-policy |
| security-and-secure-coding | execution | security | instruction | secure-coding-policy |
| workspace-scaffolder | execution | delivery | prompt | setup-template |
| write-component-docs | execution | standards | prompt | component-docs-template |
| curate-copilot | execution | governance | prompt | catalog-curation-template |
| generate-readme | execution | standards | prompt | readme-template |
| syrx-validation | review | standards | skill | input-validation-pattern |
| execute-testing-xunit | execution | test | prompt | xunit-template |
| review-technical-docs | review | standards | prompt | docs-review-template |
| skill-audit | review | governance | prompt | skill-audit-template |
| instructions-audit | review | governance | prompt | instruction-audit-template |
| governance-cadence | review | governance | prompt | governance-cadence-template |
| security-research | review | security | prompt | security-report-template |
| performance-research | review | test | prompt | performance-report-template |
| writing-plans | planning | planning | skill | plan-author |
| task-research | planning | planning | skill | researcher |
| prd-generator | planning | planning | skill | requirements-author |
| critical-thinking | planning | planning | skill | assumption-challenger |
| route-customization | planning | orchestration | skill | customization-router |
| adr-generator | planning | standards | skill | adr-author |
| api-design | planning | standards | skill | interface-designer |
| task-execution | execution | execution | skill | task-implementer |
| plans | execution | execution | skill | checkpoint-executor |
| test-driven-development | execution | test | skill | test-first-implementer |
| agent-authoring | execution | governance | skill | agent-author |
| instructions-authoring | execution | governance | skill | instruction-author |
| skills-authoring | execution | governance | skill | skill-author |
| curate-copilot-instructions | execution | governance | skill | catalog-curator |
| dotnet-refactor | execution | standards | skill | refactorer |
| docker-dotnet | execution | standards | skill | containerizer |
| syrx-data-access | execution | standards | skill | repository-implementer |
| branch-completion | execution | delivery | skill | completion-coordinator |
| write-technical-docs | execution | standards | skill | technical-writer |
| request-code-review | review | review | skill | review-requester |
| remediate-review | review | review | skill | review-remediator |
| governance-audit | review | governance | skill | governance-auditor |
| audit-powershell | review | standards | skill | powershell-auditor |
| delivery-status-grid | review | delivery | skill | status-reporter |
| current-test-coverage | review | test | skill | coverage-reporter |
| perf-benchmark | review | test | skill | benchmark-workflow |
| performance-research | review | test | skill | performance-analyst |
| security-research | review | security | skill | security-analyst |
| audit-skill | review | governance | skill | skill-auditor |
| audit-agent | review | governance | skill | agent-auditor |
| audit-instructions | review | governance | skill | instruction-auditor |
| audit-prompts | review | governance | skill | prompt-auditor |
| sync-customizations | review | synchronization | skill | customization-maintainer |
| sync-skills | review | synchronization | skill | skill-maintainer |

## Catalog Cross-Check Snapshot

Compared against:

- [agents-discovery-index.md](./../../../catalogs/agents-discovery-index.md)
- [instructions-discovery-index.md](./../../../catalogs/instructions-discovery-index.md)
- [prompts-discovery-index.md](./../../../catalogs/prompts-discovery-index.md)
- [skills-discovery-index.md](./../../../catalogs/skills-discovery-index.md)

| Area | v1 Position | Current Catalog Position | Outcome | Follow-Up |
|---|---|---|---|---|
| Lane mappings | Planning/Execution/Review assignments in taxonomy rows | Catalogs classify by lane | Aligned | No immediate lane changes required |
| Family model | Conceptual `FAMILY` field retained | Catalogs do not include a family column | Intentional divergence | Keep conceptual in v1 |
| Agent naming state | Uses renamed canonical agents (`architecture-designer`, `defect-debugger`) | Agent catalog uses same canonical names | Aligned | None |
| Governance additions | Includes `governance-audit` skill and `governance-cadence` prompt | Present in skill/prompt catalogs | Aligned | None |

## Deferred v2 Review Backlog

The following topics are intentionally deferred to a separate v2 plan:

1. Whether `FAMILY` should become an operational column in lifecycle catalogs.
2. Whether performance assets should move from `test` to a dedicated `performance` family.
3. Whether `architecture-designer` should remain in `standards` or move to `planning`.
4. Whether `delivery` and `execution` should be merged for conceptual simplification.

## Traceability

- Plan: `.docs/plans/customization-taxonomy-promotion-plan.md`
- ADR: `.docs/adr/customization-taxonomy-promotion-boundary.md`
- Changes: `.docs/changes/customization-taxonomy-promotion-changes.md`


