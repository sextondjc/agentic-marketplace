# Matrix-to-Skill Mapping Registry

This registry is the single source for bundle-to-skill mapping ownership.

Canonical matrix source: `./phase-discipline-lane-agentic-delivery-matrix.md`

## Usage Rules

- Keep matrix bundle and cell ownership data here, not inside individual skill frontmatter.
- Update this file when bundle ownership changes, when a new mapping skill is introduced, or when a discipline revisit changes coverage.
- Ensure any discipline list changes are backed by DEC-PDL-07 revisit evidence.

## Bundle-to-Skill Ownership

| Code | Owning Skill(s) | Scope |
|---|---|---|
| N01 | analysis-execution | Structured discovery execution and requirement hardening |
| N02 | release-readiness | Release gate, evidence, rollback, and sign-off readiness |
| N03 | support-triage | Incident intake, severity classification, repro collection, and routing |
| N04 | test-design-review | Test strategy and traceability review |
| N05 | product-scope-slicing | Product intent to prioritised, acceptance-ready delivery slices |
| N06 | governance-delivery | Delivery coordination, RAID, dependencies, and milestones |
| N07 | operability-design | Supportability, observability, runbooks, and handoff readiness |
| N08 | acceptance-governance | Cross-discipline review checklists, finding disposition, and sign-off |
| N09 | test-orchestration | Multi-disciplinary test pass coordination and evidence collation |
| N11 | data-design | Schema design, migration planning, data governance, and query optimisation planning |
| N12 | sre-practices | SLO and error budget definition, reliability engineering, chaos planning, and toil reduction |

## Optional Customisation Ownership

| Code | Owning Skill(s) | Scope |
|---|---|---|
| O01 | taxonomy (taxonomy-tag-registry) | PDL tag consistency checks, drift detection, and canonical coordinate assignment |
| O02 | experiment-design | Structured experiment definition: hypothesis, success criteria, scope boundary, evidence format, time-box |
| O03 | post-release-retrospective | Release outcome capture, stabilisation findings, and follow-up actions |
| O04 | customer-feedback-synthesis | Multi-channel feedback signals converted to prioritised roadmap-ready insights |
| O05 | support-runbook-generator | Runbook authoring, escalation guides, and support handoff packets |
| O06 | release-simulation | Rollback drills, promotion rehearsals, and game-day validation for high-risk releases |

## Existing Bundle Additions

