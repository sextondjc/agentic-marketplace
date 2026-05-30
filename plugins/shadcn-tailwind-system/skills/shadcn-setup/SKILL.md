---
name: shadcn-setup
description: Use when integrating shadcn/ui into a new or existing project — covering CLI initialization, components.json configuration, framework-specific wiring, path alias setup, and dependency alignment.
---

# shadcn/ui Setup

## Specialization

Provide a repeatable, expert-level workflow for integrating shadcn/ui into any modern web project — covering CLI initialization, `components.json` authoring, framework-specific integration (Next.js, Vite/React, SvelteKit, Astro, Remix, TanStack Start), path alias configuration, and dependency alignment.

This skill covers installation and project wiring. Component design patterns and CVA variants are handled by `shadcn-component-design`. Theming and color token customization is handled by `shadcn-theming`.

## Trigger Conditions

- Adding shadcn/ui to a new or existing project.
- Migrating from a different component library to shadcn/ui.
- Auditing an existing `components.json` for correctness, alias mismatches, or outdated style directives.
- Integrating shadcn/ui with a new framework target.
- Configuring a monorepo shared component package backed by shadcn/ui.
- Updating shadcn CLI or running `shadcn diff` after an upstream component update.

## When Not to Use

- Component pattern design, CVA variants, and Radix primitive wiring (use `shadcn-component-design`).
- CSS variable and theme token customization (use `shadcn-theming`).
- Form patterns with react-hook-form + zod (use `shadcn-forms`).
- Quality gate review of a completed implementation (use `shadcn-quality-gate`).
- Source freshness checks before major CLI or component updates (use `shadcn-source-curation`).

## Inputs

- Target framework and runtime (Next.js App Router, Next.js Pages, Vite + React, SvelteKit, Astro, Remix, TanStack Start).
- TypeScript or JavaScript project.
- Package manager in use (npm, pnpm, yarn, bun).
- Existing CSS architecture if any (global CSS, CSS modules, Tailwind already configured).
- Monorepo or single-repo layout.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Installation record | CLI initialization command, version pinned, peer dependencies verified |
| `components.json` | Schema-valid config with correct `style`, `rsc`, `tsx`, `tailwind`, and `aliases` fields |
| Path alias configuration | `tsconfig.json` `paths` and bundler alias (Vite/Next) aligned with `components.json` `aliases` |
| Tailwind dependency check | TailwindCSS version compatibility confirmed; `@tailwindcss/typography` noted if needed |
| CSS entry point | Base variables `@layer base` block present; CSS variable names match theme configuration |
| First component install record | One component added via `npx shadcn add` and rendered to confirm wiring is complete |
| Framework integration checklist | Framework-specific steps verified (RSC compatibility, SSR rendering, hydration) |
| Readiness summary | Open risks, deferred items, and known version caveats |

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Install shadcn and render one component | Component renders correctly in dev without console errors |
| L2 Practical Setup | Fully configure for a real project | `components.json` correct, aliases resolved, Tailwind aligned, one real component rendered |
| L3 Framework Hardening | Production-ready integration for a specific framework | SSR/RSC compatibility confirmed, hydration clean, bundle impact assessed |
| L4 Expert Standardization | Reusable setup template for cross-project use | Framework-agnostic setup template, monorepo layout documented, CI-verified import resolution |

## Framework Setup Workflows

### Next.js (App Router)

```bash
npx shadcn@latest init
```

Key decisions:
- Set `rsc: true` in `components.json` for server component compatibility.
- Choose `app` alias (`@/`) matching `tsconfig.json` `paths`.
- Verify `tailwind.config.ts` content array includes `./app/**` and `./components/**`.
- Confirm `globals.css` contains `@tailwind` directives and the `@layer base` CSS variable block.

### Vite + React

```bash
npx shadcn@latest init
```

Key decisions:
- Configure Vite path alias in `vite.config.ts`:
  ```ts
  resolve: { alias: { "@": path.resolve(__dirname, "./src") } }
  ```
- Mirror alias in `tsconfig.json` paths.
- Set `rsc: false` in `components.json`.

### SvelteKit

Follow framework guide at `https://ui.shadcn.com/docs/installation/sveltekit`.

Key decisions:
- Use `shadcn-svelte` (community port) — confirm it is the intended target, not the React version.
- Path alias `$lib` is canonical in SvelteKit; set `aliases.components` to `$lib/components/ui`.

### Astro

Follow framework guide at `https://ui.shadcn.com/docs/installation/astro`.

Key decisions:
- Add React integration (`npx astro add react`) before shadcn init.
- Set `rsc: false`.
- Confirm `tsconfig.json` includes `"baseUrl": "."` for alias resolution.

### Remix

Follow framework guide at `https://ui.shadcn.com/docs/installation/remix`.

Key decisions:
- Confirm Vite-based Remix (v2+ with Vite plugin); classic Remix requires manual setup.
- Path alias via `vite.config.ts` and `tsconfig.json`.

## components.json Reference

```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "app/globals.css",
    "baseColor": "slate",
    "cssVariables": true
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  }
}
```

- `style`: `default` or `new-york` — determines component visual style.
- `cssVariables: true` is required for runtime theming support.
- `aliases` must resolve correctly in both `tsconfig.json` and the bundler.

## Monorepo Setup

1. Create a shared package (e.g., `packages/ui`) with its own `package.json` and `components.json`.
2. Run `npx shadcn@latest init` in `packages/ui`.
3. Set `aliases` to point to the shared package's source directories.
4. Export components from `packages/ui/src/index.ts`.
5. Consuming apps import from the shared package, not directly from `components/ui`.
6. Each consuming app's Tailwind config must include the shared package's source paths in `content`.

## Keeping Components Up To Date

- Run `npx shadcn diff` to detect divergence between local components and upstream.
- Use `npx shadcn diff <component>` for targeted review before accepting changes.
- Record the evaluation date and component version in the source catalog (`shadcn-source-curation`).

## Pragmatic Stop Rule

Stop when `components.json` is valid, one component renders correctly, path aliases resolve without error, and the framework integration checklist passes. Open items must be recorded in the readiness summary.
