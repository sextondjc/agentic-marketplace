---
# Phase / Discipline / Lane — Agentic Delivery Coverage Map

> **Artifact type:** Governance coverage map
>
> **Status:** Approved baseline — 2026-04-17
>
> **ADR:** [adr-0001-phase-discipline-lane-model-adoption.md](../../../../.docs/adr/governance/adr-0001-phase-discipline-lane-model-adoption.md)
>
> **Canonical source:** [phase-discipline-lane-agentic-delivery-matrix.md](../../../../.github/skills/matrix-skill-mapping/references/phase-discipline-lane-agentic-delivery-matrix.md)
>
> **Copy role:** Posterity copy under `.docs`; update canonical source first, then sync this file.

## Purpose

This document is a **coverage map**, not a customisation mandate. Its job is to make gaps visible, give requests a routing coordinate, and flag when the discipline list changes so the matrix can be revisited. Promoting a cell to a first-class customisation asset requires a separate decision backed by evidence of a distinct deliverable shape or toolset.

---

## Executive View

| Area | Assessment |
|---|---|
| Model quality | Strong as a routing and coverage taxonomy; weak as a one-to-one asset creation mandate. |
| Best use | Intake metadata, gap analysis, ownership clarity, and future customisation prioritisation. |
| Main risk | Treating all 135 combinations as first-class customisations creates thin specialists, noisy catalogs, and weak differentiation. |
| Governing rule | Keep `Lane` as the primary routing axis, `Discipline` as the specialisation axis, and treat `Phase` as a contextual modifier unless it changes outputs or tools materially. |

---

## Operating Rules

| ID | Rule |
|---|---|
| DEC-PDL-01 | Use the model first as a classification and planning tool, not as a customisation factory. |
| DEC-PDL-02 | Require a distinct toolset, deliverable shape, or review standard before promoting a cell to a first-class agent. |
| DEC-PDL-03 | Prefer extending an existing skill before creating a new agent for a sparse combination. |
| DEC-PDL-04 | Reserve instructions for mandatory, path-scoped policy; do not use them to represent situational workflows. |
| DEC-PDL-05 | Record intentionally unsupported combinations as `tagged only` rather than letting them appear accidentally unserved. |
| DEC-PDL-06 | Use composition for most cells: a small agent layer, a broader skill layer, and an always-on instruction layer. |
| DEC-PDL-07 | Any change to the Discipline list (addition or removal) must trigger a full matrix revisit before the change is treated as adopted. |

---

## Strengths

| Strength | Why it helps agentic delivery |
|---|---|
| Explicit routing coordinates | `Phase`, `Discipline`, and `Lane` make specialist handoff clearer and reduce ambiguous ownership. |
| Better gap detection | Empty or weakly covered areas such as Release, Support, Product Management, and Project Management become visible. |
| Cleaner composition | Cross-functional requests can be split into owned slices instead of forcing one overly broad specialist. |
| Better reviewability | Outputs can be checked against lane expectations and discipline-specific acceptance criteria. |
| Durable catalog metadata | The model classifies requests and assets even when no dedicated customisation exists for that exact cell. |
| Scalable taxonomy | Adding or removing disciplines regenerates a well-structured coverage surface without changing the model shape. |

---

## Weaknesses and Mitigations

| Weakness | Mitigation applied |
|---|---|
| Analysis and Design overlap in planning combinations | Phase is contextual only; Discipline+Lane is the routing pair. Identical behaviours map to the same bundle. |
| Test is often cross-cutting | Most Test cells map to overlays on Engineering, Security, Performance, and UX bundles via `N09`. |
| Release is procedural and evidence-heavy | Release cells use skills and instructions (N02, N10) rather than separate agents. |
| Product and Project execution are coordination-heavy | `Execute` variants in those disciplines map to planning bundles until a distinct deliverable justifies promotion. |
| Matrix completion pressure | DEC-PDL-02 and DEC-PDL-05 explicitly gate promotion and acknowledge `tagged only` as a valid state. |

---

## Suggested Additional Disciplines

All five candidates listed below were adopted on 2026-04-18 following a DEC-PDL-07 revisit. The matrix has been regenerated with all five disciplines. No remaining candidates are pending.

| Discipline | Status |
|---|---|
| Data / DBA | Adopted 2026-04-18 |
| Platform / DevOps | Adopted 2026-04-18 |
| QA / Test Automation | Adopted 2026-04-18 |
| Operations / SRE | Adopted 2026-04-18 |
| Documentation / Knowledge | Adopted 2026-04-18 |

---

## Legend

### Existing Customisation Bundles

| Code | Bundle | Workspace customisations included |
|---|---|---|
| X01 | Orchestrated discovery | `orchestrator`, `plan-researcher`, `critical-thinking`, `task-research`, `refine-ideas`, `governance-lifecycle.instructions.md` |
| X02 | Architecture design | `architecture-designer`, `domain-design`, `adr-generator`, `architecture.instructions.md` |
| X03 | Engineering build | `csharp-engineer`, `defect-debugger`, `plans`, `test-driven-development`, `csharp.instructions.md`, `testing-strategy.instructions.md`, `validation.instructions.md` |
| X04 | Engineering review | `code-reviewer`, `manual-code-reviewer`, `request-code-review`, `remediate-review` |
| X05 | UX planning and design | `ux-designer`, `design-web-ux`, `design-mobile-ux`, `design-mobile-ui-prototyping`, `ux-design.instructions.md` |
| X06 | Frontend delivery | `web-frontend-engineer`, `mobile-frontend-engineer`, `build-web-frontend`, `mobile-orchestrator`, `build-maui-apps`, `mobile-accessibility-quality-gate`, `mobile-offline-resilience`, `mobile-performance-quality-gate`, `mobile-release-readiness`, `web-frontend.instructions.md`, `mobile-frontend.instructions.md` |
| X07 | Security analysis and governance | `security-researcher`, `security-research`, `secure-coding.instructions.md` |
| X08 | Performance analysis | `performance-assessor`, `benchmark-researcher`, `performance-research`, `perf-benchmark` |
| X09 | Ops and platform delivery | `sql-dba`, `powershell-reviewer`, `powershell-script-library`, `ci-cd-workflows`, `sql-server-standards`, `powershell.instructions.md`, `ci-cd.instructions.md` |
| X10 | Governance and documentation review | `governance-briefer`, `governance-audit`, `governance-summarize`, `governance-validate-customization`, `technical-docs.instructions.md` |
| X11 | Product and delivery planning | `prd-generator`, `delivery-status-grid`, `writing-plans`, `plans` |
| X12 | Customisation architecture | `route-customization`, `governance-taxonomy-tag-registry`, `agent-authoring`, `instructions-authoring`, `skills-authoring`, `governance-sync-customizations`, `sync-skills` |
| X13 | Documentation and knowledge | `write-technical-docs`, `index-docs`, `adr-generator`, `technical-docs.instructions.md` |

### Needed Customisations

