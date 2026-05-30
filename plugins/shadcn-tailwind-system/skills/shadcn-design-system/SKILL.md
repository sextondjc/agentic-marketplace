---
name: shadcn-design-system
description: Use when a shared shadcn/ui component library is maintained across multiple applications or a monorepo — covering component package architecture, token versioning, breaking-change governance, downstream consumption contracts, and cross-app visual consistency.
---

# shadcn/ui Design System

## Specialization

Provide expert-level governance for a shared shadcn/ui component library used across multiple applications or a monorepo — covering component package architecture, CSS variable token versioning, breaking-change management, downstream consumption contracts, registry override policy, and cross-app visual consistency audits.

This skill is specialized for multi-app or monorepo design system governance. Single-application component work is handled by `shadcn-component-design`. Single-application token work is handled by `shadcn-theming`. CI enforcement is handled by `shadcn-ci-integration`.

**Design language model**: shadcn/ui semantic tokens are the authoritative layer. Tailwind utility classes may extend the surface for layout and non-component concerns but must consume shadcn CSS variables for color, spacing, and radius. Cross-app token consistency is enforced through the shared CSS variable contract defined here.

## Trigger Conditions

- A team maintains a shared shadcn/ui component package consumed by two or more applications.
- A monorepo has multiple apps and needs a single source of truth for shadcn components and tokens.
- A component or token change in the shared package must be evaluated for downstream breaking impact before release.
- Visual consistency drift between apps is identified and needs systematic correction.
- A new shared component library is being extracted from an existing app.
- Component versioning and deprecation policy does not exist or is informal.
- Upstream shadcn registry updates must be evaluated for adoption across the shared package.

## When Not to Use

- Single-application component design (use `shadcn-component-design`).
- Single-application token design (use `shadcn-theming`).
- Project setup for a single app (use `shadcn-setup`).
- Quality gate review for one application's release (use `shadcn-quality-gate`).
- CI enforcement automation (use `shadcn-ci-integration`).

## Inputs

- Monorepo layout (Turborepo, Nx, pnpm workspaces, or manual).
- Number and type of consuming applications.
- Current component and token inventory if migrating an existing system.
- Versioning strategy (semver package versioning vs. workspace-pinned vs. registry-diff tracking).
- Breaking-change tolerance and rollout constraints.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Package architecture decision | Shared package layout, export strategy, and consuming app integration pattern |
| Component inventory | All shared components with ownership, stability tier, and deprecation status |
| Token contract | Canonical CSS variable names, semantic roles, versioning rules, and extension policy |
| Breaking-change policy | What constitutes a breaking change; approval and notification requirements before shipping |
| Downstream consumption contract | How consuming apps import, override, and extend shared components without forking them |
| Registry update policy | How upstream shadcn registry updates are evaluated, accepted, or deferred for the shared package |
| Visual consistency audit checklist | Cross-app checks: token parity, dark mode, component variant alignment |
| Readiness summary | Open items, migration risks, and deferred governance decisions |

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Extract one component into a shared package | Component resolves correctly in two consuming apps |
| L2 Practical Delivery | Shared package with core components and token contract | Token contract documented; consuming apps import without forking |
| L3 Governance | Breaking-change policy, deprecation workflow, and registry update process | Policy exists and has been applied to at least one real change |
| L4 Expert Standardization | Full cross-project design system operating model | Versioning, update policy, consistency audit, and CI enforcement template documented |

## Package Architecture

### Recommended Monorepo Layout

```
packages/
  ui/
    components/
      ui/              ← shadcn-generated components (do not edit directly)
      custom/          ← project-specific extensions and compositions
    lib/
      utils.ts         ← cn() helper
    styles/
      globals.css      ← CSS variable declarations (@layer base)
    index.ts           ← public export surface
    package.json
    components.json    ← shadcn config for this package
    tsconfig.json
apps/
  web/
  admin/
  marketing/
```

Key rules:
- `components/ui/` contains only shadcn-generated files. Direct edits are owned by the team and tracked in the registry override policy.
- `components/custom/` contains project compositions built on top of shadcn primitives.
- `index.ts` is the only import surface for consuming apps — never import from internal paths.
- `globals.css` in the shared package defines the canonical CSS variable contract.

### Consuming App Integration

```ts
// Consuming app: import only from the shared package root
import { Button, Dialog, FormField } from "@company/ui"

// Not allowed: direct internal imports
import { Button } from "@company/ui/components/ui/button" // ❌
```

Each consuming app's `tailwind.config` must include the shared package source in `content`:

```ts
content: [
  "./src/**/*.{ts,tsx}",
  "../../packages/ui/components/**/*.{ts,tsx}", // shared package
]
```

Each consuming app imports the shared `globals.css` once at the root layout — not per component.

## Component Stability Tiers

| Tier | Definition | Change policy |
|---|---|---|
| Stable | Production-proven; used across all apps | Breaking changes require major version bump and migration guide |
| Beta | In use in one app; API may change | Breaking changes require minor version bump and changelog entry |
| Experimental | Proof-of-concept; not in production | Breaking changes allowed with changelog entry only |
| Deprecated | Replaced; scheduled for removal | Removal date published; consuming apps given two release cycles to migrate |

## Token Versioning Contract

CSS variable names are the public API for tokens. Rules:

- Adding new tokens is always non-breaking.
- Renaming a token is a breaking change — provide an alias for one release cycle before removing the old name.
- Changing a token's value without renaming is non-breaking but must be documented in the changelog with a visual diff.
- Removing a token requires: deprecation notice for one release cycle, consuming app audit, and a major version bump.

Token extension by consuming apps:

```css
/* Consuming app globals.css — additive extension, not override */
:root {
  --color-product-highlight: 142 76% 36%; /* app-specific token */
}
```

Consuming apps must not override shared package tokens in their own CSS. Overrides require a documented exception approved by the design system owner.

## Registry Update Policy

When an upstream shadcn registry update is available (`npx shadcn diff`):

1. **Evaluate**: Review the diff for API changes, accessibility improvements, and styling changes.
2. **Classify**: Tag the update as non-breaking, additive, or breaking relative to the shared package API.
3. **Test**: Apply to a feature branch and run all consuming apps against it.
4. **Accept or defer**: Accept with changelog entry; defer with a tracked reason and re-evaluation date.
5. **Notify**: Communicate breaking changes to consuming app owners before merging.

Intentional divergence from the upstream registry (local modifications to `components/ui/` files) must be documented in `shadcn-overrides.md` at the package root with:
- Component name
- Reason for divergence
- Owner
- Re-evaluation date

## Visual Consistency Audit

Run before any major design system release:

| Check | Pass Criterion |
|---|---|
| Token parity | All apps consume the same CSS variable values; no unilateral token overrides |
| Dark mode coverage | All shared tokens have `.dark` counterparts; all apps render correctly in dark mode |
| Component variant alignment | All apps use the same variant names; no app-local variant forks of shared components |
| Typography scale | Shared font and size tokens used consistently; no app-local font stack divergence |
| Spacing scale | Shared spacing tokens used for component internals; Tailwind utilities may supplement for layout |
| Icon consistency | Icon library (Lucide React) version pinned in shared package; consuming apps do not override |

## Pragmatic Stop Rule

Stop when the package architecture is decided, the token contract is documented with versioning rules, the breaking-change policy is defined, and the consuming app integration contract is complete. Visual consistency audit and registry update policy are required before the L3 gate. Open items must be in the readiness summary.
