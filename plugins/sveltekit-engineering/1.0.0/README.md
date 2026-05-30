# sveltekit-engineering

## Overview

- Purpose: Provide a SvelteKit-specific engineering bundle for full framework lifecycle delivery.
- Capability Provided: SvelteKit routing, load/actions/endpoints/hooks/state/auth/testing/observability/packaging workflows.
- Why Install: Install this plugin to build and evolve SvelteKit applications with framework-specific best practices.

## Version

- Plugin Name: sveltekit-engineering
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: 707e206c6934f1cc52bd42f61b62d0fb32795b3e20757da14fab4ff054f86ebe

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/sveltekit-load/SKILL.md | Skill | Use when implementing or reviewing SvelteKit load functions including server load, universal load, streaming, data invalidation, and fetch behaviour. |
| skills/sveltekit-observability/SKILL.md | Skill | Use when adding OpenTelemetry tracing, instrumentation, or Server-Timing headers to a SvelteKit application via instrumentation.server.ts or the hooks-based instrumentation pattern. |
| skills/sveltekit-orchestrator/SKILL.md | Skill | Use when a SvelteKit request spans multiple capability domains and needs one deterministic intake, explicit phase ownership, and a unified execution contract. |
| skills/sveltekit-packaging/SKILL.md | Skill | Use when building a reusable SvelteKit or Svelte component library using @sveltejs/package, including $lib export surface design, package.json exports map, the svelte field, TypeScript declaration generation, and library publishing conventions. |
| skills/sveltekit-routing/SKILL.md | Skill | Use when implementing or reviewing SvelteKit file-system routing including pages, layouts, navigation, and route parameter handling. |
| skills/sveltekit-server-endpoints/SKILL.md | Skill | Use when implementing or reviewing SvelteKit +server.ts API endpoints including HTTP verb handlers, JSON responses, streaming, content negotiation, and server-side REST patterns. |
| skills/sveltekit-state-management/SKILL.md | Skill | Use when implementing or reviewing reactive state in SvelteKit using $app/state runes, $app/stores legacy API, App.PageState typing, shallow routing state, or navigating/updated lifecycle signals. |
| skills/sveltekit-page-options/SKILL.md | Skill | Use when configuring SvelteKit rendering behaviour through page options including ssr, csr, prerender, trailingSlash, and the entries function for static prerendering. |
| skills/sveltekit-testing/SKILL.md | Skill | Use when writing or reviewing tests for SvelteKit applications including Vitest unit tests for load functions and actions, Playwright end-to-end tests, and the @sveltejs/kit/testing adapter for component testing with routing context. |
| skills/sveltekit-hooks/SKILL.md | Skill | Use when implementing or reviewing SvelteKit hooks including handle, handleError, handleFetch, sequence, and server versus universal hook files. |
| skills/sveltekit-errors/SKILL.md | Skill | Use when implementing or reviewing SvelteKit error handling including +error.svelte pages, the error helper, handleError hook, expected versus unexpected errors, and error boundaries. |
| agents/web-frontend-engineer.agent.md | Agent | Specialist for implementing and reviewing web frontend code including HTML, CSS, TypeScript, component architecture, accessibility, Core Web Vitals performance, and frontend security. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| instructions/web-frontend.instructions.md | Instruction | Web frontend coding standards: component boundaries, accessibility, Core Web Vitals, security (XSS, CSP), and prohibited patterns. |
| prompts/execute-delivery.prompt.md | Prompt | Session-start prompt for orchestrator-first execution continuation with parallel-safe dispatch, aggressive traceability updates, and status-first reporting. |
| skills/sveltekit-actions/SKILL.md | Skill | Use when implementing or reviewing SvelteKit form actions including default and named actions, progressive enhancement with use:enhance, validation, and server-side mutation patterns. |
| skills/sveltekit-adapters/SKILL.md | Skill | Use when selecting, configuring, or troubleshooting SvelteKit adapters for deployment to Node.js, static hosts, Vercel, Cloudflare, and other targets. |
| skills/sveltekit-auth/SKILL.md | Skill | Use when implementing authentication or session management in SvelteKit including cookie sessions, OAuth flows, JWT validation, route protection via hooks, and the sv add auth CLI add-on. |
| skills/sveltekit-configuration/SKILL.md | Skill | Use when configuring svelte.config.js for a SvelteKit application including base paths, aliases, CSP headers, CSRF settings, preload strategies, version management, and kit-level build options. |
| skills/sveltekit-environment/SKILL.md | Skill | Use when working with environment variables in SvelteKit including $env/static/private, $env/static/public, $env/dynamic/private, $env/dynamic/public, and server-only module boundary enforcement. |
| skills/sveltekit-advanced-routing/SKILL.md | Skill | Use when implementing SvelteKit advanced routing features including route groups, optional parameters, rest parameters, parameter matchers, and layout inheritance control. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | 2e24c4d5a27828f8969b49dd7bd53cd153369908085c1f3824f6edb3978c0365 |
| skills/sveltekit-load/SKILL.md | 3701ff17c84b7db226b66ee2ba111256617c268126a74d14a068afc68745e311 |
| skills/sveltekit-load/references/source-catalog.md | 946e92828494c39e80d5b27da05452d3fe582714896de5dfd8331eb4ede215e5 |
| skills/sveltekit-observability/SKILL.md | 35f3e5a35692fbe76d467f0e630e6ae86117958cf1aec62ff17b3a74af7c3001 |
| skills/sveltekit-observability/references/source-catalog.md | 57ff35e323ca828c04c51af240019f863cfe49aa5f18f28528090556d8a6907b |
| skills/sveltekit-orchestrator/SKILL.md | bb2d11229fde5cc51f0237490e8fb3b354b245f58a6d8bc55bf5ad2a46608310 |
| skills/sveltekit-orchestrator/references/source-catalog.md | 9341652b1c8a8f86cbd6947eedb05cc5cdb75b6c32ca2f087706aa231806e305 |
| skills/sveltekit-packaging/SKILL.md | 7178223bdad28cc62bf0316b76d8f066de3a11fa3ab407f382309f80d82fb99c |
| skills/sveltekit-hooks/references/source-catalog.md | 2d4a3f7aea7e19f83ce1766412327a44fa79f5223181c40759ffcdbdf5c6770d |
| skills/sveltekit-packaging/references/source-catalog.md | 7b8196a32eea7fa831265f4a5e9761e776b167dd090a480c8664427fc75b24b0 |
| skills/sveltekit-page-options/references/source-catalog.md | 6d4a8b71cac53f8dbc25f6394f586709c39b8f33cc5de7688a3962c80946d357 |
| skills/sveltekit-routing/SKILL.md | 1ee39ebc80081cba052645c36842f1ac3a0fd976a1dd3c5c5f1b07640f330587 |
| skills/sveltekit-routing/references/source-catalog.md | 3ab3de54739bd41c15250e3a67d9c5581cce1ff51a3ca12b75b95feefbae68c4 |
| skills/sveltekit-server-endpoints/SKILL.md | 127a2f37d325265fa736b00a643e48c0af8efebe0132c18dd3d7117799c4cc68 |
| skills/sveltekit-server-endpoints/references/source-catalog.md | baa4958f3cc85cedf2a7cfd6f96fc591b3feb520488824d733c71b99ffc349ce |
| skills/sveltekit-state-management/SKILL.md | 56b51e6766a52da09115754cf088b23219bc45720c6fa321d33e4123274c74cf |
| skills/sveltekit-state-management/references/source-catalog.md | 113202aa2a733472d4cf768bd1037c6dc6a27f77b14d984d2baadef628594297 |
| skills/sveltekit-page-options/SKILL.md | ebc075817b8cd519d69e2fb0fb30a5cd1c989b9b8985bc916e235a90d14a68b5 |
| skills/sveltekit-testing/SKILL.md | 55d663f61f35724a7ca65545c6e5a48a9b681e3c80bbc34215de81b3c74dd503 |
| skills/sveltekit-hooks/SKILL.md | 1959dcf5e52a9f3bc2b82a8370adc45f54984ab6de029ce4742095355aa3d060 |
| skills/sveltekit-errors/SKILL.md | be7ae3c02175681d24c7ce4c9f3e9f24f398bd0c9a3648bd232c7af3f686fe0d |
| agents/web-frontend-engineer.agent.md | 651a9cabd397454c2f0356886e5968ec09b35a2610480222a6a6a08651ab995e |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| instructions/web-frontend.instructions.md | 49c14c2334becf67c199bc510f28f1872e817eaa826d13eedf109fdde26ab763 |
| prompts/execute-delivery.prompt.md | 3f95cb30768d39d2f3dd4df306c94c28be1124184ed3e192fac11e5b7d2b0039 |
| skills/sveltekit-actions/SKILL.md | ef82711e6928e4b29c3217022d40dff82c400a69e1b64126c47b2adb72abd05d |
| skills/sveltekit-actions/references/source-catalog.md | 4cfa080df89a1dc7e2464dd182b61903743bf7465dfd577ab066f7ab12dd27ee |
| skills/sveltekit-adapters/SKILL.md | 4b74fa5ebe3405a6070ba5c67291221aa9eaeaa8d6f2ed072f36000b0e7dd130 |
| skills/sveltekit-errors/references/source-catalog.md | 6c816656aef2ba7ae9b558d215cdaab0830a54458000502bac145ff9365c44c4 |
| skills/sveltekit-adapters/references/source-catalog.md | ea963b7ccec2b29de0b9c1cc48b428ff9b88621d2820de93a804725bd1a617fa |
| skills/sveltekit-advanced-routing/references/source-catalog.md | 19fda9f527bd2a584ec2e5258b3e30e7d2397d86598890ea30ec43fe902fa75f |
| skills/sveltekit-auth/SKILL.md | 49d38a94dad4dfb975a2c89a9c70019aace49c97f7c48b78a41b4b89136f4d67 |
| skills/sveltekit-auth/references/source-catalog.md | aa66e4d40f1ba029768b9e0791df0600a59509b7ea2473edf743741a78df2a4b |
| skills/sveltekit-configuration/SKILL.md | 20da6d7d7a698c1223ee7e53eb0351b59f714ada1ab3a45cdc5f9988c30be0e5 |
| skills/sveltekit-configuration/references/source-catalog.md | e000986a9b972c717d833ef9fa61f90dac6465c491e30dff071c3370d850f131 |
| skills/sveltekit-environment/SKILL.md | 2c01aaa4f16d300cdda6aef2a3b939893572d19387dcbac1e858f948e16ec7ce |
| skills/sveltekit-environment/references/source-catalog.md | 14f7530f09cd89ec0aa3e8e7f43847b02f0b648a3b40d68efb2870d604c517ab |
| skills/sveltekit-advanced-routing/SKILL.md | f8b9947d5c4c58a173608e04e5d362e4c5e0502cea548109567059baa82e1fa1 |
| skills/sveltekit-testing/references/source-catalog.md | 8cc503322f4469e300033485d4f9ce40eaa50eb0400a35239bd9e60056865a7a |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
