# kendo-engineering

## Overview

- Purpose: Provide a Kendo-focused bundle for component implementation, performance, security, and release quality validation.
- Capability Provided: Kendo UI core/data/grid/chart/theming/testing/security/performance and quality-gate workflows.
- Why Install: Install this plugin to deliver Kendo UI solutions with framework-specific depth and governance checks.

## Version

- Plugin Name: kendo-engineering
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: 010a9bb3a7fd26327fedde56f96b715447c4bd462f10f5d606ea4eebe7170cd8

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/kendo-ui-testing/SKILL.md | Skill | Use when designing or implementing tests for Kendo UI components including mock DataSource, event simulation, widget lifecycle tests, and integration test strategy across jQuery, Angular, React, and Vue variants. |
| skills/kendo-ui-state-persistence/SKILL.md | Skill | Use when Kendo UI component state (filters, sorting, grouping, paging, column layout) must persist and restore reliably across sessions, routes, or devices. |
| skills/kendo-ui-source-curation/SKILL.md | Skill | Use when Kendo UI guidance requires Telerik-first evidence across jQuery, Angular, React, and Vue variants with release-history, licensing, and component-contract drift controls. |
| skills/kendo-ui-security/SKILL.md | Skill | Use when reviewing Kendo UI implementations for XSS vulnerabilities in templates, CSRF exposure in DataSource transport, insecure Upload configurations, and known CVEs in Progress/Kendo dependencies. |
| skills/kendo-ui-real-time-updates/SKILL.md | Skill | Use when Kendo UI data surfaces require real-time updates via push or streaming while preserving UI consistency, throughput, and user task continuity. |
| skills/kendo-ui-quality-gate/SKILL.md | Skill | Use when a Kendo UI implementation needs an expert, evidence-first quality decision covering component correctness, security, accessibility, performance, migration safety, and test coverage before merge or promotion. |
| skills/kendo-ui-performance/SKILL.md | Skill | Use when diagnosing or improving Kendo UI performance covering Grid virtual scrolling, DataSource paging strategy, widget initialization cost, bundle size optimization, and memory leak prevention. |
| skills/kendo-ui-observability/SKILL.md | Skill | Use when Kendo UI features need telemetry contracts for widget lifecycle failures, interaction latency, usage signals, and diagnosable production behavior. |
| skills/kendo-ui-migration/SKILL.md | Skill | Use when upgrading Kendo UI versions, migrating between framework variants (jQuery to React/Angular/Vue), or planning a phased replacement with deprecation tracking and rollback controls. |
| skills/kendo-ui-localization/SKILL.md | Skill | Use when Kendo UI components must support localization and globalization including culture-aware formatting, message packs, RTL behavior, and locale regression validation. |
| skills/kendo-ui-grid-advanced/SKILL.md | Skill | Use when Kendo UI Grid implementations need advanced editing modes, virtualization combinations, grouping aggregates, locked columns, and deterministic behavior at scale. |
| skills/kendo-ui-forms/SKILL.md | Skill | Use when implementing or reviewing Kendo UI form widgets, Validator, model-driven validation, error messaging patterns, and multi-step form flows. |
| skills/kendo-ui-export-printing/SKILL.md | Skill | Use when Kendo UI Excel/PDF export and print workflows require deterministic output quality, secure data handling, and reproducible delivery across environments. |
| skills/kendo-ui-data-binding/SKILL.md | Skill | Use when implementing or reviewing Kendo UI DataSource configuration, MVVM ViewModel patterns, remote transport, paging, filtering, sorting, grouping, and real-time data binding. |
| skills/kendo-ui-core/SKILL.md | Skill | Use when implementing or reviewing Kendo UI components including Grid, Chart, Scheduler, TreeView, Editor, and core widget patterns with correct initialization, configuration, and lifecycle management. |
| skills/kendo-ui-ci-integration/SKILL.md | Skill | Use when Kendo UI build quality, test execution, bundle size, theme compilation, security scanning, and license validation must be enforced automatically in CI to gate PRs and track regressions. |
| skills/kendo-ui-charts-dataviz/SKILL.md | Skill | Use when implementing or reviewing Kendo UI charts and data visualizations for large datasets, drill-down, cross-filtering, and accessible interaction behavior. |
| skills/kendo-ui-accessibility/SKILL.md | Skill | Use when implementing or auditing Kendo UI component accessibility including WCAG 2.1 AA compliance, ARIA roles, keyboard navigation, focus management, and screen reader compatibility per component. |
| skills/kendo-orchestrator/SKILL.md | Skill | Use when a Kendo UI request spans multiple capability areas — source curation, core components, data binding, Grid advanced behavior, charts/dataviz, export/printing, localization, state persistence, real-time updates, upload workflows, observability, theming, accessibility, forms, security, performance, migration, testing, or CI integration — and needs one deterministic intake, explicit phase ownership, and a unified execution contract. |
| prompts/execute-delivery.prompt.md | Prompt | Session-start prompt for orchestrator-first execution continuation with parallel-safe dispatch, aggressive traceability updates, and status-first reporting. |
| instructions/web-frontend.instructions.md | Instruction | Web frontend coding standards: component boundaries, accessibility, Core Web Vitals, security (XSS, CSP), and prohibited patterns. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| agents/web-frontend-engineer.agent.md | Agent | Specialist for implementing and reviewing web frontend code including HTML, CSS, TypeScript, component architecture, accessibility, Core Web Vitals performance, and frontend security. |
| skills/kendo-ui-theming/SKILL.md | Skill | Use when customizing Kendo UI themes using SASS variables, design tokens, ThemeBuilder, or CSS overrides — covering brand palette mapping, dark mode, multi-theme support, and upgrade-safe theme governance. |
| skills/kendo-ui-upload-file-workflows/SKILL.md | Skill | Use when Kendo UI Upload or FileManager workflows need chunking, validation, retry, signed endpoint integration, and secure end-to-end file lifecycle behavior. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | 24c33c7b76399bbd29d173d2efb8e31fd7c12e1600fa7baeabf59ce85fff2a86 |
| skills/kendo-ui-testing/SKILL.md | 593e77eb262658338cfec9bbad1127e43d2163fe917812c27b76c3b1e22668f5 |
| skills/kendo-ui-state-persistence/SKILL.md | 61e9e91ec24566e898c2bf04f23de938eb55a9d884c45097a24356c608f260a1 |
| skills/kendo-ui-source-curation/SKILL.md | 05cb95dc2a814954d1c7ad85cc6f8ed3fd63915090fe91ff8a0c5ba99a9d359f |
| skills/kendo-ui-security/SKILL.md | ea20792925d14e029c54ad3ca3cef7d9c65f57fa3164461c69468cc1febf8b90 |
| skills/kendo-ui-real-time-updates/SKILL.md | 813900bd337bed097018b31a1abf290275599d6f384e3d61974cce0e878f5402 |
| skills/kendo-ui-quality-gate/SKILL.md | 501c844a7b51ee3fa366463ed70b7371895d13aee71bc2e3b658a899be3a338a |
| skills/kendo-ui-performance/SKILL.md | 6e44d6ad899be35f08f0761560ed9c48b7741c1f221d1b74b121e23a97c2ed37 |
| skills/kendo-ui-observability/SKILL.md | 460995f6724f1f18b1315c9099e4c9892fc409ae13d35077f6e0b589444b5d10 |
| skills/kendo-ui-migration/SKILL.md | a6cb8db964309b1948cda537183d78b7e62c217fe85e21bc5f3baedd9a8abac9 |
| skills/kendo-ui-localization/SKILL.md | c1d04585216b5eec0098504fbe605438bcb730cbbf48a3013b806ca3e764aecc |
| skills/kendo-ui-grid-advanced/SKILL.md | aea6b4f2d6113549b0a5937ce7624ec945732cf144ee1b590f5e0e4529a3fab1 |
| skills/kendo-ui-forms/SKILL.md | fb06fda31f64d34c060acdc39d842aaf43a99187ccaedd3d090de7394383c26b |
| skills/kendo-ui-export-printing/SKILL.md | d8f378f0297edd925e7717b2f81db3bf79de1b70fce1750e3dbdb5ab1078a417 |
| skills/kendo-ui-data-binding/SKILL.md | 316b5efd3b1c818d06f010faea7e0c21d35ca2eb38249a73b6346f38c743e667 |
| skills/kendo-ui-core/SKILL.md | 7437086d77f447e116a9b084b0fbd8397494864fa8a95b8ef87cfc1a1a4a0466 |
| skills/kendo-ui-ci-integration/SKILL.md | 7324036841915be2103a3f0cc418348e94511bdc4f9dda2762a408e7f4d6fc95 |
| skills/kendo-ui-charts-dataviz/SKILL.md | 5d7e38256acb05b80a1c140396e5fe74d2868111afff4490b47c4c8356dd39d7 |
| skills/kendo-ui-accessibility/SKILL.md | ce7f0ba8d57392b764f4a043422a92ab919aa2613c80584a4dd43430ef7f974e |
| skills/kendo-orchestrator/SKILL.md | 59778dab6884adf8da6da3cad2ff9f29330f6024b0ac4d270d12b89099d321c9 |
| prompts/execute-delivery.prompt.md | 3f95cb30768d39d2f3dd4df306c94c28be1124184ed3e192fac11e5b7d2b0039 |
| instructions/web-frontend.instructions.md | 49c14c2334becf67c199bc510f28f1872e817eaa826d13eedf109fdde26ab763 |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| agents/web-frontend-engineer.agent.md | 651a9cabd397454c2f0356886e5968ec09b35a2610480222a6a6a08651ab995e |
| skills/kendo-ui-theming/SKILL.md | 639d004c2e650074610afbcc00b5d72c3eee98f1e1199278256c647199786ed3 |
| skills/kendo-ui-upload-file-workflows/SKILL.md | 8b6839bfc50fd97075e35dac6dfc87ddcbd25408377482a7896e698598aed2f3 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