| Code | Proposed asset | Summary |
|---|---|---|
| N01 | `analysis-execution` skill | Structured discovery, synthesis, contradiction logging, and requirement hardening workflow. |
| N02 | `release-readiness` skill | Release gate, rollback, smoke, evidence, and sign-off workflow. |
| N03 | `support-triage` skill | Incident intake, severity, repro data collection, and routing workflow. |
| N04 | `test-design-review` skill | Test strategy, traceability, coverage quality, and exit-criteria review workflow. |
| N05 | `product-scope-slicing` skill | Converts product intent into prioritised, acceptance-ready delivery slices. |
| N06 | `governance-delivery` skill | Dependency, milestone, RAID, and delivery coordination workflow. |
| N07 | `operability-design` skill | Supportability, observability, runbook, and on-call readiness workflow. |
| N08 | `acceptance-governance` skill | Cross-discipline review checklists, evidence disposition, and sign-off guidance. |
| N09 | `test-orchestration` skill | Coordinates multi-disciplinary test execution and evidence collation. |
| N10 | `governance-release.instructions.md` | Mandatory rules for release artifacts, evidence shape, approvals, and rollback documentation. |
| N11 | `data-design` skill | Schema design, migration planning, data governance, and query optimisation planning workflow. |
| N12 | `sre-practices` skill | SLO and error budget definition, reliability engineering, chaos planning, and toil reduction workflow. |

### Optional Customisations

| Code | Proposed asset | Summary |
|---|---|---|
| O01 | `taxonomy-tag-registry` skill | Maintains consistent Phase x Discipline x Lane tags across catalogs and artifacts. |
| O02 | `experiment-design` skill | Standardises spikes, usability tests, threat experiments, and benchmark experiment design. |
| O03 | `post-release-retrospective` skill | Captures release outcomes, lessons, follow-up actions, and stabilisation learnings. |
| O04 | `customer-feedback-synthesis` skill | Converts support, UX, and product signals into roadmap-ready insights. |
| O05 | `support-runbook-generator` skill | Produces support runbooks, handoff packets, and escalation guides consistently. |
| O06 | `release-simulation` skill | Adds rehearsal, rollback drill, and game-day style validation before promotion. |

---

## Matrix

Columns: **Existing** = bundle codes from legend above. **Needed** = N-codes. **Optional** = O-codes. A `-` means the existing bundles are sufficient or the cell is `tagged only`.

### Plan Lane

