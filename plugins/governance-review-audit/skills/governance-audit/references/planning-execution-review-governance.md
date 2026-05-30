<!-- markdownlint-disable-file -->
# Planning, Execution, Review Governance

## Objective

Provide a deterministic operating model where agents, instructions, prompts, and skills compose predictably with traceable decisions, parallel execution readiness, and minimal rework.

## Lane Definitions

| Lane | Responsibility | Primary Output | Exit Condition |
|---|---|---|---|
| Planning | Analyze intent, constraints, and dependencies; produce execution-ready work packages. | Grid-first markdown plan packets in `.docs/plans` and supporting context in `.docs/research`. | Every work package has owner, scope, acceptance criteria, risk controls, and handoff data. |
| Execution | Build approved artifacts from planning packets. | Code, tests, docs, scripts, workflows, and change entries. | Artifact acceptance criteria are met and evidence is recorded. |
| Review | Validate quality, correctness, security, and adherence to standards. | Review reports with findings, risk ratings, and required actions. | Findings are resolved or explicitly accepted with decision record. |

## Traceability Model

Use immutable IDs in all lifecycle artifacts.

| ID Type | Pattern | Required In |
|---|---|---|
| Vision ID | `VIS-YYYYMMDD-###` | Vision statement and top-level plan packet |
| Plan ID | `PLAN-YYYYMMDD-###` | Planning packet, execution notes, and review report |
| Workstream ID | `WS-##` | Planning rows and execution tasks |
| Decision ID | `DEC-##` | Architecture, routing, or scope decisions |
| Review ID | `REV-YYYYMMDD-###` | Review report and disposition tracking |

## Planning Packet Contract (Grid-First)

Planning output should prefer markdown grids over narrative text.

### Required Grid A: Intent and Scope

| Plan ID | Vision ID | Goal | In Scope | Out of Scope | Assumptions | Constraints |
|---|---|---|---|---|---|---|
| PLAN-... | VIS-... | ... | ... | ... | ... | ... |

### Required Grid B: Parallel Workstreams

| Workstream ID | Lane Owner | Agent/Skill/Prompt | Inputs | Outputs | Dependencies | Parallel Group |
|---|---|---|---|---|---|---|
| WS-01 | Planning | ... | ... | ... | ... | P1 |

### Required Grid C: Acceptance and Governance

| Workstream ID | Acceptance Criteria IDs | Security Checks | Test/Validation Evidence | Review Gate | Exit Decision ID |
|---|---|---|---|---|---|
| WS-01 | AC-001, AC-002 | ... | ... | Required | DEC-01 |

### Required Grid D: Session Survival Handoff

| Workstream ID | Current State | Next Action | Blockers | Resume Command/Prompt | Artifact Links |
|---|---|---|---|---|---|
| WS-01 | In progress | ... | None | ... | ... |

## Execution Contract

- Execution lane must only consume approved planning packets with Plan ID.
- Execution outputs must map each change back to Workstream ID and Acceptance Criteria IDs.
- Execution updates must append durable change evidence under `.docs/changes`.
- If execution discovers missing planning context, it must raise a `DEC-##` request rather than improvising scope.

## Review Contract

- Review lane must evaluate output against plan acceptance grids and active instruction files.
- Review must classify findings by severity (`High`, `Medium`, `Low`) and map each finding to Workstream ID.
- Review completion requires explicit disposition for each finding: `Resolved`, `Accepted Risk`, or `Deferred with Decision ID`.

## Routing Rules

- Start in Planning when user intent is broad, ambiguous, or multi-domain.
- Transition to Execution only when planning grids are complete enough for parallel work.
- Transition to Review when execution outputs are present or when governance audits are requested.
- Mixed requests must be split into explicit phase checkpoints.

## Required Catalogs

Maintain lifecycle mappings in:

- [agents-discovery-index.md](./../../../catalogs/agents-discovery-index.md)
- [instructions-discovery-index.md](./../../../catalogs/instructions-discovery-index.md)
- [prompts-discovery-index.md](./../../../catalogs/prompts-discovery-index.md)
- [skills-discovery-index.md](./../../../catalogs/skills-discovery-index.md)

Each catalog entry should include at least `Primary Lane`, `Secondary Lane`, and `Rationale`.

## Outcome

This model enables high-speed, low-rework delivery by forcing explicit lane ownership, explicit handoffs, and auditable decisions.

