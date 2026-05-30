# Source Catalog — sveltekit-observability

Evaluation date: 2026-05-06

| Source | URL | Relevance | Authority | Freshness | Actionability | Status |
|---|---|---|---|---|---|---|
| SvelteKit Observability docs | https://svelte.dev/docs/kit/observability | `instrumentation.server.ts`, OpenTelemetry integration, `Server-Timing` | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to all workflow steps | Active |
| OpenTelemetry JS SDK docs | https://opentelemetry.io/docs/languages/js/ | `NodeSDK`, `BatchSpanProcessor`, `OtlpHttpExporter`, context propagation | OpenTelemetry official docs | Reviewed 2026-05-06 | Direct — maps to SDK configuration workflow | Active |
| SvelteKit Hooks docs | https://svelte.dev/docs/kit/hooks | `handle`, `resolve`, hook sequencing | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to `Server-Timing` and root span workflow | Active |
| "Introducing integrated observability in SvelteKit" blog post | https://svelte.dev/blog/sveltekit-observability | Feature announcement, `instrumentation.server.ts` design rationale | Official Svelte blog (svelte.dev) | Published 2026-01, reviewed 2026-05-06 | Contextual — design background | Active |
| SvelteKit LLM documentation | https://svelte.dev/docs/kit/llms.txt | Full SvelteKit API, auto-synced, agent-optimised | Official SvelteKit docs (svelte.dev) | Auto-synced with docs | Machine-readable grounding source | Active |

## Freshness Policy

Re-evaluate when SvelteKit or the OpenTelemetry JS SDK releases a new major version. The `instrumentation.server.ts` API is relatively new (2025/2026); monitor for breaking changes in minor releases. Update within 30 days of any relevant release.
