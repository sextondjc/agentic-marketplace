# Source Catalog — sveltekit-state-management

Evaluation date: 2026-05-06

| Source | URL | Relevance | Authority | Freshness | Actionability | Status |
|---|---|---|---|---|---|---|
| SvelteKit `$app/state` docs | https://svelte.dev/docs/kit/$app-state | `page`, `navigating`, `updated` runes API | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to all state access patterns | Active |
| SvelteKit `$app/stores` docs | https://svelte.dev/docs/kit/$app-stores | Legacy Svelte 4 store API | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to migration and compatibility guidance | Active |
| SvelteKit `$app/navigation` docs | https://svelte.dev/docs/kit/$app-navigation | `afterNavigate`, `beforeNavigate`, `goto` | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to lifecycle hook guidance | Active |
| SvelteKit `$app/environment` docs | https://svelte.dev/docs/kit/$app-environment | `browser`, `dev`, `building` guards | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to SSR safety guidance | Active |
| SvelteKit Types — `App.PageState` | https://svelte.dev/docs/kit/types | `App.PageState` interface declaration | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to type-safe state declaration | Active |
| SvelteKit LLM documentation | https://svelte.dev/docs/kit/llms.txt | Full SvelteKit API, auto-synced, agent-optimised | Official SvelteKit docs (svelte.dev) | Auto-synced with docs | Machine-readable grounding source | Active |

## Freshness Policy

Re-evaluate sources when SvelteKit releases a new major or minor version. Re-check Svelte 4 deprecation timeline; update migration guidance when `$app/stores` is formally deprecated.
