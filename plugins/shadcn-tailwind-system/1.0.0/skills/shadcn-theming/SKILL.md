---
name: shadcn-theming
description: Use when customizing shadcn/ui's CSS variable system — covering color token design, dark mode strategy, brand palette mapping, multi-theme support, and design-token governance across projects.
---

# shadcn/ui Theming

## Specialization

Provide expert-level guidance for designing and maintaining the shadcn/ui CSS variable token system — covering semantic color token design, dark mode implementation, brand palette mapping, multi-theme support, and cross-project design-token governance.

This skill covers the CSS variable and token layer. Component composition and CVA variants are handled by `shadcn-component-design`. Project installation and `components.json` configuration are handled by `shadcn-setup`.

**Design language model**: shadcn's CSS variable system (`--primary`, `--background`, `--foreground`, etc.) is the authoritative token layer for component and brand color. Tailwind `@theme` tokens and palette classes must consume these CSS variables — not define independent parallel tokens. Tailwind may extend the token surface for layout, prose, animation, and non-component utilities, provided those additions do not conflict with shadcn semantic variables. Any token that affects a shadcn component is owned here; additive Tailwind-only tokens are permitted and documented.

## Trigger Conditions

- Mapping a brand palette onto shadcn's CSS variable system.
- Implementing or migrating dark mode (`.dark` class strategy vs. `prefers-color-scheme`).
- Establishing a shared design token system for multiple apps backed by shadcn/ui.
- Auditing `globals.css` for raw color values, missing semantic tokens, or dark mode gaps.
- Adding a new theme (e.g., per-tenant white-labeling) to an existing shadcn project.
- Migrating from hardcoded Tailwind palette classes to CSS variable–backed semantic tokens.

## When Not to Use

- Project installation and `components.json` wiring (use `shadcn-setup`).
- Component design, CVA variants, and Radix primitive integration (use `shadcn-component-design`).
- Form component patterns (use `shadcn-forms`).
- Quality gate review of a completed implementation (use `shadcn-quality-gate`).

## Inputs

- Brand palette (hex, oklch, or HSL values for primary, secondary, accent, destructive colors).
- Dark mode strategy: `.dark` class (JS-controlled) vs. `prefers-color-scheme` (CSS-only).
- Multi-theme or white-label requirements.
- Framework and Tailwind version in use.
- Existing CSS entry point and current token state.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Token inventory | All semantic tokens documented: role, light value, dark value, and Tailwind utility mapping |
| `@layer base` CSS block | Complete CSS variable declarations for both `:root` (light) and `.dark` scopes |
| Brand mapping record | Each brand color mapped to one or more semantic token roles with rationale |
| Dark mode strategy decision | `.dark` class vs. `prefers-color-scheme` chosen with explicit rationale; SSR flicker mitigation noted if `.dark` is used |
| Tailwind config alignment | `tailwind.config` extended to consume CSS variables via `hsl(var(--token))` or `oklch(var(--token))` pattern |
| Cross-project token contract | Stable token names that are safe to share across projects; breaking-change policy documented |
| Readiness summary | Open items, deferred tokens, and known color-system edge cases |

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Swap the default shadcn base color | Brand primary token renders correctly in light and dark |
| L2 Practical Delivery | Full brand palette applied across all semantic roles | All semantic tokens defined; dark mode renders correctly |
| L3 Multi-Theme | Two or more themes supported runtime-switchable | Theme switch is clean; no token leakage between themes |
| L4 Expert Standardization | Cross-project shared token package | Token contract is versioned, breaking-change safe, and consumable from any project |

## shadcn Token System

shadcn/ui uses a set of semantic CSS variable names. All tokens are declared in `globals.css` inside `@layer base`.

### Canonical Token Roles