| ID | Phase | Discipline | Lane | Description | Potential Workflow | Existing | Needed | Optional |
|---|---|---|---|---|---|---|---|---|
| 46 | ANALYSIS | Analysis | Plan | Frame discovery questions, hypotheses, and evidence sources before structured research begins. | Intake → assumption ledger → research plan. | X01, X11 | N01 | O01, O02 |
| 47 | ANALYSIS | Architecture | Plan | Plan architecture discovery around boundaries, constraints, and decision drivers. | Context scan → boundary questions → ADR queue. | X01, X02 | - | O01, O02 |
| 48 | ANALYSIS | Engineering | Plan | Plan technical discovery spikes to de-risk implementation unknowns. | Feasibility questions → spike plan → measure criteria. | X01, X03 | - | O02 |
| 49 | ANALYSIS | Performance | Plan | Plan performance discovery around budgets, hotspots, and expected load. | Budget draft → hot path map → benchmark plan. | X01, X08 | - | O02 |
| 50 | ANALYSIS | Product Management | Plan | Plan product discovery around user outcomes, scope, and success criteria. | Problem framing → persona questions → research plan. | X01, X11 | N05 | O04 |
| 51 | ANALYSIS | Project Management | Plan | Plan analysis workstreams, dependencies, and decision checkpoints. | Schedule → ownership map → RAID starter. | X10, X11 | N06 | O01 |
| 52 | ANALYSIS | Security | Plan | Plan threat-focused discovery and control questions before design starts. | Asset inventory → trust-boundary questions → abuse-case plan. | X01, X07 | - | O02 |
| 53 | ANALYSIS | Support | Plan | Plan operability discovery around incidents, monitoring, and support constraints. | Support criteria → incident data request → discovery plan. | X09, X11 | N03, N07 | O05 |
| 54 | ANALYSIS | UX | Plan | Plan user research and experience discovery to validate problem framing. | Persona hypothesis → research script → artifact plan. | X01, X05 | - | O04 |
| 55 | DESIGN | Analysis | Plan | Plan requirement refinement so findings become execution-ready specifications. | Requirement shaping → dependency decisions → plan outline. | X01, X11 | N01 | O01 |
| 56 | DESIGN | Architecture | Plan | Plan architecture workstreams, decision records, and design evaluations. | ADR queue → option criteria → review plan. | X01, X02 | - | O01 |
| 57 | DESIGN | Engineering | Plan | Plan implementation slices, TDD approach, and technical sequencing. | Workstream breakdown → seam planning → task order. | X01, X03, X11 | - | O02 |
| 58 | DESIGN | Performance | Plan | Plan budgets, measurement gates, and performance-sensitive design choices. | SLO draft → hot path map → measurement plan. | X01, X08 | - | O02 |
| 59 | DESIGN | Product Management | Plan | Plan roadmap slices, release themes, and acceptance framing. | Outcome decomposition → epic slicing → acceptance plan. | X11 | N05 | O04 |
| 60 | DESIGN | Project Management | Plan | Plan schedule, ownership, dependencies, and governance rhythm. | Milestone plan → dependency board → governance calendar. | X10, X11 | N06 | O01 |
| 61 | DESIGN | Security | Plan | Plan security architecture, trust boundaries, and required controls. | Threat model plan → control objectives → review schedule. | X01, X07 | - | O02 |
| 62 | DESIGN | Support | Plan | Plan runbooks, observability, and support operating model inputs. | Operability requirements → support workflow sketch → evidence plan. | X09, X11 | N07 | O05 |
| 63 | DESIGN | UX | Plan | Plan the UX design effort, experiments, and validation checkpoints. | Design plan → prototype scope → validation cadence. | X05, X11 | - | O04 |
| 64 | IMPLEMENTATION | Analysis | Plan | Plan how requirement clarifications will be handled during build. | Clarification protocol → impact rules → backlog policy. | X01, X11 | N01 | O01 |
| 65 | IMPLEMENTATION | Architecture | Plan | Plan architecture changes required to support delivery safely. | Boundary impact review → refactor plan → risk note. | X02, X03 | - | O01 |
| 66 | IMPLEMENTATION | Engineering | Plan | Plan build tasks, TDD cycles, and integration order. | Task split → failing tests → integration sequence. | X03, X11 | - | O02 |
| 67 | IMPLEMENTATION | Performance | Plan | Plan tuning work, instrumentation, and regression checks. | Tuning candidates → telemetry plan → regression gates. | X03, X08 | - | O02 |
| 68 | IMPLEMENTATION | Product Management | Plan | Plan scope control and incremental value decisions during build. | Slice review → change criteria → acceptance updates. | X11 | N05 | O04 |
| 69 | IMPLEMENTATION | Project Management | Plan | Plan sprint or wave execution, dependencies, and reporting cadence. | Iteration plan → dependency board → reporting cadence. | X10, X11 | N06 | O01 |
| 70 | IMPLEMENTATION | Security | Plan | Plan secure implementation tasks, validation points, and review gates. | Control backlog → secure test points → review schedule. | X03, X07 | - | O02 |
| 71 | IMPLEMENTATION | Support | Plan | Plan support enablement that must ship alongside the build. | Support checklist → handoff plan → runbook backlog. | X09, X11 | N03, N07 | O05 |
| 72 | IMPLEMENTATION | UX | Plan | Plan implementation fidelity, design QA, and accessibility checks. | Fidelity checklist → a11y gates → QA plan. | X05, X06 | - | O04 |
| 73 | RELEASE | Analysis | Plan | Plan release decision criteria, open-risk review, and evidence needs. | Evidence checklist → risk questions → decision path. | X10, X11 | N02, N10 | O03 |
| 74 | RELEASE | Architecture | Plan | Plan release impacts on topology, migrations, and compatibility. | Migration plan → compatibility review → rollback path. | X02, X09 | N02, N10 | O06 |
| 75 | RELEASE | Engineering | Plan | Plan rollout order, smoke coverage, and rollback steps. | Rollout plan → smoke checklist → rollback notes. | X03, X09 | N02, N10 | O06 |
| 76 | RELEASE | Performance | Plan | Plan release guardrails, thresholds, and rollback triggers for performance. | Threshold plan → watch metrics → rollback criteria. | X08, X09 | N02, N10 | O06 |
| 77 | RELEASE | Product Management | Plan | Plan release scope, stakeholder messaging, and value-based go/no-go criteria. | Scope freeze → comms plan → acceptance criteria. | X11 | N02, N05, N10 | O04 |
| 78 | RELEASE | Project Management | Plan | Plan release schedule, approvals, coordination, and contingencies. | Release calendar → approval chain → fallback plan. | X09, X10, X11 | N02, N06, N10 | O03 |
| 79 | RELEASE | Security | Plan | Plan security gates, approval evidence, and release-blocking criteria. | Security gates → evidence plan → blocker rules. | X07, X09 | N02, N10 | O06 |
| 80 | RELEASE | Support | Plan | Plan support handoff, coverage, runbooks, and incident readiness. | Coverage roster → runbook list → early-life support plan. | X09, X11 | N02, N03, N07, N10 | O05 |
| 81 | RELEASE | UX | Plan | Plan experience smoke tests and user-facing validation for release. | Critical journey list → smoke plan → UX acceptance check. | X05, X11 | N02, N10 | O04 |
| 82 | TEST | Analysis | Plan | Plan how test findings will be synthesised into requirement decisions. | Finding taxonomy → traceability plan → decision rules. | X01, X10 | N04 | O02 |
| 83 | TEST | Architecture | Plan | Plan architecture-focused test scenarios and failure-mode coverage. | Scenario design → failure modes → environment needs. | X02, X08 | N04, N09 | O02 |
| 84 | TEST | Engineering | Plan | Plan unit, integration, and system coverage plus test data needs. | Coverage map → test data plan → execution queue. | X03 | N04 | O02 |
| 85 | TEST | Performance | Plan | Plan load, benchmark, and regression strategy against budgets. | Perf test matrix → workload design → threshold rules. | X08 | N04, N09 | O02 |
| 86 | TEST | Product Management | Plan | Plan acceptance and outcome-oriented validation for release candidates. | Acceptance plan → scenario mapping → decision rules. | X11 | N04, N05 | O04 |
| 87 | TEST | Project Management | Plan | Plan test windows, resources, entry criteria, and triage cadence. | Test calendar → resourcing → triage schedule. | X10, X11 | N04, N06 | O01 |
| 88 | TEST | Security | Plan | Plan security test scope, abuse cases, and verification depth. | Abuse-case matrix → scope plan → evidence needs. | X07 | N04, N09 | O02 |
| 89 | TEST | Support | Plan | Plan support validation, monitoring checks, and runbook drills. | Drill plan → monitoring checklist → support criteria. | X09 | N04, N07, N09 | O05 |
| 90 | TEST | UX | Plan | Plan usability, accessibility, and journey validation activities. | Test script → participant plan → evidence format. | X05 | N04, N09 | O04 |
| 136 | ANALYSIS | Governance | Plan | Plan governance-focused discovery: policy gaps, compliance risks, and audit obligations. | Policy gap questions → control inventory → audit obligation map. | X10, X12 | N01 | O01 |
| 137 | DESIGN | Governance | Plan | Plan governance design: control structures, audit trail requirements, and policy enforcement points. | Control design plan → policy enforcement points → evidence plan. | X10, X12 | - | O01 |
| 138 | IMPLEMENTATION | Governance | Plan | Plan implementation of governance artifacts, controls, and evidence requirements. | Governance task plan → artifact map → evidence schedule. | X10, X12 | - | O01 |
| 139 | RELEASE | Governance | Plan | Plan governance evidence, approval records, and compliance sign-off for release. | Evidence checklist → approval chain → compliance plan. | X10, X12 | N02, N10 | O03 |
| 140 | TEST | Governance | Plan | Plan governance validation: policy coverage, control testing, and audit trail verification. | Control test plan → evidence needs → audit scope. | X10, X12 | N04, N09 | O01 |
| 151 | ANALYSIS | Data / DBA | Plan | Plan data discovery: schema structure, data quality risks, and migration constraints. | Schema inventory → quality risks → migration scope. | X02, X09 | N11 | O02 |
| 152 | DESIGN | Data / DBA | Plan | Plan schema design, migration approach, and data governance requirements. | Schema plan → migration plan → governance requirements. | X02, X09 | N11 | O01 |
| 153 | IMPLEMENTATION | Data / DBA | Plan | Plan migration tasks, rollback scripts, and data validation checkpoints. | Migration task plan → rollback scripts → validation gates. | X09 | N11 | O02 |
| 154 | RELEASE | Data / DBA | Plan | Plan migration execution, rollback readiness, and data integrity gates for release. | Migration runbook → integrity checks → rollback plan. | X09 | N02, N10, N11 | O06 |
| 155 | TEST | Data / DBA | Plan | Plan data quality tests, migration validation, and schema regression coverage. | Data test plan → migration validation → schema regression. | X09 | N04, N11 | O02 |
| 166 | ANALYSIS | Platform / DevOps | Plan | Plan platform discovery: CI/CD gaps, environment parity issues, and infrastructure risks. | Pipeline audit → environment gaps → risk plan. | X09, X11 | - | O02 |
| 167 | DESIGN | Platform / DevOps | Plan | Plan pipeline design, environment topology, and infrastructure automation approach. | Pipeline plan → environment map → automation plan. | X09, X11 | - | O01 |
| 168 | IMPLEMENTATION | Platform / DevOps | Plan | Plan pipeline tasks, environment provisioning steps, and rollback procedures. | Task plan → provisioning steps → rollback procedures. | X09, X11 | - | O02 |
| 169 | RELEASE | Platform / DevOps | Plan | Plan pipeline release gates, environment readiness checks, and promotion criteria. | Pipeline gate plan → environment checks → readiness criteria. | X09 | N02, N10 | O06 |
| 170 | TEST | Platform / DevOps | Plan | Plan pipeline validation, environment smoke tests, and infrastructure regression coverage. | Pipeline test plan → environment smoke → regression scope. | X09 | N04 | O02 |
| 181 | ANALYSIS | QA / Test Automation | Plan | Plan test automation discovery: coverage gaps, tooling fitness, and automation debt assessment. | Coverage audit → tooling gap → automation debt plan. | X03 | N04 | O02 |
| 182 | DESIGN | QA / Test Automation | Plan | Plan test automation architecture, framework selection, and coverage strategy. | Framework plan → coverage map → automation design. | X03 | N04 | O01, O02 |
| 183 | IMPLEMENTATION | QA / Test Automation | Plan | Plan automation build tasks, integration approach, and pipeline integration steps. | Automation task plan → integration approach → pipeline steps. | X03, X11 | N04 | O02 |
| 184 | RELEASE | QA / Test Automation | Plan | Plan regression gate coverage, suite readiness, and test evidence requirements for release. | Regression plan → suite readiness → evidence criteria. | X03 | N02, N04, N10 | O06 |
| 185 | TEST | QA / Test Automation | Plan | Plan automation validation: suite correctness, coverage quality, and false positive rates. | Suite validation plan → coverage check → false positive review. | X03 | N04, N09 | O02 |
| 196 | ANALYSIS | Operations / SRE | Plan | Plan SRE discovery: reliability risks, SLO gaps, observability blind spots, and toil inventory. | Reliability risk review → SLO gap → toil inventory. | X09 | N07, N12 | O02 |
| 197 | DESIGN | Operations / SRE | Plan | Plan SLO definitions, error budget policy, and reliability engineering approach. | SLO plan → error budget policy → reliability design. | X09 | N07, N12 | O01 |
| 198 | IMPLEMENTATION | Operations / SRE | Plan | Plan SLO instrumentation, error budget tracking setup, and toil reduction tasks. | SLO instrumentation plan → error budget setup → toil reduction tasks. | X09 | N07, N12 | O02 |
| 199 | RELEASE | Operations / SRE | Plan | Plan SRE gate checks, SLO impact assessment, and production readiness criteria for release. | SLO gate plan → error budget impact → readiness criteria. | X09 | N02, N07, N10, N12 | O06 |
| 200 | TEST | Operations / SRE | Plan | Plan chaos experiments, SLO validation tests, and reliability regression coverage. | Chaos plan → SLO test design → reliability regression. | X09 | N04, N07, N12 | O02 |
| 211 | ANALYSIS | Documentation / Knowledge | Plan | Plan documentation discovery: coverage gaps, staleness, and knowledge corpus health. | Doc inventory → coverage gaps → staleness audit. | X10, X13 | - | O01 |
| 212 | DESIGN | Documentation / Knowledge | Plan | Plan documentation structure, content types, and knowledge management approach. | Doc architecture plan → content taxonomy → maintenance model. | X13 | - | O01 |
| 213 | IMPLEMENTATION | Documentation / Knowledge | Plan | Plan documentation creation tasks, review cycles, and publishing pipeline. | Doc task plan → review cadence → publishing steps. | X11, X13 | - | O01 |
| 214 | RELEASE | Documentation / Knowledge | Plan | Plan documentation readiness requirements, review gates, and publication timing for release. | Doc readiness plan → review gates → publication schedule. | X13 | N10 | O01 |
| 215 | TEST | Documentation / Knowledge | Plan | Plan documentation validation: accuracy checks, link integrity, and coverage completeness. | Validation plan → accuracy checks → link integrity scope. | X13 | N04 | O02 |

