# shadcn-tailwind-system

## Overview

- Purpose: Provide a design-system focused bundle for shadcn and Tailwind implementation, governance, and quality gates.
- Capability Provided: shadcn and Tailwind setup, component design, theming, testing, source curation, and CI quality workflows.
- Why Install: Install this plugin to build and evolve consistent UI systems using shadcn and Tailwind best practices.

## Version

- Plugin Name: shadcn-tailwind-system
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: 559c782b2395e34f17e9e5ef5c754ff44d27133860a6e8ec84dff619f25f835e

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/shadcn-source-curation/SKILL.md | Skill | Use when shadcn/ui guidance needs CLI-registry, Radix primitive, and token-system evidence with explicit tracking for component API drift and accessibility contract changes. |
| skills/shadcn-testing/SKILL.md | Skill | Use when writing or reviewing tests for shadcn/ui components — covering Radix portal handling, keyboard interaction, async Dialog/Sheet assertions, Combobox/Command filtering, and Storybook story contracts. |
| skills/shadcn-theming/SKILL.md | Skill | Use when customizing shadcn/ui's CSS variable system — covering color token design, dark mode strategy, brand palette mapping, multi-theme support, and design-token governance across projects. |
| skills/tailwind-ci-integration/SKILL.md | Skill | Use when TailwindCSS bundle size, class ordering, content scanning, or Core Web Vitals thresholds must be enforced automatically in CI to gate PRs and track regressions across commits. |
| skills/tailwind-component-design/SKILL.md | Skill | Use when designing or reviewing TailwindCSS component patterns — covering utility composition, responsive design, dark mode, design tokens, Headless UI integration, and accessibility. |
| skills/tailwind-design-system/SKILL.md | Skill | Use when a shared TailwindCSS design token package is maintained across multiple applications or a monorepo — covering token versioning, breaking-change governance, downstream consumption patterns, and cross-app visual consistency. |
| skills/tailwind-orchestrator/SKILL.md | Skill | Use when a TailwindCSS request spans multiple capability areas — setup, component design, quality, or migration — and needs one deterministic intake, explicit phase ownership, and a unified execution contract. |
| skills/tailwind-quality-gate/SKILL.md | Skill | Use when a TailwindCSS implementation needs an expert, evidence-first quality decision covering bundle size, accessibility, design token conformance, and Core Web Vitals before merge or promotion. |
| skills/tailwind-setup/SKILL.md | Skill | Use when configuring TailwindCSS in a project for the first time, migrating from v3 to v4, or auditing an existing Tailwind build pipeline for correctness and security. |
| skills/shadcn-setup/SKILL.md | Skill | Use when integrating shadcn/ui into a new or existing project — covering CLI initialization, components.json configuration, framework-specific wiring, path alias setup, and dependency alignment. |
| skills/tailwind-source-curation/SKILL.md | Skill | Use when TailwindCSS guidance must be grounded in authoritative, current sources and converted into reusable, agent-usable Tailwind skill inputs with freshness and drift controls. |
| skills/shadcn-registry/SKILL.md | Skill | Use when authoring, hosting, or consuming a custom shadcn/ui component registry — covering registry.json schema, component item types, CLI resolution, hosting strategy, and cross-project distribution for org-owned components. |
| skills/shadcn-orchestrator/SKILL.md | Skill | Use when a shadcn/ui request spans multiple capability areas — setup, theming, component design, forms, data display, testing, accessibility, migration, animation, registry, CI integration, design system, or quality — and needs one deterministic intake, explicit phase ownership, and a unified execution contract. |
| agents/ux-designer.agent.md | Agent | Specialist for UX research, wireframe design, prototype definition, usability validation, and engineering handoff across web and mobile surfaces. Does not write production code. |
| agents/web-frontend-engineer.agent.md | Agent | Specialist for implementing and reviewing web frontend code including HTML, CSS, TypeScript, component architecture, accessibility, Core Web Vitals performance, and frontend security. |
| instructions/ux-design.instructions.md | Instruction | UX design policy standards: accessibility baseline, interaction conventions, and wireframe/prototype mandates. |
| instructions/web-frontend.instructions.md | Instruction | Web frontend coding standards: component boundaries, accessibility, Core Web Vitals, security (XSS, CSP), and prohibited patterns. |
| prompts/scaffold-web-ux-quality-gate.prompt.md | Prompt | Scaffold a web UX quality-gate evidence bundle for a workstream using either the core 3 dimensions or the full portable dimension set. |
| skills/generate-web-icons/SKILL.md | Skill | Use when web app icon assets must be created or refreshed within the existing workspace design language and framework, with manifest-ready outputs and deterministic quality checks. |
| skills/shadcn-accessibility/SKILL.md | Skill | Use when building accessible shadcn/ui components from the start — covering per-component Radix ARIA contracts, WCAG 2.2 success criteria mapping, keyboard interaction implementation, focus management, and screen reader announcement patterns. |
| skills/shadcn-animation/SKILL.md | Skill | Use when adding animations to shadcn/ui components — covering Framer Motion + Radix integration, tailwindcss-animate keyframes aligned to Radix data-state attributes, AnimatePresence with forceMount for exit animations, and prefers-reduced-motion compliance. |
| skills/shadcn-ci-integration/SKILL.md | Skill | Use when shadcn/ui component freshness, import correctness, bundle impact, token conformance, and registry drift must be enforced automatically in CI to gate PRs and track regressions across commits. |
| skills/shadcn-component-design/SKILL.md | Skill | Use when designing, composing, or extending shadcn/ui components — covering CVA variant patterns, Radix primitive wiring, custom component authoring, compound components, and accessibility integration. |
| skills/shadcn-data-display/SKILL.md | Skill | Use when implementing data-heavy shadcn/ui surfaces — covering TanStack Table DataTable patterns, shadcn Charts (Recharts), Command palette, Combobox, and complex list/grid compositions with sorting, filtering, pagination, and accessibility. |
| skills/shadcn-design-system/SKILL.md | Skill | Use when a shared shadcn/ui component library is maintained across multiple applications or a monorepo — covering component package architecture, token versioning, breaking-change governance, downstream consumption contracts, and cross-app visual consistency. |
| skills/shadcn-forms/SKILL.md | Skill | Use when implementing forms with shadcn/ui — covering react-hook-form integration, zod schema design, FormField composition, validation UX, server action wiring, and multi-step form patterns. |
| skills/shadcn-migration/SKILL.md | Skill | Use when migrating an existing application from another component library (MUI, Chakra UI, Mantine, Ant Design) to shadcn/ui — covering component equivalence maps, token migration, progressive coexistence patterns, and breaking-change sequencing. |
| skills/shadcn-quality-gate/SKILL.md | Skill | Use when a shadcn/ui implementation needs an expert, evidence-first quality decision covering accessibility, design token conformance, bundle impact, form validation correctness, and Radix primitive integrity before merge or promotion. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | ed534dd39909336b05b0fb80f4cd8254d3ccf10f9242dc068c85d79ab83d3070 |
| skills/shadcn-source-curation/SKILL.md | 5e4bf75eedcbdda465350a1dfbb10f2eefbe549441f8d5fbc41d128a7353ecdd |
| skills/shadcn-testing/SKILL.md | 508db6a85e665d56bb13ddb30ae519e268d0fc7559c9c7f9f6d9a81afc8db794 |
| skills/shadcn-theming/SKILL.md | 0d5b7117c9e84ae1959686698ea75e5ed85ce207a6d65d2a3798fd8e4f70d50d |
| skills/tailwind-ci-integration/SKILL.md | 24e9b613ce2bb9036cd53b4da449b42cfa11653c463494c4963dabe652e5ee04 |
| skills/tailwind-ci-integration/references/source-catalog.md | 8bfbd9d81e6620277cf35d3d529535c5c7cd44393fe97cd9456f7b3a60d2860d |
| skills/tailwind-component-design/SKILL.md | a720829646220babd090ac74da809a63d087e8d8add852268f136efef12395a4 |
| skills/tailwind-component-design/references/source-catalog.md | 7bb80141f1c810f4ef5dcf7d0fdedc983f7c89232cd539175eb1af58c079cb7a |
| skills/tailwind-design-system/SKILL.md | a4420b2453d38e06558320f4bfd0bf31a7a0d0c14d3640d79c667cefc46efeb0 |
| skills/tailwind-design-system/references/source-catalog.md | 8e6f3cd33886c7e8eb73fa64b47689372a366d1023869e8e1f4358d47ac7a1d3 |
| skills/tailwind-orchestrator/SKILL.md | c8ff8609c5620eb0253ab31667601fbf8802a8778e523d194b0e2b205d0358d9 |
| skills/tailwind-orchestrator/references/source-catalog.md | b63e8c9bd84daa58c3b63edb7dd773bf3e971dacffc917ea5a555113ceb82f8f |
| skills/tailwind-quality-gate/SKILL.md | 5da2a087aef3fb1722b483ac8c6142df0cace9e43a4ff9a01200e90eb4570771 |
| skills/tailwind-quality-gate/references/source-catalog.md | 41e2f8476836b3bad2136be32501861bb8209015a95ff74a758ff2dce39dcda8 |
| skills/tailwind-setup/SKILL.md | b401a1bb2e66e05cc82a704621e71455db51b295b9b3bb00fdcbcd902e19547e |
| skills/tailwind-setup/references/source-catalog.md | 317e695b4c3a235164edf822a01c66aeb0b7a29cc914957bcbc1a9ef12182163 |
| skills/shadcn-setup/SKILL.md | 9cf48c437620bb444085857cbf3ba259cb6f76cf31cf16d6176f2d457e026847 |
| skills/tailwind-source-curation/SKILL.md | 4b6bd830b832c0232ed8d2b355457a1800e9e33a4d4d8939f8b731289d19bbbd |
| skills/shadcn-registry/SKILL.md | ede6cd5f53957338b18042a28229a6523f0d9bd79aa332b442ce65f0dba4f032 |
| skills/shadcn-orchestrator/SKILL.md | 904e8b4c90f6b0502dd924d28a52bfcd183c8016b9911b03677a02c91a1518a9 |
| agents/ux-designer.agent.md | eae58b89ffb2e0db0410aad0692c5b75c1d06e1a60c4fc210f78765d743df08d |
| agents/web-frontend-engineer.agent.md | 651a9cabd397454c2f0356886e5968ec09b35a2610480222a6a6a08651ab995e |
| instructions/ux-design.instructions.md | 30159d3abcc057c853d2492aa00e3600fe09508ca566f8474f7093d105211e2b |
| instructions/web-frontend.instructions.md | 49c14c2334becf67c199bc510f28f1872e817eaa826d13eedf109fdde26ab763 |
| prompts/scaffold-web-ux-quality-gate.prompt.md | f8a8cf6d68a327068f218c616382a202cf87286ed77103fbebe5c0a6cc1d90c7 |
| skills/generate-web-icons/SKILL.md | 1877482b03c2d9bbbd221dace6331b761dab80f7c63487c8bf4b138a2618e6ee |
| skills/generate-web-icons/references/source-catalog.md | 66d296564885d272a43853db37175d541a9e95f36192317f44a8d81c8afcc21c |
| skills/shadcn-accessibility/SKILL.md | bc99c2430e91fc74d1a593a8595d405104cf1345ac077778923a60f57e0f54a1 |
| skills/shadcn-animation/SKILL.md | 093a5e4d3b0d0fb0fda701f3981fe18e20995e0f05164d553e29f199f862f816 |
| skills/shadcn-ci-integration/SKILL.md | f1ada12d792ef797f6aa2c797364aba25ba085fa0cfde3a0df1a0ec9d06480a7 |
| skills/shadcn-component-design/SKILL.md | f486de5a180885adb381793480f1885ddb2533b4b03d6c82c9c14351cfccfa80 |
| skills/shadcn-data-display/SKILL.md | dfde395671eaeac7c92e0cf710975d1715729cfd8a03ef267ec1b743cded839a |
| skills/shadcn-design-system/SKILL.md | 8d158138cdb86a8ad1ef74d30283dd908b8128d70eb42789422d88be477d7aa5 |
| skills/shadcn-forms/SKILL.md | 3c48c9e3aac6be930d2509ecda302b9840dcbeda90d1e3e4cd1a0501ab1ed34f |
| skills/shadcn-migration/SKILL.md | 3d1518650271eb9f0092dab04bac9b8ce9738aae942a37d244464eddb7430337 |
| skills/shadcn-quality-gate/SKILL.md | 698d9abc8c8cdba1791e8ab8582d463a292c06c0ba2626f19e921f16bbc08a1f |
| skills/tailwind-source-curation/references/source-catalog.md | 3492f55df6a80c6696996aaeec3dd297d540fe2cd5ccfc01b0bd47b76d723865 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