| Token | Role | Tailwind Utility |
|---|---|---|
| `--background` | Page background | `bg-background` |
| `--foreground` | Default text on background | `text-foreground` |
| `--card` | Card surface | `bg-card` |
| `--card-foreground` | Text on card | `text-card-foreground` |
| `--popover` | Popover/dropdown surface | `bg-popover` |
| `--popover-foreground` | Text in popover | `text-popover-foreground` |
| `--primary` | Primary action color | `bg-primary` |
| `--primary-foreground` | Text on primary | `text-primary-foreground` |
| `--secondary` | Secondary action color | `bg-secondary` |
| `--secondary-foreground` | Text on secondary | `text-secondary-foreground` |
| `--muted` | Muted surface (subtle bg) | `bg-muted` |
| `--muted-foreground` | Muted text | `text-muted-foreground` |
| `--accent` | Hover/accent highlight | `bg-accent` |
| `--accent-foreground` | Text on accent | `text-accent-foreground` |
| `--destructive` | Danger/error action | `bg-destructive` |
| `--destructive-foreground` | Text on destructive | `text-destructive-foreground` |
| `--border` | Border color | `border-border` |
| `--input` | Input border color | `border-input` |
| `--ring` | Focus ring color | `ring-ring` |
| `--radius` | Border radius base | `rounded-[var(--radius)]` |

### Token Declaration Pattern

```css
@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --primary: 221.2 83.2% 53.3%;
    --primary-foreground: 210 40% 98%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 210 40% 98%;
    --radius: 0.5rem;
    /* ... all other tokens ... */
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
    --primary: 217.2 91.2% 59.8%;
    --primary-foreground: 222.2 47.4% 11.2%;
    /* ... all other tokens ... */
  }
}
```

Values are declared as `H S% L%` (Hue Saturation% Lightness%) for HSL consumption, or as `oklch` values for v4 Tailwind.

### Tailwind Config Consumption

```ts
// tailwind.config.ts
extend: {
  colors: {
    background: "hsl(var(--background))",
    foreground: "hsl(var(--foreground))",
    primary: {
      DEFAULT: "hsl(var(--primary))",
      foreground: "hsl(var(--primary-foreground))",
    },
    destructive: {
      DEFAULT: "hsl(var(--destructive))",
      foreground: "hsl(var(--destructive-foreground))",
    },
    // ... all other tokens
  },
  borderRadius: {
    lg: "var(--radius)",
    md: "calc(var(--radius) - 2px)",
    sm: "calc(var(--radius) - 4px)",
  },
}
```

## Dark Mode Strategy

### `.dark` Class (Recommended for Most Projects)

- Controlled by JavaScript; supports user preference, system preference, and manual override.
- Requires SSR flicker mitigation: inject a blocking script in `<head>` that reads `localStorage` before render, or use the `next-themes` library.
- Apply `class="dark"` to `<html>` or `<body>`.

```tsx
// next-themes integration (Next.js App Router)
import { ThemeProvider } from "next-themes"

export default function RootLayout({ children }) {
  return (
    <html suppressHydrationWarning>
      <body>
        <ThemeProvider attribute="class" defaultTheme="system" enableSystem>
          {children}
        </ThemeProvider>
      </body>
    </html>
  )
}
```

### `prefers-color-scheme` (CSS-Only)

- No JavaScript required; no SSR flicker.
- Cannot be overridden by user preference within the app.
- Use `@media (prefers-color-scheme: dark)` instead of `.dark {}` in the token block.

## Multi-Theme and White-Labeling

For multiple themes:

1. Define one CSS variable block per theme using a data attribute or class:
   ```css
   [data-theme="brand-a"] { --primary: 240 100% 50%; }
   [data-theme="brand-b"] { --primary: 140 80% 40%; }
   ```
2. Apply the attribute at the `<html>` or layout root.
3. All component classes remain unchanged; only tokens change.
4. Document each theme's token overrides in the token inventory.
5. Verify contrast ratios (WCAG AA minimum) for each theme independently.

## Brand Palette Mapping Process

1. Identify the brand's primary, secondary, and accent colors.
2. Convert to HSL (or oklch for Tailwind v4).
3. Map each brand color to the nearest semantic token role using intent, not just hue.
4. Generate a complementary foreground for each — target ≥ 4.5:1 contrast ratio (WCAG AA).
5. Repeat the mapping for dark mode, adjusting lightness to maintain contrast.
6. Use the shadcn themes playground (`https://ui.shadcn.com/themes`) to preview and validate.
7. Record the brand-to-token mapping in the token inventory output.

## Pragmatic Stop Rule

Stop when all semantic tokens are declared for both `:root` and `.dark`, the Tailwind config consumes them correctly, brand mapping is recorded, and dark mode strategy is documented. Each remaining item must appear in the readiness summary with a deferral reason.