### Execute Lane

| ID | Phase | Discipline | Lane | Description | Potential Workflow | Existing | Needed | Optional |
|---|---|---|---|---|---|---|---|---|
| 1 | ANALYSIS | Analysis | Execute | Run structured discovery and synthesise requirements, constraints, and open questions. | Research pass → synthesis → requirement draft. | X01, X11 | N01 | O02 |
| 2 | ANALYSIS | Architecture | Execute | Investigate boundaries, dependencies, and structural risks before solution shaping. | Current-state scan → option sketch → ADR seed. | X02, X12 | - | O02 |
| 3 | ANALYSIS | Engineering | Execute | Perform technical spikes and feasibility checks against delivery unknowns. | Spike → measure → recommendation note. | X03 | - | O02 |
| 4 | ANALYSIS | Performance | Execute | Baseline hotspots, expected load behaviour, and likely budget risks. | Baseline → hotspot review → tuning options. | X08 | - | O02 |
| 5 | ANALYSIS | Product Management | Execute | Synthesise user problems, value hypotheses, and candidate delivery slices. | Discovery synthesis → MVP slice → outcome metrics. | X11 | N05 | O04 |
| 6 | ANALYSIS | Project Management | Execute | Coordinate analysis tasks, ownership, and decision cadence across stakeholders. | Status cadence → blocker escalation → decision follow-up. | X11 | N06 | O01 |
| 7 | ANALYSIS | Security | Execute | Perform threat-focused discovery and expose control assumptions early. | Threat sketch → gap note → control options. | X07 | - | O02 |
| 8 | ANALYSIS | Support | Execute | Gather incident patterns, observability gaps, and support pain points. | Ticket sample → support journey → gap log. | X09 | N03, N07 | O05 |
| 9 | ANALYSIS | UX | Execute | Run UX discovery and synthesise pain points, accessibility issues, and unmet needs. | Interviews → journey map → UX problem statement. | X05 | - | O04 |
| 10 | DESIGN | Analysis | Execute | Translate findings into structured requirements, constraints, and acceptance candidates. | Spec draft → requirement IDs → decision log. | X01, X11 | N01 | O01 |
| 11 | DESIGN | Architecture | Execute | Design boundaries, patterns, interfaces, and structural decision records. | Diagrams → ADRs → boundary contracts. | X02 | - | O01 |
| 12 | DESIGN | Engineering | Execute | Design component contracts, seams, and delivery structure for build work. | Interface sketch → service contracts → task breakdown. | X03 | - | O02 |
| 13 | DESIGN | Performance | Execute | Design caching, batching, query, and concurrency strategies against budgets. | Hotspot design → budget allocation → measurement hooks. | X03, X08 | - | O02 |
| 14 | DESIGN | Product Management | Execute | Convert product intent into prioritised, acceptance-ready work items. | Story map → release slice → outcome metrics. | X11 | N05 | O04 |
| 15 | DESIGN | Project Management | Execute | Build delivery structure, checkpoints, and escalation paths for the initiative. | RAID log → checkpoint cadence → coordination plan. | X11 | N06 | O01 |
| 16 | DESIGN | Security | Execute | Design controls, auth flows, hardening patterns, and validation points. | Threat model → control design → secure defaults spec. | X02, X07 | - | O02 |
| 17 | DESIGN | Support | Execute | Design runbooks, alerting expectations, and escalation paths before build. | Runbook outline → alert matrix → handoff design. | X09 | N07 | O05 |
| 18 | DESIGN | UX | Execute | Create journeys, wireframes, prototypes, and accessibility-aware flows. | IA → wireframes → prototype → accessibility notes. | X05, X06 | - | O04 |
| 19 | IMPLEMENTATION | Analysis | Execute | Resolve requirement gaps and scope clarifications discovered during build. | Clarification loop → impact note → backlog update. | X01, X11 | N01 | O01 |
| 20 | IMPLEMENTATION | Architecture | Execute | Apply structural changes while preserving intended boundaries and contracts. | Refactor boundary → update contract → verify fit. | X02, X03 | - | O01 |
| 21 | IMPLEMENTATION | Engineering | Execute | Implement code, tests, and supporting artifacts for the planned slice. | TDD cycle → integration → docs update. | X03 | - | - |
| 22 | IMPLEMENTATION | Performance | Execute | Apply tuning changes, instrumentation, and bottleneck reductions in code. | Instrument → tune → measure delta. | X03, X08 | - | O02 |
| 23 | IMPLEMENTATION | Product Management | Execute | Arbitrate scope trade-offs and acceptance clarifications during build. | Change decision → slice adjust → acceptance update. | X11 | N05 | O04 |
| 24 | IMPLEMENTATION | Project Management | Execute | Coordinate execution, unblock dependencies, and manage delivery risk. | Standup cadence → unblock → status update. | X11 | N06 | O01 |
| 25 | IMPLEMENTATION | Security | Execute | Implement controls, validation, and secure defaults in delivery artifacts. | Control implementation → validation → hardening pass. | X03, X07 | - | O02 |
| 26 | IMPLEMENTATION | Support | Execute | Create runbooks, alerts, dashboards, and support hooks alongside code. | Runbook draft → alert setup → support handoff pack. | X03, X09 | N07 | O05 |
| 27 | IMPLEMENTATION | UX | Execute | Implement interaction, content, and accessibility-critical design details. | UI build → accessibility pass → UX polish. | X05, X06 | - | O04 |
| 28 | RELEASE | Analysis | Execute | Analyse release evidence, open issues, and promotion trade-offs. | Evidence review → risk ranking → go/no-go input. | X10, X11 | N02 | O03 |
| 29 | RELEASE | Architecture | Execute | Coordinate topology, migration, and compatibility-sensitive release actions. | Migration check → contract versioning → rollout note. | X02, X09 | N02 | O06 |
| 30 | RELEASE | Engineering | Execute | Promote build artifacts and complete engineering smoke verification. | Deploy → smoke test → verify build integrity. | X03, X09 | N02 | O06 |
| 31 | RELEASE | Performance | Execute | Verify production-adjacent performance signals during and after promotion. | Live metrics watch → threshold check → rollback input. | X08, X09 | N02 | O06 |
| 32 | RELEASE | Product Management | Execute | Manage scope sign-off, messaging, and acceptance during promotion. | Scope confirmation → stakeholder comms → acceptance check. | X11 | N02, N05 | O04 |
| 33 | RELEASE | Project Management | Execute | Coordinate promotion activities, approvals, and cross-team communication. | Release call → approvals → action tracking. | X09, X11 | N02, N06 | O03 |
| 34 | RELEASE | Security | Execute | Verify deployment hardening, secrets handling, and release security controls. | Secret check → hardening verify → security sign-off input. | X07, X09 | N02 | O06 |
| 35 | RELEASE | Support | Execute | Perform support handoff, validate monitoring, and activate support readiness. | Handoff → monitoring check → support activation. | X09 | N02, N03, N07 | O05 |
| 36 | RELEASE | UX | Execute | Validate production UX, content, and critical user journeys after promotion. | Journey smoke test → content check → accessibility spot check. | X05, X06 | N02 | O04 |
| 37 | TEST | Analysis | Execute | Analyse failures, edge cases, and requirement mismatches from testing. | Failure triage → requirement mismatch log → decision note. | X01, X10 | N09 | O02 |
| 38 | TEST | Architecture | Execute | Run or coordinate resilience, boundary, and integration tests for design assumptions. | Failure-mode test → boundary check → system note. | X02, X08 | N09 | O02 |
| 39 | TEST | Engineering | Execute | Run and extend automated and manual engineering test passes. | Unit/integration/system runs → defect capture. | X03 | N09 | O02 |
| 40 | TEST | Performance | Execute | Run load, benchmark, and regression performance tests. | Benchmark → load run → compare thresholds. | X08 | N09 | O02 |
| 41 | TEST | Product Management | Execute | Evaluate tested increments against value expectations and acceptance criteria. | Acceptance walk-through → value check → disposition. | X11 | N05, N09 | O04 |
| 42 | TEST | Project Management | Execute | Coordinate test execution windows, triage flow, and reporting cadence. | Test schedule → triage rhythm → status report. | X11 | N06, N09 | O01 |
| 43 | TEST | Security | Execute | Run security validation, abuse-case tests, and evidence capture. | Security test pass → finding capture → severity rank. | X07 | N09 | O02 |
| 44 | TEST | Support | Execute | Exercise alerts, escalation flows, and diagnosis paths under test conditions. | Alert drill → escalation rehearsal → diagnosis review. | X09 | N07, N09 | O05 |
| 45 | TEST | UX | Execute | Run usability and accessibility validation and capture user-facing findings. | Usability session → accessibility checks → finding log. | X05 | N09 | O04 |
| 141 | ANALYSIS | Governance | Execute | Conduct governance discovery: identify control gaps, policy obligations, and evidence requirements. | Policy audit → control gap log → compliance obligation list. | X10, X12 | N01 | O01 |
| 142 | DESIGN | Governance | Execute | Design governance controls, policy enforcement structures, and audit artifact contracts. | Control design → policy structure → audit trail spec. | X10, X12 | - | O01 |
| 143 | IMPLEMENTATION | Governance | Execute | Implement governance artifacts, customisation lifecycle controls, and compliance evidence. | Artifact creation → control implementation → evidence capture. | X10, X12 | - | O01 |
| 144 | RELEASE | Governance | Execute | Collate governance evidence, record approvals, and satisfy compliance gates for promotion. | Evidence bundle → approval capture → compliance attestation. | X10, X12 | N02, N10 | O06 |
| 145 | TEST | Governance | Execute | Test governance controls, policy enforcement, and audit trail completeness. | Control test → policy check → audit trail validation. | X10, X12 | N09 | O01 |
| 156 | ANALYSIS | Data / DBA | Execute | Investigate schema structure, data quality, and migration feasibility. | Schema scan → quality assessment → migration feasibility note. | X09 | N11 | O02 |
| 157 | DESIGN | Data / DBA | Execute | Design schema changes, migration scripts, and data governance controls. | Schema design → migration scripts → governance controls. | X02, X09 | N11 | O01 |
| 158 | IMPLEMENTATION | Data / DBA | Execute | Implement schema migrations, seed data, and data access changes. | Migration scripts → seed data → data access update. | X03, X09 | N11 | - |
| 159 | RELEASE | Data / DBA | Execute | Execute data migrations, validate integrity, and confirm rollback readiness before promotion. | Migration run → integrity check → rollback confirmation. | X09 | N02, N11 | O06 |
| 160 | TEST | Data / DBA | Execute | Run schema validation, migration smoke tests, and data quality checks. | Schema test → migration smoke → quality check. | X09 | N09, N11 | O02 |
| 171 | ANALYSIS | Platform / DevOps | Execute | Investigate pipeline bottlenecks, environment inconsistencies, and automation gaps. | Pipeline profiling → environment diff → gap log. | X09 | - | O02 |
| 172 | DESIGN | Platform / DevOps | Execute | Design CI/CD pipelines, environment topology, and infrastructure automation scripts. | Pipeline design → environment spec → automation scripts. | X09 | - | O01 |
| 173 | IMPLEMENTATION | Platform / DevOps | Execute | Implement pipeline changes, environment provisioning, and deployment automation. | Pipeline build → environment provision → deployment scripts. | X09 | - | - |
| 174 | RELEASE | Platform / DevOps | Execute | Validate pipeline integrity, environment readiness, and deployment automation before promotion. | Pipeline check → environment validate → deployment verify. | X09 | N02 | O06 |
| 175 | TEST | Platform / DevOps | Execute | Run pipeline validation tests, environment smoke checks, and infrastructure regression tests. | Pipeline test → environment smoke → infrastructure regression. | X09 | N09 | O02 |
| 186 | ANALYSIS | QA / Test Automation | Execute | Assess existing test suite coverage, tooling health, and automation gap extent. | Suite scan → coverage report → gap log. | X03 | N04 | O02 |
| 187 | DESIGN | QA / Test Automation | Execute | Design test automation framework, test data strategy, and continuous testing integration. | Framework design → test data plan → CI integration spec. | X03 | N04 | O02 |
| 188 | IMPLEMENTATION | QA / Test Automation | Execute | Implement automated test suites, test data fixtures, and CI pipeline integration. | Suite build → fixture setup → pipeline wiring. | X03 | - | - |
| 189 | RELEASE | QA / Test Automation | Execute | Execute regression suite, validate coverage gates, and confirm test evidence for release. | Regression run → gate check → evidence capture. | X03 | N02, N04 | O06 |
| 190 | TEST | QA / Test Automation | Execute | Run automation validation: suite correctness checks, coverage analysis, and false positive review. | Suite validation → coverage analysis → false positive triage. | X03 | N09 | O02 |
| 201 | ANALYSIS | Operations / SRE | Execute | Investigate reliability gaps, SLO compliance, observability coverage, and toil patterns. | Reliability audit → SLO compliance review → toil log. | X09 | N07, N12 | O02 |
| 202 | DESIGN | Operations / SRE | Execute | Design SLOs, error budgets, observability instrumentation, and reliability controls. | SLO definitions → error budget model → observability spec. | X09 | N07, N12 | O01 |
| 203 | IMPLEMENTATION | Operations / SRE | Execute | Implement SLO instrumentation, error budget tracking, and toil-reduction automation. | SLO instrumentation → error budget dashboards → toil automation. | X09 | N07, N12 | - |
| 204 | RELEASE | Operations / SRE | Execute | Verify SLO compliance, error budget status, and reliability gate readiness before promotion. | SLO check → error budget verify → reliability gate. | X09 | N02, N12 | O06 |
| 205 | TEST | Operations / SRE | Execute | Run chaos experiments, SLO stress tests, and reliability regression checks. | Chaos run → SLO stress test → reliability regression. | X09 | N09, N12 | O02 |
| 216 | ANALYSIS | Documentation / Knowledge | Execute | Audit documentation coverage, identify gaps, and surface stale or inaccurate content. | Doc audit → gap log → staleness log. | X10, X13 | - | O01 |
| 217 | DESIGN | Documentation / Knowledge | Execute | Design documentation information architecture, templates, and content governance model. | IA design → template set → governance model. | X13 | - | O01 |
| 218 | IMPLEMENTATION | Documentation / Knowledge | Execute | Create or update technical documentation, runbooks, ADRs, and knowledge corpus artifacts. | Doc creation → review → publish. | X13 | - | - |
| 219 | RELEASE | Documentation / Knowledge | Execute | Publish release documentation, update changelogs, and confirm documentation readiness. | Doc publish → changelog update → readiness confirmation. | X13 | N02 | O03 |
| 220 | TEST | Documentation / Knowledge | Execute | Validate documentation accuracy, link integrity, and coverage against the current system state. | Accuracy check → link validation → coverage verification. | X13 | N09 | O02 |

