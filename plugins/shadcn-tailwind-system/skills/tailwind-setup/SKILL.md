---
name: tailwind-setup
description: Use when configuring TailwindCSS in a project for the first time, migrating from v3 to v4, or auditing an existing Tailwind build pipeline for correctness and security.
---

# TailwindCSS Setup

## Specialization

Provide a repeatable, expert-level workflow for integrating TailwindCSS into any modern web project — covering initial configuration, v3-to-v4 migration, framework-specific integration, build-pipeline wiring, and security alignment.

This skill covers setup and configuration. Component design patterns are handled by `tailwind-component-design`.

## Trigger Conditions

- Adding TailwindCSS to a new or existing project.
- Migrating a project from TailwindCSS v3 (JS config) to v4 (CSS-first config).
- Auditing an existing Tailwind build pipeline for content-scanning gaps, missing purge config, or CSP conflicts.
- Integrating Tailwind with a new framework (SvelteKit, Next.js, Vue, Nuxt, Astro, Blazor).
- Adding or updating Prettier class-ordering enforcement.

## When Not to Use

- Component pattern design and utility composition (use `tailwind-component-design`).
- Quality gate review of a completed Tailwind implementation (use `tailwind-quality-gate`).
- Source freshness checks before major version adoption (use `tailwind-source-curation`).

## Inputs

- Target framework and runtime (SvelteKit, Next.js, Vue, Astro, Blazor, or custom).
- TailwindCSS version in use or target version.
- Existing CSS architecture, if any (PostCSS chain, CSS modules, preprocessors).
- CSP and build constraints.
- Evaluation date in ISO format (`YYYY-MM-DD`) for source freshness.

## Required Outputs

| Output | Description |
|---|---|
| Installation record | Package manager command, version pinned, and peer dependency check |
| Configuration file | `tailwind.config.js` (v3) or `@import "tailwindcss"` + `@theme` block (v4) with content paths correct |
| Build-pipeline wiring | PostCSS or Vite plugin confirmed; CSS entry point with `@tailwind` directives (v3) or `@import` (v4) |
| Content-scan verification | All template and component paths included; no unused-class leakage risk |
| Prettier plugin config | Class-ordering plugin installed and `.prettierrc` updated |
| CSP alignment note | `unsafe-inline` posture evaluated; CDN usage prohibition documented if applicable |
| Framework integration checklist | Framework-specific steps completed and verified |
| Readiness summary | Open risks, deferred items, and known version caveats |

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Install Tailwind and render one styled element | Styles render correctly in dev and build output includes purged CSS |
| L2 Practical Setup | Fully configure for a real project | Config is correct, all template paths scanned, Prettier plugin active, build verified |
| L3 Migration Hardening | v3 → v4 migration complete | All deprecated config patterns removed, CSS-first config adopted, visual regression tested |
| L4 Expert Standardization | Reusable setup template for cross-project use | Framework-agnostic setup template, CI build-size check, CSP policy, and source-catalog entry produced |

## TailwindCSS v4 Setup Workflow

For new projects targeting v4:

1. Install: `npm install tailwindcss @tailwindcss/vite` (Vite) or `npm install tailwindcss @tailwindcss/postcss` (PostCSS).
2. Create CSS entry point with `@import "tailwindcss"`.
3. Define design tokens in `@theme {}` block within the CSS entry; do not use `tailwind.config.js`.
4. Add Vite plugin (`@tailwindcss/vite`) to `vite.config.*` or PostCSS plugin to `postcss.config.*`.
5. Verify content scanning: v4 detects template files automatically; confirm paths are correct for non-standard locations.
6. Install Prettier plugin: `npm install -D prettier-plugin-tailwindcss` and add to `.prettierrc`.
7. Run a production build and confirm CSS output is purged (size < 50 KB for typical app).
8. Evaluate CSP: avoid Tailwind CDN (`cdn.tailwindcss.com`) in production; use build output only.

## TailwindCSS v3 → v4 Migration Workflow

1. Run `npx @tailwindcss/upgrade` for automated migration.
2. Review breaking changes: JS config → CSS `@theme`, removed utilities, changed default values.
3. Replace `tailwind.config.js` theme extensions with CSS custom properties in `@theme {}`.
4. Replace `@tailwind base/components/utilities` with `@import "tailwindcss"`.
5. Update PostCSS/Vite plugins from v3 to v4 packages.
6. Run visual regression check on key pages/components.
7. Run production build and confirm bundle size is equivalent or smaller.
8. Update Prettier plugin to latest compatible version.

## Framework Integration Matrix

| Framework | Plugin / Method | Key Configuration Note |
|---|---|---|
| Vite (any) | `@tailwindcss/vite` | Add to `plugins[]` in `vite.config.*`; no PostCSS config needed |
| Next.js | `@tailwindcss/postcss` | Add to `postcss.config.mjs`; ensure `content` covers `app/**` and `pages/**` |
| SvelteKit | `@tailwindcss/vite` | Add to `vite.config.ts` plugins; CSS entry in `src/app.css` |
| Nuxt | `@nuxtjs/tailwindcss` module | Configure in `nuxt.config.ts`; module handles PostCSS automatically |
| Astro | `@astrojs/tailwind` integration | Add to `astro.config.mjs`; co-exists with Astro CSS scoping |
| Blazor (WASM/Server) | `npm` + PostCSS in `wwwroot` | Add PostCSS chain to `bundleconfig.json` or use Vite via JS interop tooling |

## Content Scanning Checklist

- [ ] All component file extensions included (`.html`, `.jsx`, `.tsx`, `.vue`, `.svelte`, `.astro`, `.razor`).
- [ ] Dynamic class name patterns (string concatenation) reviewed; safelisted or refactored to full class names.
- [ ] Generated files excluded from content paths to avoid false-positive class retention.
- [ ] Production build CSS output verified to be purged (no development bloat).

## Security Configuration Checklist

- [ ] Tailwind CDN (`cdn.tailwindcss.com`) is not used in production deployments.
- [ ] If CDN is used in development/prototyping, it is removed before staging or production promotion.
- [ ] Content Security Policy does not require `unsafe-inline` solely for Tailwind; build-output CSS avoids inline style injection.
- [ ] No Tailwind configuration reads from untrusted input at build or runtime.
- [ ] Third-party Tailwind plugins are pinned to exact versions and reviewed before adoption.

## Done Criteria

- [ ] TailwindCSS installed and version pinned.
- [ ] Config file or CSS `@theme` block is correct and matches the target version model.
- [ ] Build pipeline confirmed: PostCSS or Vite plugin active, CSS entry point correct.
- [ ] Content scan covers all template paths; production build produces purged output.
- [ ] Prettier plugin installed and class ordering enforced.
- [ ] CSP alignment note recorded.
- [ ] Framework integration checklist completed.
- [ ] Readiness summary written with open risks and deferred items.

## References

- [Source Catalog](./references/source-catalog.md)
