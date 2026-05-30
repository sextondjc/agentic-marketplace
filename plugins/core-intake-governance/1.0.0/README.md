# core-intake-governance

## Overview

- Purpose: Provide a shared governance control plane that standardizes request intake, policy routing, and lifecycle guardrails across plugin compositions.
- Capability Provided: Deterministic intake, governance enforcement, and cross-plugin composition control.
- Why Install: Install this plugin to ensure all downstream workflows start with consistent routing, boundary control, and compliance defaults.

## Version

- Plugin Name: core-intake-governance
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: 3394a0698941d6f74145587b8d021f22ace47688e5d139f9df11885ba0c9f19a

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/work-intake-governance/SKILL.md | Skill | Use when raw requests, ideas, incidents, or stakeholder asks must be classified, bounded, and admitted, deferred, rejected, or routed before they enter planning or delivery. |
| skills/taxonomy-tag-registry/SKILL.md | Skill | Use when maintaining consistent Phase x Discipline x Lane tags across catalogs, plans, and workspace artifacts to prevent taxonomy drift. |
| skills/task-research/SKILL.md | Skill | Use when comprehensive project research is needed before planning or implementation decisions. |
| skills/task-execution/SKILL.md | Skill | Use when executing implementation plans with independent tasks in the current session |
| skills/scope-change-control/SKILL.md | Skill | Use when active delivery scope is under pressure from adds, swaps, descopes, or exceptions and each change must be evaluated, approved, rejected, or deferred with explicit impact analysis. |
| skills/route-customization/SKILL.md | Skill | Use when deciding whether a behavior should be implemented as a custom agent, an instruction file, or a reusable skill. |
| skills/plans/SKILL.md | Skill | Use when you have a written implementation plan to execute in a separate session with review checkpoints |
| skills/compose-skills/SKILL.md | Skill | Use when a request needs deterministic multi-skill composition through an explicit orchestration contract while preserving skill self-containment. |
| prompts/run-delivery-pattern.prompt.md | Prompt | Invoke the workspace ratified delivery pattern for a named workstream. Routes through orchestrator with the approved 12-phase sequence, enforces all approval gates, and produces a durable artifact at every phase. |
| prompts/review-project.prompt.md | Prompt | Wave-transition pre-flight prompt. Run before starting any new execution wave to verify plan alignment, artifact hygiene, and scope integrity. Satisfies GOV-S4 governance cadence requirement. |
| prompts/execute-delivery.prompt.md | Prompt | Session-start prompt for orchestrator-first execution continuation with parallel-safe dispatch, aggressive traceability updates, and status-first reporting. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| instructions/request-economy.instructions.md | Instruction | Policy to minimize premium-request usage and context-window consumption while preserving high-confidence reasoning. |
| instructions/governance-release.instructions.md | Instruction | Mandatory rules for release artifact evidence, approval chain, rollback documentation, and release notes format. |
| instructions/governance-naming-conventions.instructions.md | Instruction | Asset naming standards for agents, instructions, skills, and prompts to ensure consistency, discoverability, and cross-project portability. |
| instructions/governance-lifecycle.instructions.md | Instruction | Defines mandatory Planning, Execution, and Review lane classification and traceable handoff requirements for customization artifacts. |
| agents/orchestrator.agent.md | Agent | Coordination and scope-control agent that classifies requests, routes category-based handoffs to specialist assets, and enforces enterprise delivery and review phase boundaries. |
| skills/writing-plans/SKILL.md | Skill | Use when you have a spec or requirements for a multi-step task, before touching code |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | 0539d878607cb3581e4453dfc6c5d6c8600442918bfd60b63a0db949d12198ff |
| skills/work-intake-governance/references/source-catalog.md | 8c921869f4defd54ad5b1dc700bcff6de604a17d8761f2abbf1aba608bece454 |
| skills/work-intake-governance/SKILL.md | e1cb699d69788e4baeb7232c0b08f1bf5ac5f9b9ad08cd1117c8fc26795503b7 |
| skills/taxonomy-tag-registry/references/naming-conventions.json | dce0280fb67c8eb57f346d9c239118bb5ed8b1d78e4457b0dd01a62f4cc61e35 |
| skills/taxonomy-tag-registry/SKILL.md | d85432a822c38ab7a3fde223070d2f220ee40b192cb528e3c3d27c79ee45b4b9 |
| skills/task-research/references/research-template.md | bc670c280b20b176f5a4dfdc14260dd7bcf593b13ba71f846df01588a863b0bc |
| skills/task-research/SKILL.md | f350b583d8fad5c3ca0b2524ee81ddce3a8973ed283549329703e7110a2d3f25 |
| skills/task-execution/references/subagent-dispatch-patterns.md | 7cc89dd6f7956d5f05640eb39266beb4ab89b08c612798be4257abcafed28e04 |
| skills/task-execution/references/command-patterns.md | 16f0c2a7d1d7fe187b37db3899f70d0abc5b8b2634737050dc3e20451fc69d1d |
| skills/task-execution/spec-reviewer-prompt.md | 631980e472eec5394de8b89b69d432e54fd3f7f523ecf9afa7eb4cda0c9b2baf |
| skills/task-execution/SKILL.md | bc5b20267a6cce065cbc006485d15026406e990dffde33ab99a96c637539a25f |
| skills/task-execution/implementer-prompt.md | a416193f881e5a712c988fffabfe1d5a97bffcd091eb95577c84fe2136588617 |
| skills/task-execution/code-quality-reviewer-prompt.md | 1ee2481f76b22f1bf01d78e64164850ddac8b238f856c1d5b05617c70b134531 |
| skills/scope-change-control/references/source-catalog.md | 9611c3704844a784eac438b10a041b08f2e6c42cac46cb9a0375ef73a1cd245a |
| skills/scope-change-control/SKILL.md | 3eb29081b8b9f6007160396eb8f6ddd97811a35b1f1818ea871f574ed3c209ce |
| skills/route-customization/references/output-template.md | 8bcec8c80ddbbeacdc1f9f4a6217d8247920e85d32c0174eb94c2bb6f0203e48 |
| skills/route-customization/SKILL.md | f2af3bedd821e082867293f0866e282e2aa34ff39c80e898cecb0a19acb7c3b2 |
| skills/plans/SKILL.md | 2f8ad36643e85de3f135b0f95f97fd4eca247970b3b273b1f5e514acba215909 |
| skills/compose-skills/references/routing-benchmark-cases.json | cab26107b131ba616a1996c6b82a76c5ecc5c48af8590e63deb6211624fdacce |
| skills/compose-skills/references/capability-routing-registry.json | 38fb2c148d40c953c2e9341843ef22829af24fe16abb7e233d7783b65c598ea1 |
| skills/compose-skills/SKILL.md | fbe439579fa2f3ee995dabc55c2c1ef5a2c6dcf231defcf1c45e677196bfb95a |
| prompts/run-delivery-pattern.prompt.md | 9b76e9361f442bbd9ffe6a049691131d16fd5a889cf94713a8930beb59ee9076 |
| prompts/review-project.prompt.md | 6e1791999309b2cce187c7752f48baf83bc585ee093095fb05cd237b5987a92f |
| prompts/execute-delivery.prompt.md | 3f95cb30768d39d2f3dd4df306c94c28be1124184ed3e192fac11e5b7d2b0039 |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| instructions/request-economy.instructions.md | c0b5d857d31be675a1795344a12ec10bd393ea4ae6dac532f28afdea3d920268 |
| instructions/governance-release.instructions.md | de32e578be6976e5761ba008abd410ac70484826914b08b93f7b0cb198c1d8e3 |
| instructions/governance-naming-conventions.instructions.md | d3de0dee13265b59d79e1c3b5c3fa6cb1d69211dda19d94fcdc89a8ec143d5c9 |
| instructions/governance-lifecycle.instructions.md | c51a9a1ed54894a3cc704bbc098069ea7e0a03125479436089522e9df1a0f529 |
| agents/orchestrator.agent.md | 069094b3998006a9911bae2c38b9122b738b78d71581ad87bd719c91fa32f747 |
| skills/writing-plans/plan-document-reviewer-prompt.md | 6fce2aa83c63715697e9dd86050c820716100b91efbd9f12bab8477ecc060256 |
| skills/writing-plans/SKILL.md | 83923567781721ea050232c8cf452b85491af650ef4fa537e45be38434c69047 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