### Review Lane

| ID | Phase | Discipline | Lane | Description | Potential Workflow | Existing | Needed | Optional |
|---|---|---|---|---|---|---|---|---|
| 91 | ANALYSIS | Analysis | Review | Challenge assumptions, contradictions, and missing requirements before design. | Adversarial review → gap log → readiness call. | X01, X10 | N08 | O01 |
| 92 | ANALYSIS | Architecture | Review | Review discovery findings for architectural feasibility and bounded change. | Option critique → dependency risk review → shortlist. | X02, X10 | - | O01 |
| 93 | ANALYSIS | Engineering | Review | Review spike findings for viability, hidden complexity, and build cost. | Spike review → continue or stop → backlog update. | X03, X04 | - | O02 |
| 94 | ANALYSIS | Performance | Review | Review performance findings for measurement quality and budget risk. | Benchmark critique → risk ranking → recommendation. | X08, X10 | - | O02 |
| 95 | ANALYSIS | Product Management | Review | Review requirements for value clarity, scope discipline, and traceability. | Scope challenge → acceptance review → roadmap call. | X10, X11 | N08 | O04 |
| 96 | ANALYSIS | Project Management | Review | Review analysis progress, blockers, and readiness to enter design. | Status review → risk burndown → go/no-go. | X10, X11 | N06, N08 | O01 |
| 97 | ANALYSIS | Security | Review | Review discovered risks, threat coverage, and control assumptions. | Security finding review → severity ranking → guardrails. | X07, X10 | N08 | O02 |
| 98 | ANALYSIS | Support | Review | Review support risks, on-call burden, and operational blind spots. | Operability review → risk register → support criteria. | X09, X10 | N07, N08 | O05 |
| 99 | ANALYSIS | UX | Review | Review UX findings for clarity, accessibility implications, and unmet needs. | Finding critique → opportunity ranking → design handoff. | X05, X10 | N08 | O04 |
| 100 | DESIGN | Analysis | Review | Review design inputs for completeness, ambiguity, and execution readiness. | Requirement QA → ambiguity cleanup → approval note. | X10, X11 | N08 | O01 |
| 101 | DESIGN | Architecture | Review | Review architecture for cohesion, coupling, and change safety. | Architecture review → risk log → approved baseline. | X02, X10 | - | O01 |
| 102 | DESIGN | Engineering | Review | Review implementation design for feasibility, testability, and scope fit. | Technical design review → dependency check → ready verdict. | X03, X04 | - | O02 |
| 103 | DESIGN | Performance | Review | Review design against budgets, observability, and tuning headroom. | Perf design review → benchmark criteria → approval. | X08, X10 | - | O02 |
| 104 | DESIGN | Product Management | Review | Review planned scope for value density, sequencing, and stakeholder fit. | Roadmap review → MVP trim → acceptance baseline. | X10, X11 | N08 | O04 |
| 105 | DESIGN | Project Management | Review | Review design plans for realism, capacity, and dependency risk. | Readiness review → critical path check → replan call. | X10, X11 | N06, N08 | O01 |
| 106 | DESIGN | Security | Review | Review security design for completeness, abuse resistance, and policy fit. | Control review → misuse-case check → remediation list. | X07, X10 | N08 | O02 |
| 107 | DESIGN | Support | Review | Review support design for diagnosis speed and operational resilience. | Supportability review → runbook gap log → readiness call. | X09, X10 | N07, N08 | O05 |
| 108 | DESIGN | UX | Review | Review UX design for usability, accessibility, and requirement fit. | Design critique → accessibility pass → approved handoff. | X05, X10 | N08 | O04 |
| 109 | IMPLEMENTATION | Analysis | Review | Review implemented changes against original intent and accepted clarifications. | Intent check → change log review → acceptance note. | X10, X11 | N08 | O01 |
| 110 | IMPLEMENTATION | Architecture | Review | Review implementation for architecture drift and structural debt. | Drift check → boundary review → remediation note. | X02, X04 | - | O01 |
| 111 | IMPLEMENTATION | Engineering | Review | Review code, tests, and conformance to plans and standards. | Code review → test review → disposition. | X03, X04 | - | - |
| 112 | IMPLEMENTATION | Performance | Review | Review performance impact and regression risk of delivered changes. | Measure delta → compare budget → disposition. | X04, X08 | - | O02 |
| 113 | IMPLEMENTATION | Product Management | Review | Review delivered increment against product outcomes and acceptance criteria. | Demo → acceptance review → backlog follow-up. | X10, X11 | N08 | O04 |
| 114 | IMPLEMENTATION | Project Management | Review | Review progress, slippage, and readiness for the next increment. | Status review → variance check → next-wave decision. | X10, X11 | N06, N08 | O01 |
| 115 | IMPLEMENTATION | Security | Review | Review secure implementation, findings, and unresolved exposure. | Security review → exposure log → remediation decision. | X04, X07 | N08 | O02 |
| 116 | IMPLEMENTATION | Support | Review | Review operability artifacts and support readiness before broader testing. | Support review → alert gaps → readiness verdict. | X09, X10 | N07, N08 | O05 |
| 117 | IMPLEMENTATION | UX | Review | Review implemented UX for fidelity, accessibility, and user fit. | UX QA → a11y review → disposition. | X05, X06 | N08 | O04 |
| 118 | RELEASE | Analysis | Review | Review the promotion decision and the rationale for unresolved risk. | Release decision review → unresolved-risk note → sign-off. | X10, X11 | N02, N08, N10 | O03 |
| 119 | RELEASE | Architecture | Review | Review release architecture evidence for stability, rollback safety, and drift. | Compatibility review → rollback safety check → verdict. | X02, X09, X10 | N02, N08, N10 | O06 |
| 120 | RELEASE | Engineering | Review | Review release results for build integrity, defects, and rollback triggers. | Release review → smoke evidence → rollback decision. | X04, X09 | N02, N08, N10 | O03 |
| 121 | RELEASE | Performance | Review | Review production performance evidence against thresholds after promotion. | Metric review → threshold compare → stabilisation call. | X08, X10 | N02, N08, N10 | O03 |
| 122 | RELEASE | Product Management | Review | Review released value, adoption signals, and scope carryover. | Outcome review → feedback check → roadmap adjustment. | X10, X11 | N02, N08, N10 | O03, O04 |
| 123 | RELEASE | Project Management | Review | Review release execution quality, variance, and outstanding follow-up actions. | Timeline review → action ledger → closure decision. | X10, X11 | N02, N06, N08, N10 | O03 |
| 124 | RELEASE | Security | Review | Review release security evidence and unresolved exposure before or after go-live. | Security sign-off review → exposure check → disposition. | X07, X10 | N02, N08, N10 | O03 |
| 125 | RELEASE | Support | Review | Review support readiness and early-life incident handling after promotion. | Early-life support review → incident ledger → stabilisation call. | X09, X10 | N02, N07, N08, N10 | O03, O05 |
| 126 | RELEASE | UX | Review | Review released experience quality, regressions, and user feedback signals. | Experience review → regression triage → improvement note. | X05, X10 | N02, N08, N10 | O03, O04 |
| 127 | TEST | Analysis | Review | Review test evidence for requirement completeness and defect significance. | Traceability review → defect meaning → decision note. | X10, X11 | N04, N08 | O02 |
| 128 | TEST | Architecture | Review | Review test evidence for architecture integrity and systemic risk. | Failure-mode review → boundary risk note → disposition. | X02, X10 | N04, N08 | O02 |
| 129 | TEST | Engineering | Review | Review defects, regressions, and coverage sufficiency from engineering tests. | Test review → gap check → release recommendation. | X03, X04 | N04, N08 | O02 |
| 130 | TEST | Performance | Review | Review performance results against budgets and tuning thresholds. | Perf result review → budget compare → action call. | X08, X10 | N04, N08 | O02 |
| 131 | TEST | Product Management | Review | Review accept or reject decisions using product-oriented test evidence. | Acceptance review → scope call → next action. | X10, X11 | N04, N08 | O04 |
| 132 | TEST | Project Management | Review | Review test progress, risk burndown, and release readiness. | Test status review → risk burndown → readiness call. | X10, X11 | N04, N06, N08 | O01 |
| 133 | TEST | Security | Review | Review security test evidence, exposures, and release blockers. | Finding review → blocker decision → remediation path. | X07, X10 | N04, N08 | O02 |
| 134 | TEST | Support | Review | Review support test evidence for operability and response readiness. | Drill review → runbook gaps → readiness verdict. | X09, X10 | N04, N07, N08 | O05 |
| 135 | TEST | UX | Review | Review UX test findings for severity, usability impact, and release risk. | UX finding review → severity rank → disposition. | X05, X10 | N04, N08 | O04 |
| 146 | ANALYSIS | Governance | Review | Review governance discovery for coverage of material control areas and policy obligations. | Gap review → obligation completeness → readiness call. | X10, X12 | N08 | O01 |
| 147 | DESIGN | Governance | Review | Review governance design for control completeness, policy alignment, and audit defensibility. | Control review → policy check → audit readiness verdict. | X10, X12 | N08 | O01 |
| 148 | IMPLEMENTATION | Governance | Review | Review implemented governance artifacts for standards conformance, coverage, and policy alignment. | Artifact review → standards check → remediation note. | X10, X12 | N08 | O01 |
| 149 | RELEASE | Governance | Review | Review governance sign-off evidence and compliance completeness before or after promotion. | Evidence review → compliance check → disposition. | X10, X12 | N02, N08, N10 | O03 |
| 150 | TEST | Governance | Review | Review governance test evidence for control efficacy, policy adherence, and audit readiness. | Control evidence review → audit readiness check → disposition. | X10, X12 | N04, N08 | O01 |
| 161 | ANALYSIS | Data / DBA | Review | Review data discovery findings for schema risk, quality assumptions, and migration complexity. | Schema risk review → quality gap log → migration assessment. | X09, X10 | N08, N11 | O01 |
| 162 | DESIGN | Data / DBA | Review | Review schema design and migration approach for integrity, rollback safety, and performance impact. | Schema review → migration risk check → performance note. | X02, X09, X10 | N08, N11 | O01 |
| 163 | IMPLEMENTATION | Data / DBA | Review | Review implemented migrations and data access changes for correctness and reversibility. | Migration review → rollback check → data access review. | X04, X09 | N08, N11 | O01 |
| 164 | RELEASE | Data / DBA | Review | Review migration evidence, integrity results, and rollback readiness before promotion. | Migration evidence review → integrity check → rollback verdict. | X09, X10 | N02, N08, N10, N11 | O03 |
| 165 | TEST | Data / DBA | Review | Review data quality test results, migration validation evidence, and schema regression findings. | Data test review → migration evidence → schema regression check. | X09, X10 | N04, N08, N11 | O02 |
| 176 | ANALYSIS | Platform / DevOps | Review | Review platform findings for pipeline risk, environment quality, and automation debt. | Pipeline risk review → environment gap log → automation assessment. | X09, X10 | N08 | O01 |
| 177 | DESIGN | Platform / DevOps | Review | Review pipeline design and environment topology for reliability, security, and maintainability. | Pipeline design review → security check → maintainability note. | X09, X10 | N08 | O01 |
| 178 | IMPLEMENTATION | Platform / DevOps | Review | Review pipeline implementation and automation scripts for correctness, security, and idempotence. | Pipeline review → security check → idempotence verification. | X04, X09 | N08 | O01 |
| 179 | RELEASE | Platform / DevOps | Review | Review pipeline execution results and environment readiness evidence after promotion. | Pipeline evidence review → environment check → stability verdict. | X09, X10 | N02, N08, N10 | O03 |
| 180 | TEST | Platform / DevOps | Review | Review pipeline test results and environment validation evidence for release readiness. | Pipeline test review → environment evidence → readiness verdict. | X09, X10 | N04, N08 | O02 |
| 191 | ANALYSIS | QA / Test Automation | Review | Review test automation findings for coverage quality, tooling gaps, and automation debt severity. | Coverage review → tooling gap log → debt assessment. | X03, X10 | N04, N08 | O02 |
| 192 | DESIGN | QA / Test Automation | Review | Review test automation design for coverage completeness, maintainability, and framework fitness. | Design review → coverage check → maintainability note. | X03, X04 | N04, N08 | O02 |
| 193 | IMPLEMENTATION | QA / Test Automation | Review | Review implemented test suites for correctness, coverage sufficiency, and CI integration quality. | Suite review → coverage check → CI integration review. | X03, X04 | N04, N08 | O02 |
| 194 | RELEASE | QA / Test Automation | Review | Review regression suite results and test evidence quality for release sign-off. | Regression review → evidence quality check → sign-off decision. | X03, X10 | N02, N04, N08, N10 | O03 |
| 195 | TEST | QA / Test Automation | Review | Review automation validation results for suite health, coverage quality, and regression risk. | Suite validation review → coverage verdict → regression risk note. | X03, X10 | N04, N08, N09 | O02 |
| 206 | ANALYSIS | Operations / SRE | Review | Review reliability findings for SLO gap severity, observability quality, and toil impact. | Reliability review → SLO gap severity → toil impact note. | X09, X10 | N08, N12 | O01 |
| 207 | DESIGN | Operations / SRE | Review | Review SLO definitions, error budget policy, and observability design for completeness. | SLO review → error budget check → observability assessment. | X09, X10 | N08, N12 | O01 |
| 208 | IMPLEMENTATION | Operations / SRE | Review | Review SLO instrumentation, error budget tracking, and toil automation for correctness. | SLO instrumentation review → error budget verify → toil check. | X04, X09 | N08, N12 | O01 |
| 209 | RELEASE | Operations / SRE | Review | Review SLO compliance evidence, error budget status, and reliability gate results after promotion. | SLO evidence review → error budget check → reliability disposition. | X09, X10 | N02, N08, N10, N12 | O03 |
| 210 | TEST | Operations / SRE | Review | Review chaos experiment results, SLO test evidence, and reliability regression findings. | Chaos results review → SLO evidence → reliability verdict. | X09, X10 | N04, N08, N12 | O02 |
| 221 | ANALYSIS | Documentation / Knowledge | Review | Review documentation findings for coverage completeness, staleness severity, and gap priority. | Coverage review → staleness ranking → gap priority note. | X10, X13 | N08 | O01 |
| 222 | DESIGN | Documentation / Knowledge | Review | Review documentation design for structure clarity, completeness, and long-term maintainability. | Design review → structure check → maintainability note. | X10, X13 | N08 | O01 |
| 223 | IMPLEMENTATION | Documentation / Knowledge | Review | Review created documentation for accuracy, clarity, and standards conformance. | Doc review → accuracy check → standards conformance note. | X04, X13 | N08 | O01 |
| 224 | RELEASE | Documentation / Knowledge | Review | Review release documentation completeness, accuracy, and publication readiness. | Release doc review → accuracy check → publication verdict. | X10, X13 | N02, N08, N10 | O03 |
| 225 | TEST | Documentation / Knowledge | Review | Review documentation validation results for accuracy gaps, link failures, and coverage deficiencies. | Validation review → gap ranking → coverage verdict. | X10, X13 | N04, N08 | O02 |

