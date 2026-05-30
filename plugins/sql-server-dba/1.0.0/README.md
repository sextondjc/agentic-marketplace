# sql-server-dba

## Overview

- Purpose: Provide SQL Server operational and tuning capability with strong security and standards guardrails.
- Capability Provided: SQL Server automation, diagnostics, query tuning, security hardening, and T-SQL standards workflows.
- Why Install: Install this plugin to handle SQL Server administration and performance work with domain-specific governance controls.

## Version

- Plugin Name: sql-server-dba
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: 9e075c43a5b1ea043cc1452360c12accc29fa0cd36b72a1abbc29c5bf2dd8dff

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/sql-server-standards/SKILL.md | Skill | Use when authoring or reviewing T-SQL for SQL Server with safety, parameterization, naming, and compatibility standards. |
| skills/sql-server-security/SKILL.md | Skill | Use when designing, reviewing, or hardening SQL Server security across permissions, auditing, encryption, surface area, linked access, and operational least privilege. |
| skills/sql-server-query-tuning/SKILL.md | Skill | Use when diagnosing or improving SQL Server query performance with execution-plan evidence, indexing trade-offs, Query Store signals, and regression-safe validation. |
| skills/sql-server-orchestrator/SKILL.md | Skill | Use when one SQL Server request spans multiple capability areas and needs deterministic intake, phased ownership, and a unified cross-project execution contract. |
| skills/sql-server-diagnostics/SKILL.md | Skill | Use when diagnosing SQL Server health, bottlenecks, or regressions with evidence from waits, I/O, memory, tempdb, Query Store, Extended Events, and diagnostic query sets. |
| skills/sql-server-automation/SKILL.md | Skill | Use when automating SQL Server administration, maintenance, migration, backup, restore, configuration, or estate operations with repeatable, rollback-aware workflows. |
| prompts/review-project.prompt.md | Prompt | Wave-transition pre-flight prompt. Run before starting any new execution wave to verify plan alignment, artifact hygiene, and scope integrity. Satisfies GOV-S4 governance cadence requirement. |
| instructions/sql-dba.instructions.md | Instruction | SQL Server standards for T-SQL files: parameterization, naming, safety, and compatibility rules. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| agents/sql-dba.agent.md | Agent | Performs Microsoft SQL Server operational administration, schema inspection, and query execution. Use when live DBA work, schema analysis, or T-SQL is required. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | 83c7d0fe4bebfb2cfd2d55c6f19f94c47c977896ca55c6aed9c3d69cc511b9fd |
| skills/sql-server-standards/SKILL.md | 5a8a668651d18706dd57f8253f156607876c232c496f6f98ef8dd2e12c8423a3 |
| skills/sql-server-security/references/source-catalog.md | ac1f25ec565a121b646f1c0f3aecdb87ee7b74d7ec17368f305d7c82d6cb87ac |
| skills/sql-server-security/references/security-hardening-decision-template.md | 7a702f3a93f4d0aa170803107cd83d75e034f4601901d28dfb613ecd9e0e2aec |
| skills/sql-server-security/SKILL.md | e2d73ec931e5808fc883607fb707d2c98403d9250fefb3599bfb0580c0ae835a |
| skills/sql-server-query-tuning/references/source-catalog.md | 7caa02cf8471c63fe4f2d7346816279beff3dc82d92245ee9110248f629594a6 |
| skills/sql-server-query-tuning/references/query-tuning-evidence-template.md | 75d7ee0aa3afd07043037e1b857c3b668ea5fb12d07d2c480f8604be6865387e |
| skills/sql-server-query-tuning/SKILL.md | 078d548b9bc9b513e587363d2b6b0121044257802aa546cd3ae0054f54fd08d8 |
| skills/sql-server-orchestrator/references/sql-server-execution-contract-template.md | 2aab4fff55a62eee26481ceb5b8dadebe349e418975270ae6894d3b20a93a4c5 |
| skills/sql-server-orchestrator/references/source-catalog.md | 4a289041d48263dcd28caceb946f8a652a6615e9f6dfe1f42960b63852caeeef |
| skills/sql-server-standards/references/source-catalog.md | 9b2473edcd4e2e973699e5cb2848752bde3c273e77dea9d8b4182d985dd8e41d |
| skills/sql-server-orchestrator/SKILL.md | 16af8def289dbe309f67b56cac9a581e5d355090b2b1e8dd0cd396b471440e46 |
| skills/sql-server-diagnostics/references/diagnostic-evidence-template.md | 6bdaf5723c476fa2832b8abf130d285edc2152e09320e31af2b5db355e7e81e3 |
| skills/sql-server-diagnostics/SKILL.md | fa4a3b1f94164ff0ff03b3c428bfa87686033c1d2e803405f070ba1a90ad8f2f |
| skills/sql-server-automation/references/source-catalog.md | be46de307f8a0a973b1bf257f406b238ce028803aee9a10f67da0cf8b0dbe432 |
| skills/sql-server-automation/references/automation-runbook-template.md | 243c6da03a0b0922cf0ad0cf88681ba6380c3ffcf22f7651f748eb15e939a5c9 |
| skills/sql-server-automation/SKILL.md | ba6375d33587cc669156bdd0939bd48146edd7b769ad1bc48ec1140830579ac1 |
| prompts/review-project.prompt.md | 6e1791999309b2cce187c7752f48baf83bc585ee093095fb05cd237b5987a92f |
| instructions/sql-dba.instructions.md | c640745f905d075d1e951ade42fbda15006d37f2004a0f0861d103854b0f2315 |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| agents/sql-dba.agent.md | 7dd4d9d8a50db582988960552d8ecee9d6abd3f8cf2afc971bf80b98c774829e |
| skills/sql-server-diagnostics/references/source-catalog.md | f1cc751a17adf713ba50ac90eb9a9a6ed7c5818e2d5627c29880ddd99de1159e |
| skills/sql-server-standards/references/sql-exception-log-template.md | c4bf0a0277edba46019d41223ae28ef2bebe6199336e32679b8e61bd6664b2b9 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
