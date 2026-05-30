---
name: shadcn-registry
description: Use when authoring, hosting, or consuming a custom shadcn/ui component registry — covering registry.json schema, component item types, CLI resolution, hosting strategy, and cross-project distribution for org-owned components.
---

# shadcn/ui Custom Registry

## Specialization

Provide expert-level guidance for designing and operating a custom shadcn/ui component registry — covering the `registry.json` schema, component item type taxonomy, CLI resolution and `npx shadcn add <url>` consumption, hosting strategies (static file host, npm package, or monorepo local), dependency declaration, and cross-project distribution patterns for org-owned components.

This skill is specialized for registry authoring and hosting. Component design and CVA variant patterns are handled by `shadcn-component-design`. Shared package governance and monorepo architecture are handled by `shadcn-design-system`. CI drift detection against the upstream shadcn registry is handled by `shadcn-ci-integration`.

## Trigger Conditions

- A team wants to distribute org-owned components using the same `npx shadcn add` CLI UX as upstream shadcn components.
- A monorepo needs a private registry so downstream apps pull components with pinned deps and style contracts.
- Components built on Radix primitives need to be shareable across projects without a published npm package per component.
- An existing shared component library should be migrated from direct file copying to registry-based distribution.
- Registry items need dependency declarations so the CLI can auto-install required npm packages alongside component files.
- A custom registry must co-exist with the upstream shadcn registry without collision.

## When Not to Use

- Component authoring without registry concerns (use `shadcn-component-design`).
- Monorepo shared package architecture without registry distribution (use `shadcn-design-system`).
- CI enforcement of upstream component freshness (use `shadcn-ci-integration`).
- Initial project wiring and `components.json` setup (use `shadcn-setup`).

## Inputs

- Component inventory: names, file paths, and peer dependencies.
- Distribution target: static URL, npm package, or monorepo local resolution.
- Consumer projects and their frameworks (Next.js App Router, Vite + React, SvelteKit).
- Whether the registry will co-exist with upstream `registry.shadcn.com`.
- Hosting infrastructure: GitHub Pages, Vercel, Cloudflare Pages, or private npm registry.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| `registry.json` | Complete registry index with all component items, types, and metadata |
| Component item files | Per-component `registry/<name>.json` with `files`, `dependencies`, `devDependencies`, `registryDependencies`, and `cssVars` |
| Hosting configuration | Static host or npm package setup so the registry URL resolves correctly |
| `components.json` consumer config | `registryUrl` entry pointing to the custom registry |
| CLI consumption instructions | `npx shadcn add <registry-url>/<component>` invocation pattern |
| Co-existence contract | How custom and upstream registries are referenced together without collision |
| Versioning strategy | How component versions are managed and communicated to consumers |
| Open items | Known gaps, deferred components, and platform constraints |

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | One component published to a custom registry and added via CLI | `npx shadcn add <url>` resolves, files are written, and deps install |
| L2 Practical Delivery | Full registry with multiple components, deps, and a hosted URL | All components resolvable by CLI; deps declared; hosting live |
| L3 Advanced Patterns | Versioning, co-existence with upstream, and monorepo local resolution | Pinned versions; upstream and custom registries co-exist; no collision |
| L4 Expert Standardization | Reusable cross-project registry operating model | Registry schema template, hosting runbook, consumer onboarding guide, and update policy documented |

## Registry Schema Reference

### `registry.json` — Top-Level Index

```json
{
  "$schema": "https://ui.shadcn.com/schema/registry.json",
  "name": "acme-ui",
  "homepage": "https://ui.acme.com",
  "items": [
    {
      "name": "data-card",
      "type": "registry:component",
      "title": "Data Card",
      "description": "A card component with a header metric, trend indicator, and sparkline.",
      "files": [
        {
          "path": "registry/data-card/data-card.tsx",
          "type": "registry:component"
        }
      ],
      "dependencies": ["recharts"],
      "registryDependencies": ["card", "badge"],
      "tags": ["display", "metrics"]
    }
  ]
}
```

**Key fields:**

| Field | Required | Description |
|---|---|---|
| `name` | Yes | Registry identifier; used in CLI resolution |
| `homepage` | No | URL shown in CLI output |
| `items` | Yes | Array of registry item descriptors |

### Registry Item Types

| Type | Usage |
|---|---|
| `registry:component` | A React component (`.tsx`) |
| `registry:ui` | A shadcn ui primitive (similar to upstream `components/ui/`) |
| `registry:hook` | A React hook (`.ts`) |
| `registry:lib` | A utility module (`.ts`) |
| `registry:block` | A composite page section or feature block |
| `registry:style` | CSS-only item (no `.tsx`); adds CSS variables or global styles |
| `registry:theme` | A complete theme definition with CSS variable overrides |
| `registry:page` | A full page component |

### Per-Component Item File

Each component can have its own resolution file at `registry/<name>.json` (referenced by the registry index or directly via URL):

```json
{
  "$schema": "https://ui.shadcn.com/schema/registry-item.json",
  "name": "data-card",
  "type": "registry:component",
  "title": "Data Card",
  "description": "A card component with a header metric, trend indicator, and sparkline.",
  "files": [
    {
      "path": "registry/data-card/data-card.tsx",
      "type": "registry:component",
      "target": "components/ui/data-card.tsx"
    },
    {
      "path": "registry/data-card/use-sparkline.ts",
      "type": "registry:hook",
      "target": "hooks/use-sparkline.ts"
    }
  ],
  "dependencies": ["recharts"],
  "devDependencies": [],
  "registryDependencies": ["card", "badge"],
  "cssVars": {
    "light": {
      "--chart-trend-positive": "142 76% 36%",
      "--chart-trend-negative": "0 84% 60%"
    },
    "dark": {
      "--chart-trend-positive": "142 76% 46%",
      "--chart-trend-negative": "0 84% 70%"
    }
  },
  "tailwind": {
    "config": {}
  }
}
```