---

## New Customisation Write-Up

### Needed Customisations

| Code | Specialisation | Why it is needed |
|---|---|---|
| N01 | `analysis-execution` skill owns structured discovery execution, contradiction logging, and requirement hardening. | The workspace has strong planning assets but discovery execution is split across `plan-researcher`, `refine-ideas`, and ad hoc analysis. This gap is visible across Analysis and Design combinations. |
| N02 | `release-readiness` skill owns promotion gates, rollback readiness, smoke verification, and release evidence collation. | Release appears across 18 matrix cells but the current workspace has no dedicated release workflow asset that turns engineering output into promotion-ready evidence. |
| N03 | `support-triage` skill standardises incident intake, severity, repro data capture, and routing. | Support work is under-served. `defect-debugger` helps once a defect is in hand, but triage and evidence collection before debugging remain weak. |
| N04 | `test-design-review` skill owns test strategy quality, coverage rationale, traceability, and exit criteria. | The workspace has TDD and testing policy but lacks a test-planning and test-review workflow spanning Engineering, Security, Performance, UX, and Product acceptance. |
| N05 | `product-scope-slicing` skill turns outcome statements into prioritised, acceptance-ready slices and release candidates. | Product planning exists but there is no focused asset for converting product intent into delivery slices with explicit acceptance and roadmap shape. |
| N06 | `governance-delivery` skill owns dependency control, milestones, RAID, and coordination rhythm. | Project Management combinations are covered only indirectly through planning assets and status reporting, leaving coordination-heavy work under-modelled. |
| N07 | `operability-design` skill owns runbooks, observability, supportability, and handoff readiness. | Support and Release combinations need a stronger operational design asset so supportability is designed in rather than bolted on late. |
| N08 | `acceptance-governance` skill standardises review checklists, evidence disposition, and sign-off behaviour across disciplines. | Many review cells currently rely on generic review assets. A cross-discipline acceptance layer makes reviews more deterministic and comparable. |
| N09 | `test-orchestration` skill coordinates multi-disciplinary test execution and evidence collation. | There is no unifying asset for executing integrated test passes combining performance, security, UX, support, and engineering evidence. |
| N10 | `governance-release.instructions.md` defines mandatory evidence, approval, rollback, and release artifact standards. | Release work is procedural and should be partially enforced through always-on policy rather than only situational guidance. |