| Code | Bundle | Workspace customisations included |
|---|---|---|
| X13 | Documentation and knowledge | `write-technical-docs`, `index-docs`, `adr-generator`, `technical-docs.instructions.md` |
| X14 | shadcn/ui frontend | `shadcn-orchestrator`, `shadcn-source-curation`, `shadcn-setup`, `shadcn-theming`, `shadcn-component-design`, `shadcn-forms`, `shadcn-data-display`, `shadcn-testing`, `shadcn-accessibility`, `shadcn-migration`, `shadcn-animation`, `shadcn-registry`, `shadcn-ci-integration`, `shadcn-design-system`, `shadcn-quality-gate` |
| X15 | Kendo UI | `kendo-orchestrator`, `kendo-ui-source-curation`, `kendo-ui-core`, `kendo-ui-data-binding`, `kendo-ui-theming`, `kendo-ui-accessibility`, `kendo-ui-forms`, `kendo-ui-security`, `kendo-ui-performance`, `kendo-ui-migration`, `kendo-ui-testing`, `kendo-ui-ci-integration`, `kendo-ui-quality-gate`, `kendo-ui-grid-advanced`, `kendo-ui-charts-dataviz`, `kendo-ui-export-printing`, `kendo-ui-localization`, `kendo-ui-state-persistence`, `kendo-ui-real-time-updates`, `kendo-ui-upload-file-workflows`, `kendo-ui-observability` |
| X16 | jQuery | `jquery-orchestrator`, `jquery-source-curation`, `jquery-core`, `jquery-events`, `jquery-ajax`, `jquery-plugins`, `jquery-performance`, `jquery-migration`, `jquery-testing`, `jquery-security`, `jquery-ci-integration`, `jquery-quality-gate` |
| X17 | xUnit and BenchmarkDotNet | `xunit-orchestrator`, `xunit-source-curation`, `xunit-test-design`, `xunit-fixture-lifecycle`, `xunit-async-testing`, `xunit-moq-collaboration`, `xunit-quality-gate`, `xunit-runner-platforms`, `xunit-ci-observability`, `xunit-theory-data-stability`, `xunit-v2-v3-migration`, `xunit-traits-and-selection`, `benchmark-orchestrator`, `benchmark-source-curation`, `benchmark-statistical-analysis`, `benchmark-ci-integration`, `benchmark-profiler-integration`, `benchmark-baseline-management`, `benchmark-quality-gate` |
| X18 | SvelteKit | `sveltekit-orchestrator`, `sveltekit-routing`, `sveltekit-advanced-routing`, `sveltekit-load`, `sveltekit-actions`, `sveltekit-page-options`, `sveltekit-hooks`, `sveltekit-errors`, `sveltekit-server-endpoints`, `sveltekit-state-management`, `sveltekit-auth`, `sveltekit-environment`, `sveltekit-observability`, `sveltekit-testing`, `sveltekit-configuration`, `sveltekit-adapters`, `sveltekit-packaging` |
| X19 | TailwindCSS | `tailwind-orchestrator`, `tailwind-source-curation`, `tailwind-setup`, `tailwind-component-design`, `tailwind-quality-gate`, `tailwind-ci-integration`, `tailwind-design-system` |
| X20 | MCP Servers | `mcp-servers-orchestrator`, `write-mcp-servers`, `refine-mcp-servers`, `mcp-source-curation`, `mcp-sdk-selection-csharp-typescript`, `mcp-transport-architecture`, `mcp-authn-authz-hardening`, `mcp-contract-versioning`, `mcp-inspector-ci-observability`, `mcp-regression-test-design`, `mcp-server-quality-gate`, `mcp-release-readiness-gate` |

## Change Log

| Date | Change | Reason |
|---|---|---|
| 2026-04-17 | Initial registry created under matrix-skill-mapping skill. | Centralize matrix mapping and keep individual skills self-contained. |
| 2026-04-18 | Added N03 support-triage, N05 product-scope-slicing, N08 acceptance-governance, N09 test-orchestration. | Top-40 cell implementation pass — four remaining unimplemented N-codes created. |
| 2026-04-18 | Added O03 post-release-retrospective, O04 customer-feedback-synthesis, O05 support-runbook-generator. | Next-40 cell implementation pass — three O-code optional assets created for Release, UX/PM, and Support coverage. |
| 2026-04-18 | Added O01 taxonomy-tag-registry, O02 experiment-design, O06 release-simulation. | Final 70-cell pass — all O-codes now implemented; full 150-cell matrix coverage achieved. |
| 2026-04-18 | Added N11 data-design, N12 sre-practices, X13 documentation bundle. Five new disciplines adopted via DEC-PDL-07 revisit. Matrix expanded to 225 rows, 15 disciplines. |
| 2026-04-25 | Updated X06 Frontend delivery bundle to MAUI Android+iOS orchestration and quality-gate skills; retired `build-mobile-apps` from active bundle mapping. | Align mobile delivery taxonomy to MAUI cross-platform strategy and current specialist skill family. |
| 2026-05-06 | Added X14 shadcn/ui (15 skills), X15 Kendo UI (21 skills), X16 jQuery (12 skills), X17 xUnit + BenchmarkDotNet (19 skills), X18 SvelteKit (17 skills), X19 TailwindCSS (7 skills), X20 MCP Servers (12 skills). Added corresponding entries to capability-routing-registry.json. | New skill families added since last registry pass; mapping registry and routing registry aligned to current skill catalog. |

