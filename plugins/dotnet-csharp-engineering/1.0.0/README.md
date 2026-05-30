# dotnet-csharp-engineering

## Overview

- Purpose: Provide a domain-focused .NET engineering bundle for implementation, architecture quality, and testing excellence.
- Capability Provided: C# development workflows spanning architecture, data access, resilience, testing, and release-quality gates.
- Why Install: Install this plugin to deliver .NET changes with stronger architecture discipline, test rigor, and release confidence.

## Version

- Plugin Name: dotnet-csharp-engineering
- Semantic Version: 1.0.0
- Author: David Sexton
- Source Commit: 16d627d5eb2b
- Generated At (UTC): 2026-05-30T22:33:44.1390707Z
- Plugin SHA-256: f2dc9c1585ec9acbbe631d7392be0593b100bc869bdac11d5f272906553efb47

## Agent Purpose Guide

| Asset Path | Asset Type | Purpose |
|---|---|---|
| skills/xunit-ci-observability/SKILL.md | Skill | Use when xUnit pipelines need deterministic evidence capture, flaky-test classification, failure triage ownership, and gate-ready reporting. |
| skills/xunit-async-testing/SKILL.md | Skill | Use when xUnit tests must verify asynchronous behavior, cancellation, exception flow, and concurrency outcomes with deterministic assertions. |
| skills/test-driven-development/SKILL.md | Skill | Use when implementing any feature or bugfix, before writing implementation code |
| skills/xunit-fixture-lifecycle/SKILL.md | Skill | Use when xUnit fixture scope, shared context, lifecycle cleanup, and parallelization boundaries must be designed for deterministic and fast tests. |
| skills/syrx-validation/SKILL.md | Skill | Use when applying or reviewing Syrx.Validation.Contract guard patterns at public boundaries with deterministic validation outcomes. |
| skills/syrx-data-access/SKILL.md | Skill | Use when implementing or reviewing .NET repository data access that must use Syrx ICommander<TRepository>, explicit parameterized SQL, and project-approved command configuration patterns. |
| skills/scaffold-dotnet/SKILL.md | Skill | Use when creating a new .NET workspace or solution skeleton and you need standard folders plus reusable build assets applied consistently. |
| skills/layer-boundaries/SKILL.md | Skill | Use when implementing or reviewing namespace, assembly, and project-reference boundaries for layered .NET solutions. |
| skills/xunit-moq-collaboration/SKILL.md | Skill | Use when xUnit tests need expert-level Moq usage boundaries, interaction verification strategy, and collaboration-focused test doubles. |
| skills/xunit-v2-v3-migration/SKILL.md | Skill | Use when upgrading xUnit test assets from v2 to v3 requires deterministic compatibility checks, migration sequencing, and risk-controlled rollout decisions. |
| skills/xunit-traits-and-selection/SKILL.md | Skill | Use when xUnit suites need deterministic trait taxonomy, selective execution strategy, and release-scope test slicing across local and CI runs. |
| skills/xunit-theory-data-stability/SKILL.md | Skill | Use when xUnit Theory data must remain deterministic, reproducible, and stable across IDE, local CLI, and CI execution contexts. |
| skills/xunit-test-design/SKILL.md | Skill | Use when designing expert-level xUnit tests with deterministic Fact/Theory selection, data strategy, assertion quality, and boundary coverage. |
| skills/xunit-source-curation/SKILL.md | Skill | Use when xUnit guidance must be grounded in authoritative, current sources and converted into reusable, agent-usable testing guidance. |
| skills/xunit-runner-platforms/SKILL.md | Skill | Use when xUnit execution must be standardized across local and CI environments with deterministic runner selection, adapter behavior, and result contracts. |
| skills/xunit-quality-gate/SKILL.md | Skill | Use when xUnit assets need an expert, evidence-first quality decision with deterministic findings, ownership, and pass-or-fail recommendation. |
| skills/xunit-orchestrator/SKILL.md | Skill | Use when one xUnit request spans multiple capability areas and needs deterministic intake, explicit phase ownership, and a unified execution contract. |
| skills/dotnet-resilience/SKILL.md | Skill | Use when designing, implementing, or reviewing .NET distributed-system resiliency with Microsoft.Extensions.Resilience and Polly, including safe strategy composition and failure-mode validation. |
| skills/dotnet-refactor/SKILL.md | Skill | Use when modernizing .NET code with this priority order: preserve requested behavior, keep changes small and verifiable, then apply measurable improvements such as nullable adoption and obsolete API cleanup. |
| skills/build-maui-apps/SKILL.md | Skill | Use when building or upgrading .NET MAUI mobile apps and you need an expert, source-backed workflow for architecture, secure storage, testing, performance, trimming, and release readiness. |
| skills/build-blazor-web-apps/SKILL.md | Skill | Use when implementing or reviewing Blazor web applications (.NET Client, Server, or MAUI Hybrid) and you need a repeatable workflow for component architecture, performance, accessibility, security, and testing. |
| skills/branch-completion/SKILL.md | Skill | Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup |
| skills/async-programming/SKILL.md | Skill | Use when implementing or reviewing async/await and concurrency behavior in .NET code, including ValueTask decisions and streaming backpressure. |
| skills/api-design/SKILL.md | Skill | Use when designing external API integrations with resilient client patterns, DTO contracts, and clear integration boundaries. |
| prompts/execute-testing-xunit.prompt.md | Prompt | Prompt for XUnit test generation aligned with project standards and workspace testing rules. |
| instructions/validation.instructions.md | Instruction | Standardized Syrx guard usage and validation rationale. |
| instructions/testing-strategy.instructions.md | Instruction | Unified testing strategy: naming, patterns, and tooling. |
| instructions/syrx.instructions.md | Instruction | Definitive Syrx 2.4.1 repository and SQL Server usage instructions. |
| instructions/secure-coding.instructions.md | Instruction | Consolidated secure coding rules for .NET-focused work, aligned with OWASP and workspace conventions. |
| instructions/namespace-boundaries.instructions.md | Instruction | Namespace and assembly boundary rules to minimize coupling and keep AI-generated code aligned with layered architecture. |
| instructions/csharp.instructions.md | Instruction | Consolidated C# development, style, and engineering standards. |
| instructions/async-programming.instructions.md | Instruction | Consolidated async/await and concurrency guidance with ValueTask policy. |
| instructions/architecture.instructions.md | Instruction | Consolidated DDD, SOLID, and .NET architecture guidance for lean application development. |
| agents/defect-debugger.agent.md | Agent | Reproduces, isolates, and fixes concrete software defects with minimal, testable changes. Use when a specific bug must be diagnosed and resolved. |
| agents/csharp-engineer.agent.md | Agent | Use when implementing, modernizing, testing, or reviewing .NET/C# code with workspace canonical standards. Route debugging to defect-debugger and architecture boundary decisions to architecture-designer. |
| agents/code-reviewer.agent.md | Agent | Review completed implementation steps against the originating plan and active workspace instruction files, producing a severity-ranked finding set with explicit remediation guidance. |
| agents/architecture-designer.agent.md | Agent | Unified agent for architectural decision records, domain-driven design guidance, and architectural blueprint synthesis. |
| skills/domain-design/SKILL.md | Skill | Use when designing aggregates, domain events, application service boundaries, and anti-corruption layers for DDD-style .NET solutions. |
| skills/data-design/SKILL.md | Skill | Use when designing the data layer for a system — covers schema design, migration planning, data governance requirements, and query optimisation strategy. |
| skills/current-test-coverage/SKILL.md | Skill | Use when a user asks for the current or latest test coverage and wants fresh coverage metrics from this session instead of previously recorded numbers. |
| skills/csharp-testing-quality-gate/SKILL.md | Skill | Use when C# changes need an expert, evidence-first testing quality decision with deterministic coverage, failure-mode, and contract-verification checks before merge or promotion. |
| skills/csharp-release-quality-gate/SKILL.md | Skill | Use when C# release candidates need one expert, evidence-first go or no-go decision that consolidates language, async, architecture, testing, and data-access quality outcomes. |
| skills/csharp-orchestrator/SKILL.md | Skill | Use when one C# and .NET request spans multiple capability areas and needs one deterministic intake, explicit phase ownership, and a unified execution contract. |
| skills/csharp-language-quality-gate/SKILL.md | Skill | Use when C# language and API-contract changes need an expert, evidence-first quality decision before merge or promotion. |
| skills/csharp-data-access-quality-gate/SKILL.md | Skill | Use when C# data-access changes need an expert, evidence-first quality decision across repository boundaries, parameterized SQL safety, and immutable contract discipline before merge or promotion. |
| skills/csharp-async-quality-gate/SKILL.md | Skill | Use when async and concurrency behavior in C# needs an expert, evidence-first quality decision before merge or promotion. |
| skills/csharp-architecture-quality-gate/SKILL.md | Skill | Use when C# architectural integrity needs an expert, evidence-first quality decision across boundaries, repository safety, and validation discipline. |

