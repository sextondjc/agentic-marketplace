# planning-strategy-design

## Overview

- Purpose: Provide planning-first strategy support for shaping work, defining outcomes, and preparing execution-ready delivery slices.
- Capability Provided: Research-informed planning, product slicing, forecasting, and decision-structure artifacts.
- Why Install: Install this plugin to improve planning quality and reduce execution ambiguity before implementation begins.

## Version

- Plugin Name: planning-strategy-design
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: 96bc55f099c7bf694d0d16242f25c8b7740f2aedaa0c27a06de9ba6d044bdfa1

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/delivery-orchestration/SKILL.md | Skill | Use when one deterministic intake must coordinate the full project-management and delivery lifecycle across intake, shaping, backlog, execution control, forecasting, release, change control, and outcome learning. |
| skills/experiment-design/SKILL.md | Skill | Use when designing technical spikes, threat experiments, benchmark experiments, or usability tests — produces a structured experiment with hypothesis, success criteria, scope boundary, and evidence format before execution begins. |
| skills/flow-metrics/SKILL.md | Skill | Use when defining workflow states, WIP policy, delivery metrics, and improvement rules so agents and teams can manage flow with explicit signals instead of intuition. |
| skills/governance-delivery/SKILL.md | Skill | Use when a delivery initiative spans multiple disciplines or teams and needs dependency mapping, milestone tracking, RAID log management, and delivery coordination. |
| skills/learn-topics/SKILL.md | Skill | Use when building a specialist learning path that must decompose a topic by depth, keep source traceability, and optionally produce validated asset recommendations for capability gaps. |
| skills/opportunity-mapping/SKILL.md | Skill | Use when turning desired outcomes into opportunity maps, solution hypotheses, and assumption-test plans that agents and teams can execute without discovery ambiguity. |
| skills/prd-generator/SKILL.md | Skill | Use when creating comprehensive, traceable PRDs for features, products, or epics before implementation begins. |
| skills/probabilistic-forecasting/SKILL.md | Skill | Use when throughput data, cycle time records, or flow signals must be turned into confidence-based forecasts using simulation or percentile mechanics — covering Monte Carlo simulation, cycle time scatterplots, throughput histograms, and percentile-based service level agreements. |
| skills/product-scope-slicing/SKILL.md | Skill | Use when converting product intent, outcome statements, or discovery findings into prioritised, acceptance-ready delivery slices and release candidates. |
| skills/refine-ideas/SKILL.md | Skill | Use when capturing raw ideas and iteratively refining them through structured challenge loops and targeted topic learning before committing to implementation. |
| skills/delivery-operating-system/SKILL.md | Skill | Use when a project needs one expert-level, agent-usable project management and delivery operating model spanning discovery, shaping, backlog structure, flow control, release control, and learning loops. |
| skills/delivery-forecasting/SKILL.md | Skill | Use when throughput, WIP, service expectations, and scope boundaries must be turned into confidence-based delivery forecasts for date, scope, or commitment decisions. |
| agents/architecture-designer.agent.md | Agent | Unified agent for architectural decision records, domain-driven design guidance, and architectural blueprint synthesis. |
| agents/plan-researcher.agent.md | Agent | Unified agent for deep research, structured planning, and executable implementation checklists. |
| agents/topic-learner.agent.md | Agent | Specialist learning orchestrator that decomposes a topic into depth-calibrated subtopics, tracks sources, and routes skill/customization authoring when capability gaps are confirmed. |
| agents/ux-designer.agent.md | Agent | Specialist for UX research, wireframe design, prototype definition, usability validation, and engineering handoff across web and mobile surfaces. Does not write production code. |
| instructions/prd.instructions.md | Instruction | Merged specification + PRD authoring guidelines. |
| instructions/technical-docs.instructions.md | Instruction | Unified documentation, component, README, and specification generation standards. |
| instructions/ux-design.instructions.md | Instruction | UX design policy standards: accessibility baseline, interaction conventions, and wireframe/prototype mandates. |
| prompts/review-technical-docs.prompt.md | Prompt | Prompt to run a full technical documentation review, update stale docs, create missing docs, and validate links across the workspace. |
| skills/acceptance-criteria/SKILL.md | Skill | Use when turning backlog items or delivery slices into testable acceptance criteria, scenario boundaries, and done gates that agents can validate without guessing intent. |
| skills/adr-generator/SKILL.md | Skill | Use when documenting architectural decisions in .docs/adr with explicit rationale, alternatives, and consequences. |
| skills/analysis-execution/SKILL.md | Skill | Use when discovery work must produce traceable requirements, not just notes — covers structured discovery execution, assumption ledger, contradiction logging, synthesis, and requirement hardening. |
| skills/backlog-structuring/SKILL.md | Skill | Use when converting goals or validated opportunities into an explicit backlog hierarchy, ordering model, and item schema that agents can plan, execute, and report against. |
| skills/critical-thinking/SKILL.md | Skill | Use when pressure-testing assumptions, clarifying requirements, and evaluating trade-offs before implementation. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | 71fffc034e5efc2b116cdcbdee80233f1d3e9cba353819b8665d0a4b42fdaf03 |
| skills/delivery-orchestration/SKILL.md | 38e54dbd76c644ccd785d705e0a0cf13112ead6f465eb93ec20d02a1b66a1bf2 |
| skills/delivery-orchestration/references/source-catalog.md | 6c3579f4bbc385d56a8cf14e14fab092522610ce9448a4bee1aee02b264f4fde |
| skills/experiment-design/SKILL.md | e600596c0fada9c227dc3cd1ffe1cb7ef1d657a9b3cc824f12f818568257d7c1 |
| skills/flow-metrics/SKILL.md | 37e4fc608c36aa0556360585dabe32bf37f2a258ac03b55cf077851857b3251d |
| skills/flow-metrics/references/source-catalog.md | 0f7158cd90e0e77a57d191d593c429fa628e1b7f96e25264040f39440dc74940 |
| skills/governance-delivery/SKILL.md | 11e2fe8ed0e39dd8ca3973484e0b7876076c110fc0546d646aa38da37f7da348 |
| skills/learn-topics/SKILL.md | 7aca702814fefb941cf9382c358dbb8809fa6fbeaf5f82b9f632ee52537720ea |
| skills/learn-topics/references/source-ledger-template.md | 9c224f31ee64547878a40899ef6cd81afae7d8df2e5b4e1327db59667f314103 |
| skills/opportunity-mapping/SKILL.md | 3d329ec48274187320b29f0f2899f93ba9f076e51e586d8d1596d56ef6726a47 |
| skills/opportunity-mapping/references/source-catalog.md | 3d9f5f59da2f01ea65e64b0196750da71b241c32aa294c146d3813b763c03a41 |
| skills/prd-generator/SKILL.md | 876d8def2e702e48e3ad52225c253b9555438dc66e181adc4429e4fcdda903c6 |
| skills/prd-generator/references/prd-template.md | c32ed62f5bdb02b7ae9b5770cb394301382c7e8c503b4ae830d6c93235a2e832 |
| skills/probabilistic-forecasting/SKILL.md | 2b8f19e7bc6cca61b1443dc133c8de5ac82966b5bcebda134a8c879642f0ae0f |
| skills/probabilistic-forecasting/references/source-catalog.md | 907ed2ea57d9fce5f21267f0b832cacd9398c987b7bc594b263915c6f166ef46 |
| skills/product-scope-slicing/SKILL.md | b3bd9490b6137b6b6e3747f7360b0d9bffc403286c3c3062d095a6b1a08c4e28 |
| skills/delivery-operating-system/references/source-catalog.md | 7821100122ec06a0a39681056a15861612589184f8e87d334bc2ba4fc336817d |
| skills/refine-ideas/SKILL.md | 7bc30073b6e4e67dc77468a1cf0d76d0bf694e1d8edd3fc239b9bd63e5acd9a1 |
| skills/delivery-operating-system/SKILL.md | 7991996c55c3d7c8add6d526c89e54b4036b24d28f81b5726b78ad13d4ff623d |
| skills/delivery-forecasting/SKILL.md | 5a87f0c1e1515c8aaa87265be6aceb81eac77d009e94025eb5e59736f29f6b7d |
| agents/architecture-designer.agent.md | 19b2acf36cef83ccf06cf9c1d397c923822141c695b1a302430ca05c5b182f25 |
| agents/plan-researcher.agent.md | 64ac5addaf3f4b2a2ed02e09973dbef49aa88b24d14c4538dfba808e4b57d913 |
| agents/topic-learner.agent.md | 2109b5c55d0cdb8f4f42c9a784aeba95ad2da875570a51a12e666e558c2a4260 |
| agents/ux-designer.agent.md | eae58b89ffb2e0db0410aad0692c5b75c1d06e1a60c4fc210f78765d743df08d |
| instructions/prd.instructions.md | 97159aa3028656e64e02de74188ed86f3b3919c5c56a96c7d3b1ed9caa6ba856 |
| instructions/technical-docs.instructions.md | 61c82515bd8f076a0c33f625587b0b5e8ef093922edc52ccf976da168ad7a025 |
| instructions/ux-design.instructions.md | 30159d3abcc057c853d2492aa00e3600fe09508ca566f8474f7093d105211e2b |
| prompts/review-technical-docs.prompt.md | 65fe2d20077866d99fc66bb3efaaf96838dc01bc4efdb5d68c1b0d3de7c372b7 |
| skills/acceptance-criteria/SKILL.md | 3d179bbdcd83fb90c8b1389593c0784c6daaf56f22519d664c7d5b60e665e40c |
| skills/acceptance-criteria/references/source-catalog.md | 08aeef609ffce3565696f8c8820907e09286e4ae6333d2280899d39d03ce076e |
| skills/adr-generator/SKILL.md | fba543376eaf8643ab46c2c46b99598e2af1c76f8752ce0ad04e9f29d07c6133 |
| skills/analysis-execution/SKILL.md | 1f35f5e07c9b9c2fe383f3b0f7dd75e220b0330bcf4ac2f2705466c26709e7eb |
| skills/backlog-structuring/SKILL.md | a4f218f3eb97af260f68ecd27dc3cb0ed739c68ae36975e4e7a60884b3c005a0 |
| skills/backlog-structuring/references/source-catalog.md | dd1f32bbb0132fd30606e655395f0b4d984e2ef1917dcb8fbfd59bccc2b8fc1a |
| skills/critical-thinking/SKILL.md | b900846a01cc4b28e5ad2d9f8f064e73be9e23172a755a6cc8efd01fec96bd2c |
| skills/delivery-forecasting/references/source-catalog.md | 598f59ebba20e271c868999454d203f47b552e04f75e79b53671242839f4028f |
| skills/refine-ideas/references/idea-refinement-session-template.md | 55d509383414dd32b1d56c62ddeed2b4a2f3f459fa13b65dfff7ab901268da07 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