**Key fields:**

| Field | Description |
|---|---|
| `files[].path` | Path within the registry source repo |
| `files[].type` | Item type for the individual file |
| `files[].target` | Where the CLI writes the file in the consumer project (relative to project root) |
| `dependencies` | npm packages the CLI installs alongside the component |
| `devDependencies` | dev-only npm packages |
| `registryDependencies` | Other shadcn components this item depends on — resolved from upstream or the same registry |
| `cssVars` | CSS variable additions written to the consumer's `globals.css` |

---

## Hosting Strategies

### Strategy 1: Static File Host (recommended for most teams)

Host `registry.json` and per-component JSON files as static files. Any static host works: GitHub Pages, Vercel, Cloudflare Pages, Netlify.

```
https://ui.acme.com/registry.json
https://ui.acme.com/registry/data-card.json
```

**GitHub Pages example:**
```yaml
# .github/workflows/publish-registry.yml
name: Publish Registry
on:
  push:
    branches: [main]
    paths: ["registry/**"]
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./registry
```

The registry JSON files live in `registry/` in the source repo and are served from the GitHub Pages root.

---

### Strategy 2: npm Package (for private/gated distribution)

Publish a package where `registry.json` and item files are included. Consumers reference the local file path or an `npx`-based resolver.

```json
// package.json
{
  "name": "@acme/ui-registry",
  "version": "1.2.0",
  "files": ["registry/**"]
}
```

Consumer installs:
```bash
npm install --save-dev @acme/ui-registry
npx shadcn add node_modules/@acme/ui-registry/registry/data-card.json
```

**Trade-off:** Requires consumers to install the package before running the CLI. Better for gated/enterprise use.

---

### Strategy 3: Monorepo Local Resolution

For monorepos, reference registry items by local file path directly. No hosting required.

```bash
# From an app package in the monorepo
npx shadcn add ../../packages/ui/registry/data-card.json
```

Or configure in `components.json`:
```json
{
  "registries": {
    "acme": {
      "url": "../../packages/ui/registry"
    }
  }
}
```

---

## Consumer Configuration

Add the custom registry URL to the consuming project's `components.json`:

```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "new-york",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "app/globals.css",
    "baseColor": "neutral",
    "cssVariables": true
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "hooks": "@/hooks",
    "lib": "@/lib"
  },
  "registries": {
    "acme": {
      "url": "https://ui.acme.com"
    }
  }
}
```

CLI usage with a named registry:
```bash
npx shadcn add acme/data-card
```

Or directly via URL (no `components.json` entry required):
```bash
npx shadcn add https://ui.acme.com/registry/data-card.json
```

---

## Co-Existence with Upstream Registry

Custom registry items can declare `registryDependencies` that reference upstream shadcn components by name (e.g., `"card"`, `"badge"`). The CLI resolves these from `registry.shadcn.com` automatically.

**Collision avoidance rules:**
1. Never use the same `name` as an upstream shadcn component in your registry unless you intentionally want to override it.
2. Use an org prefix for custom component names when collision risk exists: `acme-data-card` instead of `data-card`.
3. Custom `cssVars` from registry items are merged into `globals.css` — avoid redefining upstream token names with different values.

---

## Versioning Strategy

The shadcn registry schema has no native version field on items. Use these conventions:

| Approach | When to Use |
|---|---|
| **SemVer on registry host URL** — `https://ui.acme.com/v2/registry.json` | Breaking changes; forces consumer opt-in |
| **`version` field in item JSON (custom extension)** | Informational; CLI ignores but tooling can read |
| **Git tags on registry source repo** | Tie registry state to a release tag for auditing |
| **Changelog file in registry root** | Human-readable history; link from `homepage` in `registry.json` |

**Breaking change definition for registry items:**
- Removing a file from `files[]` — breaking
- Changing a file's `target` path — breaking
- Removing a `cssVar` that consumers may depend on — breaking
- Adding new `dependencies` — non-breaking (CLI installs them)
- Adding new files — non-breaking

---

## Registry Source Repo Layout

```
packages/ui/
├── registry/
│   ├── registry.json              ← top-level index
│   ├── data-card/
│   │   ├── data-card.json         ← item descriptor
│   │   ├── data-card.tsx          ← component source
│   │   └── use-sparkline.ts       ← hook source
│   ├── stat-badge/
│   │   ├── stat-badge.json
│   │   └── stat-badge.tsx
│   └── ...
├── src/                           ← local usage / Storybook
│   └── components/
│       └── ui/                    ← shadcn components consumed locally
└── package.json
```

**Relationship between `registry/` and `src/`:**
- `registry/<name>/<name>.tsx` is the source of truth for the component.
- `src/components/ui/<name>.tsx` is a symlink or build artifact used for local Storybook/testing.
- On publish, `registry/*.json` item files reference paths within `registry/`.

---

## Pragmatic Stop Rule

Stop and deliver when:
1. `registry.json` is valid against the schema and all items resolve.
2. Each component item file has `files`, `dependencies`, `registryDependencies`, and `cssVars` fully declared.
3. `npx shadcn add <url>` installs the component, its deps, and CSS vars correctly in a test consumer project.
4. Co-existence with upstream registry is verified — no name collisions, no CSS variable conflicts.
5. Versioning strategy is documented and the first version is tagged.
6. Consumer onboarding instructions (one `components.json` edit + one CLI command) are written.
