---
name: tailwind-design-system
description: Use when a shared TailwindCSS design token package is maintained across multiple applications or a monorepo — covering token versioning, breaking-change governance, downstream consumption patterns, and cross-app visual consistency.
---

# TailwindCSS Design System

## Specialization

Provide expert-level governance for a shared TailwindCSS design token system used across multiple applications or a monorepo — covering token package architecture, semantic naming conventions, versioning policy, breaking-change management, downstream consumption patterns, and cross-app visual consistency audits.

This skill is specialized for multi-app or monorepo token governance. Single-application token work is handled by `tailwind-component-design`. Build pipeline setup is handled by `tailwind-setup`.

## Trigger Conditions

- A team maintains a shared Tailwind token package consumed by two or more applications.
- A monorepo has multiple apps and needs a single source of truth for design tokens.
- A token change in one app must be evaluated for downstream breaking impact before release.
- Visual consistency drift between apps is identified and needs systematic correction.
- A new shared component library is being extracted from an existing app.
- Token versioning and deprecation policy does not exist or is informal.

## When Not to Use

- Single-application token design (use `tailwind-component-design`).
- Project setup and build pipeline (use `tailwind-setup`).
- Quality gate review for one application's release (use `tailwind-quality-gate`).
- CI enforcement for a single application (use `tailwind-ci-integration`).

## Inputs

- Repository topology: monorepo or polyrepo; number of consuming applications.
- Current token inventory and any existing design token package structure.
- Design tool artifacts (Figma tokens, Style Dictionary config, or similar) if available.
- Breaking-change policy requirements and release cadence.
- Framework mix across consumers (React, Vue, Svelte, Blazor, etc.).
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Token package architecture | Directory structure, export format, and package naming for the shared token package |
| Semantic token taxonomy | Canonical role hierarchy: primitive → semantic → component-specific |
| `@theme` token map | CSS custom properties for all semantic roles, mapped to primitives |
| Versioning and deprecation policy | Semver policy for token packages; deprecation notice and removal timeline |
| Breaking-change impact matrix | Which consuming apps are affected by a proposed token change |
| Downstream consumption guide | How consuming apps import and extend the shared token package |
| Cross-app consistency audit template | Checklist for verifying visual consistency across consumers |
| Readiness summary | Open risks, migration debt, and deferred token work |

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Extract a shared token set from one app | Token package exists; one other app imports it without duplication |
| L2 Practical Governance | Token package serves two or more apps with explicit versioning | Semver policy documented; all apps on a declared token version |
| L3 Breaking-Change Safety | Token changes are gated by impact matrix before release | No token promoted to consumers without impact matrix review |
| L4 Expert Standardization | Full design system governance model for cross-org reuse | Primitive/semantic/component taxonomy, CI token drift detection, and changelog automation in place |

## Token Architecture

### Three-Layer Taxonomy

```
Primitive tokens   →   Semantic tokens   →   Component tokens
──────────────────     ─────────────────     ────────────────────
Raw values only        Role-bound aliases    Per-component overrides
(not used in UI)       (used in all UI)      (scoped, not shared)

--color-blue-500       --color-brand-primary    --button-bg
--color-gray-100       --color-surface-base     --input-border
--font-inter           --font-body              (rare; prefer semantic)
--spacing-4            --spacing-page
```

**Rules:**
- UI code and component files reference **semantic** tokens only; never primitive names.
- Primitive tokens are defined once in the shared package and never overridden by consumers.
- Component tokens are per-component and never exported to the shared package.

### Package Structure

```
packages/
  tailwind-tokens/
    src/
      primitives.css        ← raw values; not for direct UI use
      semantic.css          ← role-bound @theme tokens
      dark.css              ← dark-mode semantic overrides
    index.css               ← @import all three layers
    package.json            ← versioned npm package
```

Consumers import via:

```css
@import "@org/tailwind-tokens";
@import "tailwindcss";
```

### Framework Consumption Patterns

