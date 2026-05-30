# governance-review-audit

## Overview

- Purpose: Provide a review-lane governance bundle for auditing customization quality, consolidating findings, and supporting release decisions.
- Capability Provided: Structured governance audits, acceptance checks, remediation guidance, and readiness evaluation workflows.
- Why Install: Install this plugin to strengthen quality gates and produce decision-ready evidence before broader rollout or release.

## Version

- Plugin Name: governance-review-audit
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:42:32.1011507Z
- Plugin SHA-256: 7d4f65e4df7952e4d454989e53c6c38d9a70bebde1b6231307a8e163220f00e5

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/governance-health-overview/SKILL.md | Skill | Use when you need a reconciled governance health view that synthesizes governance, skill-quality, customization-quality, and optimization evidence into one disposition. |
| skills/governance-audit/SKILL.md | Skill | Use when assessing the workspace governance layer as a whole and producing a ranked, evidence-backed remediation report. |
| skills/execute-customization-audit/SKILL.md | Skill | Use when producing the executive governance report as a single, aggregated output derived from existing governance audit artifacts. |
| skills/delivery-status-grid/SKILL.md | Skill | Use when a user asks for delivery status, progress, completion state, or remaining scope and expects table-first reporting with explicit X of Y measures. |
| skills/request-code-review/SKILL.md | Skill | Use when completing tasks, implementing major features, or before merging to verify work meets requirements |
| skills/remediate-review/SKILL.md | Skill | Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation |
| skills/release-simulation/SKILL.md | Skill | Use when rehearsing a production promotion before it executes — covers rollback drills, traffic-switching rehearsals, and game-day validation for high-risk release scenarios. |
| skills/release-readiness/SKILL.md | Skill | Use before any promotion from one environment to the next — covers gate checklist, rollback validation, smoke test coordination, release evidence collation, and go/no-go sign-off. |
| skills/post-release-retrospective/SKILL.md | Skill | Use after a production promotion to capture release outcomes, lessons, stabilisation findings, and follow-up actions in a durable artifact. |
| skills/optimize-customizations/SKILL.md | Skill | Use when authoring or reviewing agents, instructions, skills, and prompts to apply concise, deterministic optimization checks and produce actionable remediation. |
| skills/matrix-skill-mapping/SKILL.md | Skill | Use when maintaining the Phase / Discipline / Lane matrix and its mapping to skill assets, including bundle ownership, discipline change checks, and catalog alignment. |
| skills/governance-summarize/SKILL.md | Skill | Use when you need one concise, single-page governance briefing that aggregates the most important points across workspace governance artifacts. |
| skills/audit-agent/SKILL.md | Skill | Use when evaluating one or more workspace .agent.md files for agent-role quality, invocation boundary precision, and platform-currency alignment, then recording remediation recommendations. |
| skills/acceptance-governance/SKILL.md | Skill | Use when reviewing completed implementation, design, test, or release artifacts against acceptance criteria and producing severity-tagged findings with explicit sign-off disposition. |
| prompts/optimize-customizations.prompt.md | Prompt | On-demand prompt to run optimize-customizations for authoring/review quality of agents, instructions, skills, and prompts. |
| prompts/governance-item-audit.prompt.md | Prompt | Canonical item governance prompt for one customization item against workspace and type-specific standards. |
| prompts/governance-audit-types.prompt.md | Prompt | Canonical type governance prompt for governance across and between customization types, including standards drift detection. |
| prompts/execute-manual-review.prompt.md | Prompt | Applies saved manual review findings only after explicit invocation; consumes inline REVIEW markers and/or a findings note file. |
| prompts/execute-customization-audit.prompt.md | Prompt | Canonical executive governance aggregation prompt that produces one consolidated report from existing source audits. |
| prompts/execute-artifact-condense.prompt.md | Prompt | Prompt for invoking skills-authoring plus agent-authoring/instructions-authoring concision mode on one named artifact or a full artifact set, returning recommendation-only grids without applying edits. |
| prompts/audit-customization-types.prompt.md | Prompt | On-demand prompt to run audit-customization-types for same-type and cross-type governance interaction audits across agents, instructions, prompts, and skills. |
| prompts/audit-agent.prompt.md | Prompt | On-demand prompt to run audit-agent for one or more workspace .agent.md files with platform-currency-aware quality evaluation and remediation recommendations. |
| instructions/technical-docs.instructions.md | Instruction | Unified documentation, component, README, and specification generation standards. |
| instructions/task-implementation.instructions.md | Instruction | Policy boundaries for executing approved plans and maintaining change traceability artifacts. |
| instructions/governance-lifecycle.instructions.md | Instruction | Defines mandatory Planning, Execution, and Review lane classification and traceable handoff requirements for customization artifacts. |
| agents/powershell-reviewer.agent.md | Agent | Reviews PowerShell scripts and modules for safety, automation readiness, and maintainability. Use when focused PowerShell review with actionable findings and correction recommendations is needed. |
| agents/manual-code-reviewer.agent.md | Agent | / |
| agents/governance-briefer.agent.md | Agent | Produces concise, single-page governance briefings that aggregate salient points, risks, and actions from workspace governance artifacts. |
| agents/code-reviewer.agent.md | Agent | Review completed implementation steps against the originating plan and active workspace instruction files, producing a severity-ranked finding set with explicit remediation guidance. |
| skills/audit-customization-types/SKILL.md | Skill | Use when auditing customization types and cross-type interactions across agents, instructions, prompts, and skills with deterministic, grid-first governance outcomes. |
| skills/audit-skill/SKILL.md | Skill | Use when evaluating one or more workspace skills for skill-specific quality signals such as trigger clarity, self-containment, and reference integrity, then recording remediation recommendations. |
| skills/test-design-review/SKILL.md | Skill | Use when entering the TEST phase or when a test plan requires review — covers test strategy evaluation, coverage rationale, traceability, exit criteria definition, and multi-discipline test pass coordination. |
| skills/audit-prompts/SKILL.md | Skill | Use when evaluating one or more workspace .prompt.md files for prompt execution-contract quality, invocation safety, and prompt-specific remediation guidance. |
| skills/audit-powershell/SKILL.md | Skill | Use when auditing PowerShell scripts for safety, reliability, and style issues, and when you need actionable correction recommendations. |
| skills/audit-instructions/SKILL.md | Skill | Use when evaluating one or more workspace .instructions.md files for policy-domain integrity, applyTo scope correctness, and instruction-specific remediation guidance. |
| skills/audit-executor/SKILL.md | Skill | Orchestrates full governance audit across all customization types and produces a single executive aggregate report with per-type highlights, governance health assessment, and remediation summary. |
| skills/test-orchestration/SKILL.md | Skill | Use when coordinating multi-disciplinary test execution passes and collating evidence from Engineering, Architecture, Security, Performance, UX, and Support into a single release-ready verdict. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | c5e36397870943726a9e9abaefc84263fc99e2ab1c885c14fb101c1babe36467 |
| skills/governance-health-overview/references/.artifacts/governance-audit-types-customizations.md | e001a9f1f5e9ca52d80c6cfb9de2639dcf2d334a855e26004f39b3b87f4b857d |
| skills/governance-health-overview/SKILL.md | 0c455e2623b00021b37a3d7fe7add6600e5cfe38712370fb31f8639845c262e1 |
| skills/governance-audit/references/planning-execution-review-governance.md | 86feb64a786f9c77eea3a332bd9f9253bf7d50369c3b80387fea0954e94575db |
| skills/governance-audit/references/governance-audit-checklist.md | f1d53ca1d867527a503f1fc967fd76e556fc3d00fac62c52a02bda5528dd168d |
| skills/governance-audit/references/determinism-review-scorecard.md | 227a8f53f0e620c4271d6d7e17b01384fd99d1cf41ea4ffeb0613f77f2052fda |
| skills/governance-audit/references/customization-taxonomy-v1.md | 167ab6f5fee3f671ff931013ab81fa1397fcbb5f198d426bfcbb496575b8f0ef |
| skills/governance-audit/SKILL.md | fa049e38020d184209f74747db3d60d7c295569a05fc59cdca5aa9f0e56a82d9 |
| skills/execute-customization-audit/references/.artifacts/responsibility-overlap.routing.json | 3448afa737a66d7d9e109028a79a58ff6e2f790b44271d0b94df433a6876eb0f |
| skills/execute-customization-audit/references/execute-customization-audit-metrics-checklist.md | 28d3f7c35539823f00ec3c3e605b13dcfbbe89e61ac2b4731eac9d13d5c2c32f |
| skills/execute-customization-audit/SKILL.md | 6ae4bf90de6a97339994a9a5a3b788ee91265324bf22753aece7027491b5301c |
| skills/delivery-status-grid/references/summary-template.md | 9f8af457f6d969ab539a1bc5448638b310ae15d5f2473313cd2da1b8af45af5e |
| skills/delivery-status-grid/references/risks-and-blockers-template.md | d3ee2cf6558fef5e6fca8ef9c8a1cd74d71840cfe5d847db91e378ceb6992d9a |
| skills/delivery-status-grid/references/remaining-template.md | 2dbd7ef11093864ab1231d093488a494a19ad2483793d7cd53e313317b8f2962 |
| skills/delivery-status-grid/references/done-template.md | 64fc73da7be4767ef24ceec43ebf341e5f2b783deecfc4adece4e81f310faafd |
| skills/delivery-status-grid/SKILL.md | 80b7d88d1ac2139564c51ebb68230323cf890cd8655efb7f7302dfeb4f315980 |
| skills/audit-skill/references/scripts/remediate-20260403-skill-audit.ps1 | c40cff8f30f31a25e6e778b31d02b2b83524bd58ab1d3173433cef7f4e72bdd1 |
| skills/audit-skill/references/scripts/refresh-audit-skill-history.ps1 | 0a70299e2733b6ddabc5e5397da14fed08ff7cbef2ee1c042e5bf785ac6be17f |
| skills/governance-health-overview/references/.artifacts/governance-audit-types-optimization.md | 431458da1549c6254e9c98c296bbe6fbcb2d48a54a9910af2e975293b67c61c9 |
| skills/audit-skill/references/scripts/get-audit-skill-metadata.ps1 | 3fdcd337300594b7f081c2fdb66bbad11bc1a7cd9b7501474035c92ce1bbd7b2 |
| skills/governance-health-overview/references/.artifacts/governance-audit.md | 0547728309f785444180bda7ff798d6b33600f3c96d0cd1115eae6be48fcb627 |
| skills/governance-health-overview/references/.artifacts/governance-health-overview.summary.md | 4dd4c63a1ff3b02643ee5e09fae5d226aee8c0dcbd67a00420c0a00a06803981 |
| skills/request-code-review/SKILL.md | c3b423a958446e1ffa794478184d1beddc44c6ec935d0b54fd2ce6aa60a093bf |
| skills/request-code-review/code-reviewer.md | 7f5328dca12cb200005ae9d4386f63a9b0acb735ece57f82db206b4a3189ccae |
| skills/remediate-review/references/review-response-examples.md | 79b36d6a82b1e0c31c22d4eb47e56b0d709bac6dbdefc4168cc4494853cf37fd |
| skills/remediate-review/references/remediation-edge-cases.md | 553972e96e28fb1cbe816767c227f03a87c4e07e4bda70fb798850c8567db885 |
| skills/remediate-review/SKILL.md | 8c954bd30418cca13d089b3b51a415b1a8afb685a686bbebac3c99db3801dc92 |
| skills/release-simulation/SKILL.md | 82816e75006ef96b149a689f499831c0ef625aa7d270448036f315902a81b1e0 |
| skills/release-readiness/SKILL.md | c7891cf580fbcb1b7766429a5bf4307061b5f80ba7139877a7e7a5837c531ab9 |
| skills/post-release-retrospective/SKILL.md | 707bf348745dde39215d8fe90faba42e1574f7743c74af42bcb6369f46a94eb1 |
| skills/optimize-customizations/references/optimization-factor-template.md | 8491195fd92436c72b5f1ea261a0466a35b19b2d150ded45827899d5a9b66c51 |
| skills/optimize-customizations/references/compendium-growth-governance.md | 5763b8358bc538b7863ce5ff973083f096ba7dcfa511c4642c4166c9368b1f0f |
| skills/optimize-customizations/SKILL.md | bf57ffda3527b482788db47bbd6af5105d99e5f2572e74a15a86508a77c0da12 |
| skills/matrix-skill-mapping/references/phase-discipline-lane-agentic-delivery-matrix.md | 6e87f431a6905b120aa38aecea57480e885d98429ca7960ca5c760bd4a0ff23e |
| skills/matrix-skill-mapping/references/mapping-registry.md | 8143448e42338d6e3922627522cc8be18faecb30692f37d94dc9e73dc5ae6446 |
| skills/matrix-skill-mapping/SKILL.md | c71416cd53845150370f44a32e2c8830d38f7a7db85abce7004ee485f0ed2f78 |
| skills/governance-summarize/SKILL.md | 70e52be806f4b153f8deea5cdaa643353a21c68559e062f0d4fff18f4dd81416 |
| skills/governance-health-overview/references/.artifacts/responsibility-overlap.routing.json | bc54d068458969a4adacd7cedb7dfcfc8c9d5f1768c85c58327ff2d31357039b |
| skills/governance-health-overview/references/.artifacts/local-governance-run.json | ad942f3b79ea7092448b774a90243816260595dbb69c3b61de866700cf08afcf |
| skills/governance-health-overview/references/.artifacts/governance-health-overview.latest.json | d29a5e9d2d6dd55587078cdff87cc83251e3ee5e186322374c43b2ef87405669 |
| skills/audit-skill/references/scripts/generate-audit-skill-targeted.ps1 | d486bab6bd2861002730b60e660011e44a337a2c8158739c617c7e384b856e4e |
| skills/audit-skill/references/scripts/generate-audit-skill-full.ps1 | 60bb33e2b6b840dec15fc7b971f41b86e92a64bef3d0a57455b388f32022a18a |
| skills/audit-skill/references/scripts/generate-audit-skill-baseline.ps1 | cdff482fa280921ce7f5eb2eb5336ca38ceb9a5cd9387ca06f8b375d6f015db7 |
| skills/audit-agent/SKILL.md | f5fefe4756a93355f3ea013fe90ce19884babf77133ff0df501e1ee8dcff97a3 |
| skills/acceptance-governance/SKILL.md | 9c01aada7486aebfad7c1a63ecf59914c47c04a98bed3b03b1e82c82cd3206af |
| prompts/optimize-customizations.prompt.md | 86f5a6abbee256ab51fa81b72bd92db8d2f77cddaa8a4fdf625414dbf912b076 |
| prompts/governance-item-audit.prompt.md | 04d18de08aa814952db64de12f1054b188e89a3a005d8cad5326ba75f54bab35 |
| prompts/governance-audit-types.prompt.md | 5785f1c8135a2582db11c7d381bfbcfcf2cc5097fe8792a3126e09cbe46cfe9f |
| prompts/execute-manual-review.prompt.md | 50ebc8e590ba69b6a224a5511a31966522b7f195e4c5bacfa0b762e65d97350c |
| prompts/execute-customization-audit.prompt.md | 834025ff503153cca08a002889c8ef8a0f1414a0a0bf40faebc1e01552c4c014 |
| prompts/execute-artifact-condense.prompt.md | 68cc4ca0be946db9013a76153b9a1c9ac075d33391bc79ff68298364e6a8e373 |
| prompts/audit-customization-types.prompt.md | e147effe2be7590d64e94e46f7e173dc8776aada8b4a920e80b2cb1dc8274f61 |
| prompts/audit-agent.prompt.md | 893027472d3fcae04bd582534724d6b0e9ccd32ff7513881c8949bd5368cc223 |
| instructions/technical-docs.instructions.md | 61c82515bd8f076a0c33f625587b0b5e8ef093922edc52ccf976da168ad7a025 |
| instructions/task-implementation.instructions.md | f68b474d9ff6596857a6d46728fac3cdb0bff3fe773d55b1a454747849c10a63 |
| instructions/governance-lifecycle.instructions.md | c51a9a1ed54894a3cc704bbc098069ea7e0a03125479436089522e9df1a0f529 |
| agents/powershell-reviewer.agent.md | 9ed227a1b4a9b91296bc0fb75541bcc61e4ee1b368de98e45a63191a4a28d211 |
| agents/manual-code-reviewer.agent.md | f74be87ee260d5822ce315a611fa75be86a76ad7be7982fe61956944d6c4b86a |
| agents/governance-briefer.agent.md | a1c72ed907f38506e556f0f141fa132d49e5750fa423a9e371605260226af9f2 |
| agents/code-reviewer.agent.md | e21f797d51235f1144dd60c96469319c09efe37d535228cc5eed3ed5d3f49e41 |
| skills/audit-agent/references/audit-agent-report-template.md | 87b0f813058bddcff50755019fbe7ece01034c80e5f647c5531ac1e1bff3d973 |
| skills/audit-agent/references/source-catalog.md | 7e7a1fc3985bb7dbe1786c4c3ce36bafd8f6a4e0260d691c4ad2a2a3ab325285 |
| skills/audit-customization-types/SKILL.md | edbf7bf34b454e97917d1c0fcaa2edcdf472ce5f232f3a10b3685d2ad81c313a |
| skills/audit-customization-types/references/audit-customization-types-report-template.md | 00a7ab1eedb8275064093f7576c3a6bed7dd3b01622f692414e06b200724d60e |
| skills/audit-skill/references/scripts/build-audit-skill-grid.ps1 | 779cf427acfbdd0b70f9d6441d81cde90c650135a0dbf3a0edb9375c3d374880 |
| skills/audit-skill/references/source-catalog.md | aeefe8ddc66372dcbf06d500a42c9314715a6e16c14764fc602cf013c8420a65 |
| skills/audit-skill/references/skill-review-report-template.md | d9686f49e3776e4e76a6a52a9bcd4daf911e6d2c6eccb0dc9653ac76d7559fca |
| skills/audit-skill/references/skill-conflict-report-template.md | 9772f65b090ff9b09aa11996f0d729cb2c88354700d71890d55c4d96ad9d8b26 |
| skills/audit-skill/references/audit-skill-report-template.md | d9686f49e3776e4e76a6a52a9bcd4daf911e6d2c6eccb0dc9653ac76d7559fca |
| skills/audit-skill/references/audit-skill-history-entry-template.md | dd469080781d8fccaaeb99c05c6a271aadbb9f67a2950489eb308e3c9c77c57a |
| skills/audit-skill/references/audit-skill-conflict-report-template.md | 9772f65b090ff9b09aa11996f0d729cb2c88354700d71890d55c4d96ad9d8b26 |
| skills/audit-skill/SKILL.md | 79b159b935caf18f6f7fe46e174be90809b2375ce382e37ebfeac593f6c8cfb2 |
| skills/test-design-review/SKILL.md | f3b82a7caed0ddb34b4e75af0a82e044a9ffe93c9db34f3728c9f5ef15f299f1 |
| skills/audit-prompts/references/source-catalog.md | ad60640d3a545dba0a3ff3f1ef204b832050a02792b778836dba76efecb34170 |
| skills/audit-prompts/SKILL.md | dd772e7f175f81e99deff5a19ebf9a5eda130f5a20ce105accf60bde9b70694a |
| skills/audit-powershell/references/scripts/Invoke-PowerShellScriptReview.ps1 | 4958795e6e454e14d66b32aea59d71b318660f28c6f57a0b46cb71e199354ca5 |
| skills/audit-powershell/SKILL.md | 5bbf7713bdcc401a2d4080fe812404db60a0d659916504a1263f49cdb0b7c632 |
| skills/audit-instructions/references/source-catalog.md | 76163606aa348f40f080bd625e292959379062515b7696c5af24504b51ad03d0 |
| skills/audit-instructions/references/audit-instructions-report-template.md | 3ca4f6f0fb20f507b04ed0b927a74dafda176860ab7e16905692be4c694b2f42 |
| skills/audit-instructions/SKILL.md | f1e8805f5b7e81bfe3fad46d44fb383f89c36c1011d3b2f74d936f41a338cce2 |
| skills/audit-executor/SKILL.md | dfebe2779060ae58bfac55ca1e275ff072e47baae4f49c370b5f606a623ebc8c |
| skills/audit-customization-types/references/source-catalog.md | 49553011e83474a3a32e95e24a852b08dc44f25c05538f1aab67a862b5b15fda |
| skills/audit-prompts/references/audit-prompts-report-template.md | 6fe3ffaea3d745ba3d533c4d04cf2031bdeb75bcf3466d3b72d026ed633e2a36 |
| skills/test-orchestration/SKILL.md | 0eec134ac54e944576123aa9a5c4f7927fdfab955a02287b3c58819088c4e9b7 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