## Asset Inventory

| Asset Path | SHA-256 |
|---|---|
| plugin.json | b17146d15317a03f25edf347824803f707c5ddc8f656ace275523bb94a915606 |
| skills/xunit-ci-observability/references/source-catalog.md | 3b7062d6ad087c3018708fa3cec4657eb5bb024c97636847e412a4173727a614 |
| skills/xunit-ci-observability/references/ci-test-evidence-template.md | 8a176f99a8063883fa87fe8ffedded0dd06f01b2178dd2f9d476a673ab3a4bf7 |
| skills/xunit-ci-observability/SKILL.md | 0156ded70176b92758db49e40a590be63ae38c9f1cd39972f604597505302f25 |
| skills/xunit-async-testing/references/source-catalog.md | 23e7788d9c8d294b9d78d146ad21d36619a7f414a8d743d3a7fc7e688b59c52a |
| skills/xunit-async-testing/SKILL.md | 62ccdccebdb5178b94e5e054bbfc7f1e8267ac062b2a4a28df8b9203ac1e21c7 |
| skills/test-driven-development/references/tdd-examples-and-anti-patterns.md | b3cfd475d142d829634929c317728397e61df532b1169c9ab65e20b1c35c3f24 |
| skills/test-driven-development/testing-anti-patterns.md | bde453bc258f06543987477c837939afaa774ea2acbd9f308d702fc452bc4283 |
| skills/test-driven-development/SKILL.md | 19a2f32393450b7b55917c2c5a301008f2a72ce32efe2566def77c868daa04de |
| skills/xunit-fixture-lifecycle/SKILL.md | 1e76e33705c178f2e7bde0261e1f763e836051275a07d8ff37aef7a47c296aaa |
| skills/syrx-validation/SKILL.md | 68a67fa04c8faf38f49ffd3fb1de768c3d4dc76ee7210fee59b1fd74177ebcaf |
| skills/syrx-data-access/references/quick-reference.md | 3fc5aad15f2b1267a0d1fd33787bef02607a14d5731511608ff81b33f35a7320 |
| skills/syrx-data-access/references/implementation-examples.md | a44ca0a9aac9c6ed62814b83a6cf58e1490a67f5515be602e314d041d0d20e33 |
| skills/syrx-data-access/SKILL.md | f1477b6998494c4ac15350e8d9ba74f558fce69dbe363b3db08158ae75444364 |
| skills/scaffold-dotnet/references/templates/Directory.Build.targets | 9669ecc63ed9c568106a43f13231cae5c7fcd31c56d021e19f90e1cf4889fc01 |
| skills/scaffold-dotnet/references/scripts/New-DotNetSolutionScaffold.ps1 | c848e3ef266de74ab8eb3129437904e2892f7823308d7ffc3d92872794e7827e |
| skills/scaffold-dotnet/SKILL.md | 31c82112526a706c2f8bbad0c8031801badbf9dfe45df7aeb09de68a61872456 |
| skills/layer-boundaries/SKILL.md | 789e73a78c35ee84be754c7c83cbc5222f39229f47b61e23e0454c2668c961d4 |
| skills/dotnet-resilience/references/patterns-and-practices.md | 8da70b3b4e019ea5c58cde3643bcc5a2b62df1066917cc25414fa19bbcccc7ef |
| skills/syrx-data-access/references/review-checklist.md | dba5f5b198a196e6991c7e46e68115b0eb4cbd49bff71d69c967eab9c040474e |
| skills/xunit-fixture-lifecycle/references/source-catalog.md | cd7fb8c948921b3537e4955468304f26fcc431d63bf6431e7f8e7e185e3aded6 |
| skills/xunit-moq-collaboration/SKILL.md | 68d23f5966bd5a5ebe8e290463724316668e8fea035bf6906ecb43749ecf8ccb |
| skills/xunit-moq-collaboration/references/source-catalog.md | 0930d94f8d8faaa7b6b1fdb9d63a8a83b7dca9c61583c5267db5e0c6b4d0d5b6 |
| skills/xunit-v2-v3-migration/SKILL.md | fe4520291cc725431d9905642449814fbf0582a431dd3da857c1f80f9920afad |
| skills/xunit-traits-and-selection/references/traits-taxonomy-template.md | df04f05f357dcc8262e5cd55026048f46f53e2716ae17ecc11040c0aeef9bc20 |
| skills/xunit-traits-and-selection/references/source-catalog.md | d0a51a4c0b13a496519bf0f5d94f9ace9dce5ea8e72e0830f20d9f7c43e40a73 |
| skills/xunit-traits-and-selection/SKILL.md | fd85fc6537fdd64c8d889b3e98fb68e2d8e86904ea22fd3f328d1650ddbbcbca |
| skills/xunit-theory-data-stability/references/source-catalog.md | bc5257a786267c5c3c82751a8642a2d8b80604336cb4a05a2beff599214044be |
| skills/xunit-theory-data-stability/SKILL.md | ac06756a65f0217364ff31661000025bd6cf7bf16db5aad4054a11b52d15d874 |
| skills/xunit-test-design/references/source-catalog.md | bd0b14aaedb499945b44e29823ffd2b97220b90ef8c0ef90c752763c027c66ba |
| skills/xunit-test-design/SKILL.md | 35a7e5ad7cb3510185c138a884a88d9e259cf1e14d1e9d2b851a4ebc6a599f6e |
| skills/xunit-source-curation/references/source-catalog.md | ce1ed3f490b9dde9b2a31e2896444520a60eae02c0cccdcb381dda71ae622b46 |
| skills/xunit-source-curation/SKILL.md | 0ebba9d42ca65bc8ec40c0883b9be02472ce9bdfb1be44e173489afd51c5ab4d |
| skills/xunit-runner-platforms/references/source-catalog.md | 1d22d5a4206a49e1c6bc2a15d8bada5cc5c77e33fd0548833ee3ee23c8b3d3f9 |
| skills/xunit-runner-platforms/references/runner-platform-contract-template.md | 1f6303cd81c0aff74b1937da993d465998f3b6dc0f338aa06cced11d34b1a7e2 |
| skills/xunit-runner-platforms/SKILL.md | a8bfbc57db4dd314b40f4a49d9707e428500ec89a1704af72a0e13bddc0b37d0 |
| skills/xunit-quality-gate/references/xunit-quality-gate-checklist.md | 1644af6b3876ba913d7db12311c47318079dcd69822f15249da288ad53fca7ea |
| skills/xunit-quality-gate/references/source-catalog.md | bc48959b865afb83ddaeafde8ce8f087870b2fba0f3d8da71ec4f508aa9bf45c |
| skills/xunit-quality-gate/SKILL.md | 2171329a50f9a63485b6955efa3a84e3a36b10c2ef6f0cd20439af804ccf1a66 |
| skills/xunit-orchestrator/references/xunit-execution-contract-template.md | caac4e22d53c5b13163b6b18e70d2af4ac394f75a7a4833730f9bfd16e824c9b |
| skills/xunit-orchestrator/references/source-catalog.md | bfb9568481a78d5e02bc98430ba45aaae930dc319eace6ed1f7d3d6896cbf472 |
| skills/xunit-orchestrator/SKILL.md | bfa9d89f570ccfa5758fbde42057aac89083eff294016f83c04ee0f55544dea3 |
| skills/dotnet-resilience/references/library-intake-gate.md | 12550d7ddb14619c945c7b1cb0753f39835acfdfead6f3a8ee20ed5002d13244 |
| skills/dotnet-resilience/SKILL.md | 223789f944cd4be41dc03fc25f561df01d071ad035e784bf141d84d90588a196 |
| skills/dotnet-refactor/SKILL.md | bec74cacfa4478015bd5a97278cbc1bc3dceec240f2f2bb00ff1e2f04f860741 |
| skills/domain-design/references/aggregate-boundary-checklist.md | 93aa4c2620bd3cbfd39ba9ed379a4b437ce88a51fde44630d57caea865a64007 |
| skills/build-maui-apps/SKILL.md | 60e84feafc2974973a0eba20c8bbc3eea94e20b5b052ec9380186afb47f1fe6f |
| skills/build-blazor-web-apps/references/source-catalog.md | d2ec51cdadb57d592d65260614ee66324f6182f05e3f51f90f1d709e90748d34 |
| skills/build-blazor-web-apps/SKILL.md | 30ec8c83440caf95d9c767488d282a9629ae902c224b3c61392fe0c647db0f3d |
| skills/branch-completion/SKILL.md | d3f83f56b4dd6ac6b486bcb675eb10f24dfbf14a99ea81037d05ce86a9f9920a |
| skills/async-programming/SKILL.md | c77858cc1b513c240cb36233d684ff26d044a15f16daf8da56c345e9670142db |
| skills/api-design/SKILL.md | 61ca7e30ae8e9b348856c17fe5fecd5d4064b2947567f1484e3ea502e283e148 |
| prompts/execute-testing-xunit.prompt.md | 2d0c9875769bdf129547e1d5b27901245316fc9a32ca8fa397e13ba1fc5ea66e |
| instructions/validation.instructions.md | c5df3763b15758e4a441522f7785380bbd027e8a42bde5287e2f3d54ec4a1cc2 |
| instructions/testing-strategy.instructions.md | e3567886bcc1318b3de60ee04aedbbe09551829e8e259e2613fb616d6882cc41 |
| instructions/syrx.instructions.md | 89725148837c1770ddf6413e3833f9c27ed30f7b31a6d2f56d8b4cf4cf6d967e |
| instructions/secure-coding.instructions.md | 647b74096502508a655973b6161ac10f646620bc63a92beec5084376a7e7630c |
| instructions/namespace-boundaries.instructions.md | df6abf60b32ca28dc716ebbb57fcc3280c34c21f304558e6ae67b2571bc8e3f4 |
| instructions/csharp.instructions.md | 228c58b8b7d77be2b38d4273aba061e96fa7bb3247c3fa2970730c38f05536fb |
| instructions/async-programming.instructions.md | f9c4a001ed43b993783591f35f9319e3370193b786cc32499c560330810185b9 |
| instructions/architecture.instructions.md | 96b28d656f7d94bd2cf89400be724d8b7ee2e26bbad9bf6f7e60d0650815b966 |
| agents/defect-debugger.agent.md | 2b8bc70f634b8e3bf15098186b9ce0800af662f230e877c551a8ca8aad55263a |
| agents/csharp-engineer.agent.md | 1efd11bc337e121da0b627748efdec96358a6c96f058bd87e4b478f4f1a89065 |
| agents/code-reviewer.agent.md | e21f797d51235f1144dd60c96469319c09efe37d535228cc5eed3ed5d3f49e41 |
| agents/architecture-designer.agent.md | 19b2acf36cef83ccf06cf9c1d397c923822141c695b1a302430ca05c5b182f25 |
| skills/build-maui-apps/references/source-catalog.md | 6dcc807f77d8dd8b39a14f1c5c74d97bf1436a0f3cc2b25a23bd8fe9c2e0d70a |
| skills/xunit-v2-v3-migration/references/migration-checklist.md | 90d09faa42e82db07d1e793b204768137e06089a6debdc1a1523677023244389 |
| skills/build-maui-apps/references/source-ledger-template.md | cfaedbafa3b0556fff0af17751aba61dec77d9edbfdf84455b0de6dd281575fa |
| skills/csharp-architecture-quality-gate/references/source-catalog.md | 658c6b4e3a4992e18aca4c2152673b150cb2b7c56ffd61ad924316ea4194ab40 |
| skills/domain-design/SKILL.md | 502baa280ec8a8fddf32133e991504a4825f810d3b425d207c1b3cfffc888d15 |
| skills/data-design/SKILL.md | c52c2f14d7c318212bcd07e0106f32468133353716461cb52313b0240c077398 |
| skills/current-test-coverage/references/scripts/invoke-quality-gate.ps1 | 87807e833c2ce56fac78bc4b409e374a5a4654f412e0666c8d7f70127d1a6acb |
| skills/current-test-coverage/references/scripts/invoke-full-solution-coverage.ps1 | 7e469c0d26863583b5bc5f1b12c1e2772c3b24e004e0b8e6df3acc68a9e425f8 |
| skills/current-test-coverage/references/scripts/get-cobertura-coverage-summary.ps1 | 639bd4682b73d8116e4cdaf32cfe21e7265b3063d10cfe76c06e9e44bd297570 |
| skills/current-test-coverage/SKILL.md | 5e692d94dd5393c6500ebef82f2235bc414edfa8cdbe1726199248562e6af833 |
| skills/csharp-testing-quality-gate/references/source-catalog.md | 461608deff048be1124d0edf77b11c9a7a1447250fe79803a167177062eb78f4 |
| skills/csharp-testing-quality-gate/SKILL.md | eff5ca35bc2433d7feba0f594ee61a8afcd39fa787034c2b775a63835828b2a4 |
| skills/csharp-release-quality-gate/references/source-catalog.md | 7c41a61825b6ed6ed72c98df148572202886fd2e02e3dd2845d89edcf1e48ac5 |
| skills/csharp-release-quality-gate/SKILL.md | 71f4ac8caad5d45f85796b0713ea17d49afb731ebd4f2f3b0c44ce796e6c7436 |
| skills/csharp-orchestrator/references/source-catalog.md | 971103160807503e4e92e803f3ab7f49e00da307409cd85aa35ec7e66eada967 |
| skills/csharp-orchestrator/references/csharp-execution-contract-template.md | 70b50a9bef3c5a8f1ccb1fdaaed5be2204e247719494175f2b7ef8964cd3605f |
| skills/csharp-orchestrator/SKILL.md | 48d4d6ca672aee121c2c0793757fc72cfa96573a2d4c787c75a1e547aa46aa86 |
| skills/csharp-language-quality-gate/references/source-catalog.md | 230c52d129d98d2b46fe81515606c730269b508a377111cee7bb4ac85fa45df8 |
| skills/csharp-language-quality-gate/SKILL.md | 9e02144ce43bb9a6ae4f32315206a51b50128222275d99b1a6d4d79a2ec8b596 |
| skills/csharp-data-access-quality-gate/references/source-catalog.md | cf85b26c5b175300ac4768a96a3824972365e57f45e9cff60bcf19f9e1749cfb |
| skills/csharp-data-access-quality-gate/SKILL.md | d5848d5e6dffc10402502bb7e70dad1da2085227683611f2c0d761b1c7e30cc0 |
| skills/csharp-async-quality-gate/references/source-catalog.md | 95d0d1ab0615f5a443a3846fa45404e26e5291519aa0a1192f59d8c42f882ece |
| skills/csharp-async-quality-gate/SKILL.md | 51b864d52b2612eaf13a846482d9b11118afe1f38934dc39788fad165bd1b295 |
| skills/csharp-architecture-quality-gate/SKILL.md | 42dc198fbe1b15801f6bcffe7b95d234c4882621807b79b9626e432c74a7b4b1 |
| skills/xunit-v2-v3-migration/references/source-catalog.md | ce1cce9a24331f66abbc98c1bdff241548d979a29c7f404c2cbac82fa3ad8964 |

## Verification

1. Validate per-asset hashes from manifest: Get-FileHash -Algorithm SHA256 -LiteralPath <asset>
2. Recompute plugin SHA-256 as manifest aggregate digest from canonical <path>:<sha256> lines and compare to Plugin SHA-256.
3. Confirm source commit exists: git cat-file -t 16d627d5eb2b
