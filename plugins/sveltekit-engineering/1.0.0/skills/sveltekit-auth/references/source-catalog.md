# Source Catalog — sveltekit-auth

Evaluation date: 2026-05-06

| Source | URL | Relevance | Authority | Freshness | Actionability | Status |
|---|---|---|---|---|---|---|
| SvelteKit Auth docs | https://svelte.dev/docs/kit/auth | Cookie sessions, OAuth, JWT, Lucia, Auth.js patterns | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to all workflow steps | Active |
| SvelteKit Hooks docs | https://svelte.dev/docs/kit/hooks | `handle` hook, `event.locals`, `sequence()` | Official SvelteKit docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to auth middleware workflow | Active |
| Auth.js SvelteKit adapter | https://authjs.dev/getting-started/frameworks/sveltekit | `SvelteKitAuth`, `auth()`, provider setup | Auth.js official docs | Reviewed 2026-05-06 | Direct — maps to OAuth/OIDC integration | Active |
| `sv add auth` CLI add-on | https://svelte.dev/docs/cli/sv-add | CLI scaffolding for authentication | Official Svelte CLI docs (svelte.dev) | Reviewed 2026-05-06 | Direct — maps to scaffolding guidance | Active |
| SvelteKit LLM documentation | https://svelte.dev/docs/kit/llms.txt | Full SvelteKit API, auto-synced, agent-optimised | Official SvelteKit docs (svelte.dev) | Auto-synced with docs | Machine-readable grounding source | Active |

## Freshness Policy

Re-evaluate when Auth.js releases a new major version or when SvelteKit auth docs are updated. Monitor the `sv add auth` add-on changelog for scaffolding changes. Update within 30 days of any change affecting session or OAuth patterns.
