# plugin-authoring-lifecycle

## Overview

- Purpose: Provide a focused lifecycle toolkit for designing, implementing, hardening, and publishing agent plugins.
- Capability Provided: Plugin scaffolding, implementation-path selection, tool integration, security hardening, and publishing readiness.
- Why Install: Install this plugin to accelerate plugin delivery with repeatable authoring patterns and release-grade integrity controls.

## Version

- Plugin Name: plugin-authoring-lifecycle
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: 89897c6b68d867a489875ee962755df848be80e6f99b42b7e2915df0eeef6371

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/agent-plugin-setup/SKILL.md | Skill | Initialize a VS Code agent plugin with directory structure, plugin.json manifest, and workspace configuration for multi-tool compatibility. |
| skills/agent-plugin-tools-integration/SKILL.md | Skill | Wire agents to built-in, MCP, and extension tools with proper configuration, approval models, and sandbox constraints. |
| skills/instructions-authoring/SKILL.md | Skill | Use when creating or editing .instructions.md files, including policy-domain scoping, applyTo correction, and deterministic rule tightening. |
| skills/agent-plugin-security-hardening/SKILL.md | Skill | Apply security controls to agents including sandbox configuration, SSRF prevention, secret management, input validation, and permission hardening. |
| skills/route-customization/SKILL.md | Skill | Use when deciding whether a behavior should be implemented as a custom agent, an instruction file, or a reusable skill. |
| skills/skills-authoring/SKILL.md | Skill | Use when creating or updating skills and validating they are discoverable, specialized, and reusable. |
| skills/agent-plugin-publishing/SKILL.md | Skill | Package and publish VS Code agent plugins to Marketplace, GitHub Releases, or private registries with versioning, release notes, and update monitoring. |
| agents/workspace-scaffolder.agent.md | Agent | Comprehensive agent for scaffolding lean .NET project structures, generating tailored copilot instructions, and curating workspace configuration for domain-specific development. |
| instructions/governance-naming-conventions.instructions.md | Instruction | Asset naming standards for agents, instructions, skills, and prompts to ensure consistency, discoverability, and cross-project portability. |
| instructions/request-economy.instructions.md | Instruction | Policy to minimize premium-request usage and context-window consumption while preserving high-confidence reasoning. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| prompts/workspace-scaffolder.prompt.md | Prompt | Prompt for scaffolding lean .NET project workspace configuration and copilot instructions. |
| skills/agent-authoring/SKILL.md | Skill | Use when creating or editing .agent.md files, including frontmatter fixes, role boundary tightening, and companion-skill alignment. |
| skills/agent-plugin-implementation-extension/SKILL.md | Skill | Implement custom agents in TypeScript as VS Code extensions for complex workflows that require custom tools, dynamic behavior, or programmatic agent registration. |
| skills/agent-plugin-implementation-markdown/SKILL.md | Skill | Author custom agents in Markdown format (.agent.md) for simple workflows that use built-in or existing tools without custom code. |
| skills/agent-plugin-integrity/SKILL.md | Skill | Use when plugin or asset bundles need deterministic SHA-256 hashing per file and at bundle level, with reproducible integrity verification output. |
| skills/agent-plugin-design/SKILL.md | Skill | Design agent personas, workflows, tool permissions, and handoff patterns before implementation to ensure clear scope and secure execution. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | f165226489dc78849a8e4ecb81797048a0d3e24e7f037486743bad54375352df |
| skills/agent-plugin-setup/SKILL.md | 7545dd4f6bd6c676424d42eb2a1f49a2dda3507ace5328febfccf2748c1c54f9 |
| skills/agent-plugin-setup/references/QUICK_START.md | 00d8fa1284b5c29260ddb4733b1960bd09519cac571dfcfc84248b191304769c |
| skills/agent-plugin-setup/references/source-ledger.md | b5e7774079ed42c3561e1a420f8459f9bfe397bd4a1d048291942c1b934e923b |
| skills/agent-plugin-tools-integration/SKILL.md | a4a100093b131b51b9a51583f376700828443c2232a4bbd80fdce73c05898788 |
| skills/instructions-authoring/SKILL.md | 2fdef7dd53513f3fc2df269b9e59d70f91a015a3b75314fc6ec0d8ccf53a1791 |
| skills/instructions-authoring/references/customization-generation-template.md | b0e25429e290a3ef48c71a015743a29a84d934e3c4abc889ba9cbe36d3e38379 |
| skills/agent-plugin-security-hardening/SKILL.md | e1a1384ecd162b11f06f8587843623662e23384af5a52f99ff2eb699ff6822d1 |
| skills/route-customization/SKILL.md | f2af3bedd821e082867293f0866e282e2aa34ff39c80e898cecb0a19acb7c3b2 |
| skills/skills-authoring/anthropic-best-practices.md | b68a9cc07a949c7b46d6ca0b1063647aa66a8bced612ee96fbe862e140bddd96 |
| skills/skills-authoring/graphviz-conventions.dot | b18a02773875f6c7b92f2a260e88550c92a62549b0009df9d680f7e9541d0ecc |
| skills/skills-authoring/persuasion-principles.md | c3c84f572a51dd8b6d4fc6e5cbdc2bc3b9e07ba381a45bdabfce7ad2894dd828 |
| skills/skills-authoring/render-graphs.js | e1fa7aec80a6c72a4f4a78233e4461c1f57a1b168beb020d889fb85b8e6e389f |
| skills/skills-authoring/SKILL.md | a03788780c3efe0e051abba3584ce88a072d7431d645f26dc360b42e016af3b0 |
| skills/skills-authoring/testing-skills-with-subagents.md | cb1a96823fc19f6f64b023fe639238d933531444084a64048ded36e7b0307a9c |
| skills/route-customization/references/output-template.md | 8bcec8c80ddbbeacdc1f9f4a6217d8247920e85d32c0174eb94c2bb6f0203e48 |
| skills/skills-authoring/examples/CLAUDE_MD_TESTING.md | 0b379a3415e185d3c434b3ad283d8aa132f3022c2a4f210f168865b5986bcef0 |
| skills/agent-plugin-publishing/SKILL.md | cada42adaf4f506c991bf06107a712bb3cf2b08a2636b53c1ad74de4051af6c0 |
| skills/agent-plugin-integrity/references/templates/plugin-manifest.schema.json | 7fe60d7940f33deafac349bcfcf3b021a592ab3e747e663545883a168538f502 |
| agents/workspace-scaffolder.agent.md | 45728a41635478a25424c2b0e8c67ccc73c0795498cc26d76b77da2ed0814e52 |
| instructions/governance-naming-conventions.instructions.md | d3de0dee13265b59d79e1c3b5c3fa6cb1d69211dda19d94fcdc89a8ec143d5c9 |
| instructions/request-economy.instructions.md | c0b5d857d31be675a1795344a12ec10bd393ea4ae6dac532f28afdea3d920268 |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| prompts/workspace-scaffolder.prompt.md | d15b0a2b2502222376e580398d1026229e3b8724b4e7d8e203e9327ca7755a74 |
| skills/agent-authoring/SKILL.md | bccbfce8fd8809c07eba33c12d3750e097a17cba03be5f60cd9a2c9ab6f4b14b |
| skills/agent-plugin-integrity/references/templates/readme-verification-snippet.md | c2ce8ce69216b870594fff2acdac3dc003da2a757b04ca36139665bcef90d1cd |
| skills/agent-authoring/references/source-catalog.md | 001f777abd15597caca095f8aebbad4ef2ca26f6277b05e4221897e81eb5c5e1 |
| skills/agent-plugin-implementation-extension/SKILL.md | 54322ad1ca236aad40785cf571d468fadf961cb3cd23143973fdf852441327e9 |
| skills/agent-plugin-implementation-markdown/SKILL.md | 0ffa375aebb0c7f0a1a9f702c967b987fcbc80f7be2b3fe05858a2234f188937 |
| skills/agent-plugin-integrity/SKILL.md | f52d9c09d631374dcdb1c3b1cd075e328b9bdca5f47e88546fa420249c5e338a |
| skills/agent-plugin-integrity/references/source-catalog.md | 5d9284c26b99760736a779293ad6b86af754f7a5ce1aea20dea44a9b595d9908 |
| skills/agent-plugin-integrity/references/verification-manifest-template.md | 4d1152a8dcee3fed02a3eff3fba9f6adf5ab5f6e1b062d4b575da4c08fe1ed49 |
| skills/agent-plugin-integrity/references/scripts/invoke-agent-plugin-integrity.ps1 | c682174132dc739025a415de6936ffa58ad7ebf0ecddb32074e62f07d86382df |
| skills/agent-plugin-design/SKILL.md | 65fd187ca4302b5ade44d79881abe793a4ee2981da1119f0b2234f67afbd8322 |
| skills/skills-authoring/references/source-catalog.md | 00f36bf0d4c713a3d15cba2c94e0d35d818abdf3ade0cfd393964a73e1d8f83f |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