### Optional Customisations

| Code | Specialisation | Why it adds value |
|---|---|---|
| O01 | `taxonomy-tag-registry` skill maintains consistent matrix tags across catalogs, plans, and future assets. | If this model becomes authoritative, tag drift will become a maintenance problem unless one asset owns consistency. |
| O02 | `experiment-design` skill standardises technical spikes, threat exercises, benchmarks, and usability experiments. | Many Analysis, Design, and Test combinations benefit from a shared way to define experiment goals, success criteria, and evidence shape. |
| O03 | `post-release-retrospective` skill captures release outcomes, lessons, and stabilisation follow-ups. | Release Review becomes more valuable when the workspace preserves learning, not just approval history. |
| O04 | `customer-feedback-synthesis` skill converts UX, support, and product signals into prioritised insights. | This improves the feedback loop between discovery, release outcomes, and future scope decisions. |
| O05 | `support-runbook-generator` skill standardises support handoff artifacts, playbooks, and escalation guides. | Complements `operability-design` by making support outputs more consistent and reusable. |
| O06 | `release-simulation` skill adds rehearsal, rollback drill, and game-day validation before promotion. | High-risk releases benefit from practice and evidence before real promotion, especially for architecture, security, and performance-sensitive changes. |

---

## Adoption Protocol

