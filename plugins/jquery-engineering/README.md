# jquery-engineering

## Overview

- Purpose: Provide a jQuery specialization bundle for implementation, modernization, security, and test quality workflows.
- Capability Provided: jQuery core, events, AJAX, plugin patterns, migration, performance, security, and quality-gate workflows.
- Why Install: Install this plugin to execute targeted jQuery work with stronger migration and quality controls.

## Version

- Plugin Name: jquery-engineering
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:42:32.1011507Z
- Plugin SHA-256: 1ddaef082c9c183c2875e81121b81c01ee0706541fe399a23d2bc29e7e6fe1dd

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/jquery-security/SKILL.md | Skill | Use when reviewing jQuery code for XSS vulnerabilities, unsafe HTML injection, insecure AJAX patterns, CSRF exposure, and Content Security Policy compliance. |
| skills/jquery-quality-gate/SKILL.md | Skill | Use when jQuery code or a jQuery-dependent project needs an expert, evidence-first quality decision covering correctness, security, performance, migration safety, and test coverage before merge or promotion. |
| skills/jquery-plugins/SKILL.md | Skill | Use when authoring jQuery plugins, integrating jQuery UI widgets, using jQuery Validation, or evaluating community plugins against safety and API-contract standards. |
| skills/jquery-performance/SKILL.md | Skill | Use when diagnosing or improving jQuery performance covering selector efficiency, DOM operation batching, event delegation, memory management, and render-blocking reduction. |
| skills/jquery-orchestrator/SKILL.md | Skill | Use when a jQuery request spans multiple capability areas — source curation, core DOM, events, AJAX, plugins, performance, migration, testing, security, or CI integration — and needs one deterministic intake, explicit phase ownership, and a unified execution contract. |
| skills/jquery-migration/SKILL.md | Skill | Use when migrating jQuery from v1 or v2 to v3, using the jQuery Migrate plugin to assess compatibility, or planning a phased replacement of jQuery with native browser APIs. |
| skills/jquery-source-curation/SKILL.md | Skill | Use when jQuery guidance needs evidence from api.jquery.com, jQuery Migrate, and release notes with explicit deprecation, plugin-compatibility, and legacy-browser freshness controls. |
| skills/jquery-events/SKILL.md | Skill | Use when implementing or reviewing jQuery event binding, delegation, namespace management, custom events, and event-object handling with correct memory and performance discipline. |
| skills/jquery-ci-integration/SKILL.md | Skill | Use when jQuery build, test, deprecation, security, and bundle workflows must be automated in CI/CD with deterministic toolchains, reproducible outputs, and promotion-grade evidence. |
| skills/jquery-ajax/SKILL.md | Skill | Use when implementing or reviewing jQuery AJAX requests, Deferred objects, Promise chaining, error handling, and secure request configuration. |
| prompts/execute-delivery.prompt.md | Prompt | Session-start prompt for orchestrator-first execution continuation with parallel-safe dispatch, aggressive traceability updates, and status-first reporting. |
| instructions/web-frontend.instructions.md | Instruction | Web frontend coding standards: component boundaries, accessibility, Core Web Vitals, security (XSS, CSP), and prohibited patterns. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| agents/web-frontend-engineer.agent.md | Agent | Specialist for implementing and reviewing web frontend code including HTML, CSS, TypeScript, component architecture, accessibility, Core Web Vitals performance, and frontend security. |
| skills/jquery-core/SKILL.md | Skill | Use when implementing or reviewing jQuery DOM selection, traversal, manipulation, and method chaining patterns with correct selector performance and modern API usage. |
| skills/jquery-testing/SKILL.md | Skill | Use when designing or implementing tests for jQuery code including DOM interaction tests, event simulation, AJAX mocking, and plugin behavior verification with QUnit or Jest. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | 3b3fddf77f408b559784d36d6f4eb42127c6b0e586624a257f553e4cb2e6a506 |
| skills/jquery-security/SKILL.md | 5657215e6e171bc1b470f4e310148f78b93e0c043b3a436cc51116e4ddd7ac28 |
| skills/jquery-quality-gate/SKILL.md | 2601e5a1a85db4b75b86e9bf7625c26ce79328b2ccc514a4c369b941f1ed2dfe |
| skills/jquery-plugins/SKILL.md | 9e53d317ef8d5972d4a35ef4d0202fbb9c0eff4663023b407879a083699507f5 |
| skills/jquery-performance/SKILL.md | 03514ce2d134e28b6c1745a4b2756390b54cb6a305c46e420d7ab069a3119a09 |
| skills/jquery-orchestrator/SKILL.md | 47eae704bca6da6eee4d8ba56970e7272883a391d5630c3396722a85d3315500 |
| skills/jquery-migration/SKILL.md | a2ae8607d24c7f4da80449fa42f1ff3119b8a461c0560f2a1627c7112a331653 |
| skills/jquery-source-curation/SKILL.md | 5d5a32c20ce4c0b42aa2f90de99bf833c8ab1dfdb393be027d2b009a40fc8f06 |
| skills/jquery-events/SKILL.md | e34623fd5c215dd3d477b8f4b4da55c02e14578e75ec7b0ce8ea24d03b618f02 |
| skills/jquery-ci-integration/SKILL.md | 3150ce88e727c51ddbc1c422e768a80d38947c04f4dfba3eb1078d625118be4e |
| skills/jquery-ajax/SKILL.md | 0f264162803cd713e9bf7761fab15e90319e2e938e8e6240fb24f63c2e23fd0d |
| prompts/execute-delivery.prompt.md | 3f95cb30768d39d2f3dd4df306c94c28be1124184ed3e192fac11e5b7d2b0039 |
| instructions/web-frontend.instructions.md | 49c14c2334becf67c199bc510f28f1872e817eaa826d13eedf109fdde26ab763 |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| agents/web-frontend-engineer.agent.md | 651a9cabd397454c2f0356886e5968ec09b35a2610480222a6a6a08651ab995e |
| skills/jquery-core/SKILL.md | 318a2a249c06d31f5c08178958a7cdda0c23bdbd3eec11392d8cd68b2e552b06 |
| skills/jquery-testing/SKILL.md | 5d852b67e3ee82252856bd0ff526d4c07c9cf961f9fd45b1206fb977b275c168 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
