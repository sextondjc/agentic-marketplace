# compendium-sync-docs

## Overview

- Purpose: Provide synchronization and documentation workflows that keep customization assets curated, current, and navigable.
- Capability Provided: Documentation generation, indexing, curation, sync maintenance, and pruning support.
- Why Install: Install this plugin to keep compendium assets organized and reduce drift between docs and customization inventory.

## Version

- Plugin Name: compendium-sync-docs
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: 80c76044b509333fcecccddfce7c5d8819d59b4ebc376518ca0f3316abcef3b0

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/write-technical-docs/SKILL.md | Skill | Use when generating or refreshing technical reference documentation with code-verified content and link integrity checks. |
| skills/sync-skills/SKILL.md | Skill | Use when maintaining a skill library over time and you need to evaluate source freshness, relevance, and adoption before updating skill content. |
| skills/sync-editorconfig/SKILL.md | Skill | Use when creating, normalizing, or updating a workspace .editorconfig and validating C# using/type-file policy compliance on demand. |
| skills/sync-customizations/SKILL.md | Skill | Use when maintaining .instructions.md and .agent.md files over time and evaluating whether their content remains aligned with current workspace standards and external guidance. |
| skills/prune-sync-assets/SKILL.md | Skill | Use when decommissioning sync-managed assets that are no longer present in source manifests, with explicit approval and safe-delete controls. |
| skills/prune-doc-artifacts/SKILL.md | Skill | Use when auditing .docs planning and execution artifacts to identify stale, superseded, or generated leftovers and produce safe archive or removal candidates. |
| skills/powershell-script-library/SKILL.md | Skill | Use when maintaining or adding reusable PowerShell scripts across automation, governance, and orchestration with strict deduplication and catalog-first reuse. |
| skills/librarian/SKILL.md | Skill | Use when naming, organizing, or curating a workspace document corpus — applying consistent folder hierarchy, naming rules, and deduplication analysis across any workspace. |
| skills/index-docs/SKILL.md | Skill | Use when building or refreshing navigable INDEX.md files across a document corpus so agentic workflows can discover and navigate documents without reading every file. |
| prompts/write-component-docs.prompt.md | Prompt | Create comprehensive, standardized documentation for object-oriented components following industry best practices and architectural documentation standards. |
| prompts/librarian.prompt.md | Prompt | Prompt for documentation corpus naming, structure curation, and index refresh with .docs as the default root. |
| prompts/generate-readme.prompt.md | Prompt | Prompt to build a consolidated README from repository documentation, standards, and architecture sources. |
| prompts/curate-copilot.prompt.md | Prompt | Prompt for discovering imported customizations and updating copilot-instructions.md to leverage them. |
| instructions/technical-docs.instructions.md | Instruction | Unified documentation, component, README, and specification generation standards. |
| instructions/governance-lifecycle.instructions.md | Instruction | Defines mandatory Planning, Execution, and Review lane classification and traceable handoff requirements for customization artifacts. |
| agents/workspace-scaffolder.agent.md | Agent | Comprehensive agent for scaffolding lean .NET project structures, generating tailored copilot instructions, and curating workspace configuration for domain-specific development. |
| agents/governance-briefer.agent.md | Agent | Produces concise, single-page governance briefings that aggregate salient points, risks, and actions from workspace governance artifacts. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | 44d4eba5db353e42a1d5291b2c5746f862cf9528986ddd3c32c12d65537bdef4 |
| skills/write-technical-docs/references/coverage-report-template.md | 9d3c9daacc9c05ce299b034911e6a11f05e47a55e35812638c62f51b0ef32027 |
| skills/write-technical-docs/SKILL.md | 42215d4bb72d7939dad3c5dad8355d88fb86a0edc325ac02aae1512831b42c48 |
| skills/write-technical-docs/Get-DocumentationMetrics.ps1 | 7a4a95d3df27cd0f98f2a346da5860b7ee051d4d12d985df537a91e0ffa16e47 |
| skills/sync-skills/references/source-evaluation-template.md | 6d29ebf78a6559abaa827d5cd5779f5be5145d559af25036a8fc6ad8bb5ee7a8 |
| skills/sync-skills/references/source-catalog.md | 712201f030f0c2da6451a0bde2afe1d42f075479cc88e023bdffce372ded4315 |
| skills/sync-skills/SKILL.md | a5c0ce09d80fad8ba551f19748dc5df58bc1297fbf24ae40e0ac5989422cf6e7 |
| skills/sync-editorconfig/references/scripts/Invoke-EditorConfigSync.ps1 | 7b373133490eb25945abe37fcf793b0555ee8d857988829f19cca5da7d81fabc |
| skills/sync-editorconfig/SKILL.md | 5cc3cb19efdd4b514654ea8b2fdedc3dc3416e0da05300e7f2eed9ff7d0f3a19 |
| skills/sync-customizations/references/source-evaluation-template.md | 3da78e38afb93c95728f12093b0b8ab69fa41604ba68230d66e5a1338747f7d0 |
| skills/sync-customizations/references/source-catalog.md | a5ea65728c3d80a39977e1d3cd46085bc45b11d9b16c572be315d79c134de0c2 |
| skills/sync-customizations/SKILL.md | 7f5ff113ab4c1bb10e2717db48e79cda2ebb821b787f4693535cb2c2b8c94e8f |
| skills/prune-sync-assets/references/scripts/Invoke-PruneSyncAssets.ps1 | dc76f81628e090de7efb9804fa5d0d4cd3023f3747cd4dc4c2512daf9c53b409 |
| skills/prune-sync-assets/SKILL.md | f8a5ea67f9844d4060d1b4ad3c449a0a35f64806020f96d480b5a122391239d7 |
| skills/prune-doc-artifacts/references/scripts/Find-StaleDocs.ps1 | 98444161ca24c1ae514bbfb953bd4a0d5d1d6f064fff3c2baa31e8708cf2a42c |
| skills/write-technical-docs/references/documentation-index-template.md | 979adfe209d7a65b0cba6a83e1f4d50571b1c5c15731da7a2be94782f13976f6 |
| skills/prune-doc-artifacts/SKILL.md | a0db070aef563e81435f25ffb5c931beb15dcc94d1df0710feab0a355268615c |
| skills/powershell-script-library/references/reuse-and-promotion-matrix.md | fd5733702e6834f576bba105d540060f9313aac9f8d5e831efaf513648091035 |
| skills/powershell-script-library/SKILL.md | 808c6e9fb1898387656d9140fb503d484d5908f0de98a6086f154c7e028e1c4b |
| skills/librarian/SKILL.md | 6c5b9467ece91ab37fbe95c3dacff379bb9956b9daed6bb5877ee50fec71a6f8 |
| skills/index-docs/SKILL.md | c0535b072266bfb07f3ec0c7e9266abbbac4795ec01f69ad6653cf80cd798a95 |
| skills/curate-copilot-instructions/references/preferred-skills-section-template.md | 992913e884cd813755e0043881462228c418ac5ad47af28c30e5239d58370cd0 |
| skills/curate-copilot-instructions/references/preferred-agents-table-template.md | 88ddbe7312ad3da95b57484a6da6f9aa3088553165f972eb8f1f5a18740f4899 |
| prompts/write-component-docs.prompt.md | 37f8622269932975939bbd4399c7d631fbd1a0bb4259c490bf12f3c1e484a88b |
| prompts/librarian.prompt.md | ca442202115a07a15c3b661299319f16cdef5f6c461057c2ee633c24f2e8ca1a |
| prompts/generate-readme.prompt.md | 0d1578ce6fba8701f045aa4c672d0839ccb03f6b07de458f989916c3368d67da |
| prompts/curate-copilot.prompt.md | 1d165d81ee7fbcaed7ccefcb3cdc5ede73405b4bef0d87002ba029238ca65e50 |
| instructions/technical-docs.instructions.md | 61c82515bd8f076a0c33f625587b0b5e8ef093922edc52ccf976da168ad7a025 |
| instructions/governance-lifecycle.instructions.md | c51a9a1ed54894a3cc704bbc098069ea7e0a03125479436089522e9df1a0f529 |
| agents/workspace-scaffolder.agent.md | 45728a41635478a25424c2b0e8c67ccc73c0795498cc26d76b77da2ed0814e52 |
| agents/governance-briefer.agent.md | a1c72ed907f38506e556f0f141fa132d49e5750fa423a9e371605260226af9f2 |
| skills/powershell-script-library/references/script-authoring-standards.md | 1c5feb3968d6df4c2b6a0b4e5382dd04ca84c9158d40010fee915f34bdd00fb8 |
| skills/write-technical-docs/references/technical-api-page-template.md | 2b25cbd88d611a9375bdd4e9587375addd9bee24c9961b4cb84c7988eb961d3b |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