| Framework | Import Approach | Notes |
|---|---|---|
| Vite-based (SvelteKit, Vue, React) | `@import "@org/tailwind-tokens"` in CSS entry | Token package resolves via PostCSS/Vite |
| Next.js | Import in `app/globals.css` or `pages/_app.css` | Must be listed before `@import "tailwindcss"` |
| Astro | Import in `src/styles/global.css` referenced in layout | |
| Blazor | Copy token CSS to `wwwroot`; automate via build step | Package cannot be imported natively; use a sync script |
| Non-Tailwind consumers | Expose primitives and semantics as plain CSS custom properties | All tokens are CSS variables; framework-agnostic |

## Versioning and Deprecation Policy

### Semver for Token Packages

| Change Type | Version Bump | Examples |
|---|---|---|
| New token added | Patch | Adding `--color-status-warning` |
| Semantic token value changed (visual change) | **Minor** | Changing `--color-brand-primary` hue |
| Primitive value renamed or removed | **Major** | Renaming `--color-blue-500` to `--color-cobalt-500` |
| Semantic token renamed or removed | **Major** | Removing `--color-accent`; replacing with `--color-brand-secondary` |
| Dark mode override added | Patch | New dark-mode alias for existing token |

### Deprecation Timeline

1. Mark token as deprecated in a **patch** release: add `/* @deprecated: use --replacement-token instead */` comment.
2. Maintain deprecated token for a minimum of **two minor releases** (or 30 days, whichever is longer).
3. Remove deprecated token in the next **major** release.
4. Publish migration guide entry for every removed token.

## Breaking-Change Impact Matrix Template

Used before any Major or Minor release that changes token values:

| Token | Change Type | Consuming App | Visual Impact | Migration Required | Owner |
|---|---|---|---|---|---|
| `--color-brand-primary` | Value changed | `app-web` | Button backgrounds, links, focus rings | Update dark-mode test screenshots | Frontend lead |
| `--color-brand-primary` | Value changed | `app-mobile` | N/A (MAUI; tokens not consumed) | None | — |
| `--font-body` | New value | `app-web` | Body text rendering change | Visual regression run | Frontend lead |

## Cross-App Consistency Audit Checklist

Run before any major token release and at a minimum quarterly:

- [ ] All consuming apps are on the same declared token package version.
- [ ] No app defines a local primitive that shadows a shared token.
- [ ] Semantic token names are consistent across apps; no local aliases with different roles.
- [ ] Dark mode renders identically across apps for shared surfaces (background, text, border).
- [ ] Focus ring color is consistently `--color-brand-primary` or the declared focus token across all interactive elements.
- [ ] Status colors (`success`, `error`, `warning`, `info`) are semantically consistent; same meaning in all apps.
- [ ] Typography scale uses shared `--font-*` and `--leading-*` tokens; no per-app overrides of body or heading size.

## CI Token Drift Detection

Add to CI pipeline to catch local token overrides:

```yaml
- name: Check for local primitive token overrides
  run: |
    # Fail if any app CSS file defines a token that starts with --color- or --font- not in the shared package
    if grep -r "^\s*--color-\|^\s*--font-\|^\s*--spacing-" src/ | grep -v "@theme" | grep -v "node_modules"; then
      echo "::error::Local primitive token definition detected. Use semantic tokens from the shared package."
      exit 1
    fi
```

Adjust grep patterns to match your organization's token prefix conventions.

## Done Criteria

- [ ] Token package architecture documented with three-layer taxonomy.
- [ ] `@theme` block covers all semantic roles (brand, surface, border, text, status, typography, spacing).
- [ ] Versioning and deprecation policy is explicit with timeline and semver rules.
- [ ] Breaking-change impact matrix template is available and used for every Minor/Major release.
- [ ] All consuming apps document their import pattern and declared token version.
- [ ] Cross-app consistency audit checklist completed.
- [ ] CI token drift detection step added to at least one pipeline.
- [ ] Readiness summary written with open migration debt and deferred items.

## References

- [Source Catalog](./references/source-catalog.md)