A cell may be promoted to a first-class customisation asset only when **both** of the following are true:

1. At least two matrix cells reference it and differ materially in deliverable shape or toolset from any existing bundle.
2. The promotion is recorded in an ADR or decision log entry citing the specific cells served.

---

## Governance and High-Signal Monitoring

| Signal | What triggers it | How to detect |
|---|---|---|
| Discipline list change | Any addition or removal to the Discipline column values | DEC-PDL-07: block adoption until matrix revisit is complete |
| Cell gap | A request arrives that has no existing bundle coverage | No X-code in the Existing column; treat as `tagged only` until promoted |
| Asset drift | A bundle member is renamed, removed, or split | Bundle legend becomes inconsistent with skills-discovery-index.md; use `governance-sync-customizations` or `governance-audit` |
| Stale matrix | Matrix version is older than the last discipline or bundle change | Compare matrix date against agents-discovery-index.md and skills-discovery-index.md modification dates |
| Promotion without evidence | A new customisation cites matrix cells without a decision record | Adoption Protocol check: require ADR or decision log entry before asset creation |

---

*Approved: 2026-04-17 | Revised: 2026-04-18 — Five disciplines added (Data / DBA, Platform / DevOps, QA / Test Automation, Operations / SRE, Documentation / Knowledge) per DEC-PDL-07 revisit*
*Matrix rows: 225 | Phases: 5 | Disciplines: 15 | Lanes: 3*
*Discipline change protocol: DEC-PDL-07 | ADR: adr-0001-phase-discipline-lane-model-adoption.md (amended 2026-04-18)*
