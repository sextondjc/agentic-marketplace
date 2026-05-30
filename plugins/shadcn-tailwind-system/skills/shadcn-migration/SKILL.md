---
name: shadcn-migration
description: Use when migrating an existing application from another component library (MUI, Chakra UI, Mantine, Ant Design) to shadcn/ui — covering component equivalence maps, token migration, progressive coexistence patterns, and breaking-change sequencing.
---

# shadcn/ui Migration

## Specialization

Provide expert-level guidance for migrating production applications from MUI (Material UI), Chakra UI, Mantine, or Ant Design to shadcn/ui — covering component equivalence mapping, CSS variable token migration, progressive coexistence patterns that allow incremental replacement without breaking existing UI, and breaking-change sequencing with rollback markers.

This skill is specialized for migration from another component library. Initial project wiring for greenfield work is handled by `shadcn-setup`. Theming and token design for new projects is handled by `shadcn-theming`. Design system governance for multi-app scenarios is handled by `shadcn-design-system`.

## Trigger Conditions

- An existing app using MUI, Chakra UI, Mantine, or Ant Design needs to move to shadcn/ui fully or partially.
- A team wants to progressively replace a legacy component library without a big-bang rewrite.
- Token/theme values from an existing design system need to be mapped to shadcn CSS variable semantics.
- Bundle size reduction is a goal and the current library is large (MUI's full import is typically 300–500 KB gzip).
- Coexistence of shadcn and the legacy library during migration needs to be scoped and governed.
- Migration has stalled due to component gaps — shadcn has no equivalent for a specific legacy component.

## When Not to Use

- Initial setup for a greenfield project (use `shadcn-setup`).
- Theming for a net-new project (use `shadcn-theming`).
- Multi-app design system governance (use `shadcn-design-system`).
- Migrating from one shadcn version to another (use `shadcn-setup` with the diff/upgrade section).

## Inputs

- Source library and version (e.g., `@mui/material@5`, `@chakra-ui/react@2`, `@mantine/core@7`, `antd@5`).
- Target framework: Next.js App Router, Vite + React, Remix, or SvelteKit.
- Migration scope: full replacement, partial replacement, or coexistence target state.
- Existing theme/token values if a brand design system is in use.
- Component inventory: list of components actively used in the application.
- Team velocity and acceptable coexistence duration.
- Evaluation date in ISO format (`YYYY-MM-DD`).

## Required Outputs

| Output | Description |
|---|---|
| Component equivalence map | Source library component → shadcn/ui equivalent, including gap analysis for components with no direct equivalent |
| Token migration map | Source theme values → shadcn CSS variable equivalents (`--primary`, `--background`, etc.) |
| Migration sequencing plan | Ordered list of replacement phases with coexistence rules and rollback markers per phase |
| Coexistence configuration | How to run both libraries simultaneously: CSS specificity isolation, conflicting reset handling, provider nesting |
| Gap components register | Components with no shadcn equivalent — custom Radix-based implementation plan or deferral rationale |
| Bundle impact projection | Expected gzip delta per phase as legacy library chunks are removed |
| Breaking-change log | Prop API differences, behavior differences, and migration adapter patterns |
| Completion criteria | Definition of "fully migrated" — zero legacy library imports in production bundle |

## Depth Modes

| Level | Intent | Exit Rule |
|---|---|---|
| L1 Orientation | Understand scope and feasibility of migration | Component inventory done; major gaps identified; rough phase count estimated |
| L2 Practical Delivery | Execute migration for one component family | One component type replaced across all usages; coexistence stable; no regressions |
| L3 Advanced Patterns | Full migration with coexistence, gap coverage, and token parity | All phases executing; custom gap components built; token migration complete |
| L4 Expert Standardization | Reusable cross-project migration playbook | Migration runbook, equivalence maps, and coexistence templates documented for reuse |

## Component Equivalence Maps

### MUI → shadcn/ui

| MUI Component | shadcn/ui Equivalent | Notes |
|---|---|---|
| `Button` | `Button` | MUI has `variant="contained"/"outlined"/"text"`; shadcn has `variant="default"/"outline"/"ghost"/"link"` |
| `TextField` | `Input` + `Label` + `FormMessage` | MUI TextField is composite; shadcn uses primitives composed via `FormField` |
| `Select` | `Select` | MUI uses uncontrolled `value` prop; shadcn uses `onValueChange` |
| `Autocomplete` | `Combobox` (Command + Popover) | MUI Autocomplete has rich async; shadcn Combobox is simpler — may need custom wrapper |
| `Dialog` | `Dialog` | Close-on-backdrop behavior differs; Radix closes on outside click by default |
| `Snackbar` | `Sonner` (toast) | Use `sonner` package; `npx shadcn add sonner` |
| `Tooltip` | `Tooltip` | MUI Tooltip wraps children directly; shadcn requires `TooltipTrigger asChild` |
| `Table` | `Table` + TanStack Table | MUI Table is plain HTML table; for sortable/filterable use TanStack + shadcn Table primitives |
| `Drawer` | `Sheet` | shadcn `Sheet` with `side="left"/"right"/"top"/"bottom"` |
| `Menu` | `DropdownMenu` | Radix-based; keyboard nav built in |
| `Checkbox` | `Checkbox` | MUI uses `onChange`; shadcn uses `onCheckedChange` |
| `Switch` | `Switch` | Same; prop name difference |
| `Slider` | `Slider` | shadcn Slider is Radix-based; MUI Slider has `marks` — custom if needed |
| `Chip` | `Badge` | Simple label only; interactive Chip needs custom component |
| `Avatar` | `Avatar` | Direct equivalent; Radix-based |
| `Skeleton` | `Skeleton` | Direct equivalent |
| `CircularProgress` | `Loader2` (icon, animated) | No spinner component by default; use `<Loader2 className="animate-spin" />` |
| `LinearProgress` | `Progress` | Direct equivalent |
| `Accordion` | `Accordion` | Direct equivalent; Radix-based |
| `Tabs` | `Tabs` | Direct equivalent; Radix-based |
| `Alert` | `Alert` | Direct equivalent |
| `Card` | `Card` | Direct equivalent |
| `Breadcrumbs` | `Breadcrumb` | Direct equivalent |
| `Pagination` | Custom | No built-in; compose with `Button` + state or use TanStack Table pagination |
| `DataGrid` | `DataTable` (TanStack Table) | MUI DataGrid is a premium component; TanStack Table is the full-featured open equivalent |
| `DatePicker` | `Calendar` + `Popover` | shadcn `Calendar` (react-day-picker based); compose into a DatePicker pattern |
| `TreeView` | No direct equivalent | Build custom using Radix `Accordion` or raw recursive component |

### Chakra UI → shadcn/ui

| Chakra Component | shadcn/ui Equivalent | Notes |
|---|---|---|
| `Button` | `Button` | Chakra `colorScheme` → shadcn `variant`; `size` maps directly |
| `Input` | `Input` | Chakra `InputGroup`/`InputLeftElement` → compose with relative wrapper |
| `FormControl` + `FormLabel` + `FormErrorMessage` | `FormField` → `FormItem` → `FormLabel` + `FormControl` + `FormMessage` | shadcn form uses react-hook-form; Chakra uses its own state |
| `Modal` | `Dialog` | Chakra `useDisclosure` → shadcn controlled `open`/`onOpenChange` |
| `Drawer` | `Sheet` | Direct equivalent |
| `Tooltip` | `Tooltip` | Direct equivalent |
| `Select` | `Select` | Chakra Select is HTML native; shadcn Select is Radix |
| `Stack` / `HStack` / `VStack` | Tailwind `flex` / `gap-*` | Chakra layout components → Tailwind utility classes |
| `Box` / `Flex` / `Grid` | Tailwind utilities | Replace all layout primitives with Tailwind classes |
| `Text` / `Heading` | HTML elements + Tailwind typography | shadcn has no Text primitive; use `<p>`, `<h1–h6>` + `cn()` |
| `Badge` | `Badge` | Direct equivalent |
| `Avatar` | `Avatar` | Direct equivalent |
| `Skeleton` | `Skeleton` | Direct equivalent |
| `Spinner` | `Loader2` (icon, animated) | Same as MUI |
| `Tabs` | `Tabs` | Direct equivalent |
| `Accordion` | `Accordion` | Direct equivalent |
| `Alert` | `Alert` | Direct equivalent |
| `Popover` | `Popover` | Direct equivalent; Chakra `useDisclosure` → controlled state |
| `Menu` | `DropdownMenu` | Direct equivalent |
| `Table` | `Table` | Direct equivalent for display; TanStack for interactive |
| `toast` (useToast) | `Sonner` | Replace `useToast` calls with `import { toast } from "sonner"` |

### Mantine → shadcn/ui

| Mantine Component | shadcn/ui Equivalent | Notes |
|---|---|---|
| `Button` | `Button` | |
| `TextInput` | `Input` + `Label` | |
| `Select` | `Select` | Mantine Select has search built in; shadcn Select does not — use Combobox for searchable |
| `MultiSelect` | Custom Combobox with multi-select | No built-in; compose with Command + Popover + Badge tags |
| `DatePicker` | `Calendar` + `Popover` | |
| `Modal` | `Dialog` | Mantine `opened`/`onClose` → shadcn `open`/`onOpenChange` |
| `Drawer` | `Sheet` | |
| `Notification` | `Sonner` | |
| `Table` | `Table` | |
| `Accordion` | `Accordion` | |
| `Tabs` | `Tabs` | |
| `Progress` | `Progress` | |
| `Skeleton` | `Skeleton` | |
| `Badge` | `Badge` | |
| `Avatar` | `Avatar` | |
| `Tooltip` | `Tooltip` | |
| `Menu` | `DropdownMenu` | |
| `Grid` / `SimpleGrid` | Tailwind `grid` + `grid-cols-*` | |
| `Stack` / `Group` | Tailwind `flex` + `gap-*` | |

---

## Token Migration Map

### MUI Theme → shadcn CSS Variables

```ts
// MUI theme → shadcn globals.css CSS variables
// primary.main → --primary (HSL)
// primary.contrastText → --primary-foreground
// background.default → --background
// background.paper → --card
// text.primary → --foreground
// text.secondary → --muted-foreground
// divider → --border
// error.main → --destructive
// palette.grey[100] → --muted

// Example mapping (if MUI primary is #1976D2):
// --primary: 211 100% 42%;   /* hsl(211, 100%, 42%) = #1976D2 */
```

### Chakra Theme → shadcn CSS Variables

```ts
// Chakra colors.brand.500 → --primary
// Chakra colors.gray.50 → --background
// Chakra colors.gray.800 → --foreground (in dark mode)
// Chakra semanticTokens map 1:1 to CSS variable roles
```

**HSL conversion tool:** Use `oklch-to-hsl` or browser DevTools color picker to convert hex brand values to HSL for the CSS variable declarations.

---

## Coexistence Configuration

When running shadcn alongside MUI or Chakra during progressive migration, CSS conflicts are the primary risk.

### MUI Coexistence

```tsx
// 1. Wrap legacy MUI surfaces in StyledEngineProvider to isolate CSS injection order
import { StyledEngineProvider } from "@mui/material/styles"

function LegacySection() {
  return (
    <StyledEngineProvider injectFirst>
      {/* MUI components here */}
    </StyledEngineProvider>
  )
}

// 2. MUI's CssBaseline resets conflict with Tailwind's preflight
// Remove CssBaseline or scope it; do not run both resets globally
```

### Chakra UI Coexistence

```tsx
// Chakra's ChakraProvider applies a CSS reset — conflicts with Tailwind preflight
// Option A: Disable Chakra reset
<ChakraProvider resetCSS={false}>
  {/* legacy Chakra components */}
</ChakraProvider>

// Option B: Scope Chakra to a subtree using a CSS layer
// Wrap legacy routes in ChakraProvider; new routes have no provider
```

### General Coexistence Rules

1. **Never run two CSS resets globally** — disable the legacy library's reset when Tailwind preflight is active.
2. **Use CSS cascade layers** to control specificity: legacy library styles in `@layer legacy {}` subordinate to Tailwind utilities.
3. **Route-level isolation** is the safest coexistence boundary — legacy routes render legacy components; new routes render shadcn.
4. **Provider nesting**: keep shadcn's `ThemeProvider` wrapping the entire app; nest legacy providers inside route subtrees only.

---

## Migration Sequencing Pattern

### Phase 0: Inventory and Setup (no user-visible changes)

1. Run `npx shadcn init` alongside existing library.
2. Produce component inventory: list of all legacy component types and usage count.
3. Identify gap components (no shadcn equivalent).
4. Establish coexistence configuration.
5. Set bundle size baseline: `npm run build && gzip -c dist/assets/*.js | wc -c`.

### Phase 1: Leaf Components (low risk)

Replace stateless display components first: `Badge`, `Avatar`, `Skeleton`, `Alert`, `Card`, `Progress`.

- These have no complex state or event handling.
- Replace file by file; test visual regression with Storybook or Playwright screenshots.
- Remove legacy imports as each component is replaced.

### Phase 2: Form Primitives

Replace `Input`, `Label`, `Checkbox`, `Switch`, `Select` (non-searchable).

- Wire to `FormField` pattern.
- Validate ARIA behavior matches legacy.

### Phase 3: Overlay Components (medium risk)

Replace `Dialog`/`Modal`, `Tooltip`, `Popover`, `DropdownMenu`/`Menu`, `Sheet`/`Drawer`.

- Focus management must be verified after each replacement.
- Test keyboard navigation and screen reader behavior.

### Phase 4: Data Display (high complexity)

Replace `Table` / `DataGrid` with TanStack Table + shadcn Table primitives.

- Port column definitions.
- Verify sorting, filtering, pagination behavior.

### Phase 5: Removal

- Remove legacy library from `package.json`.
- Remove providers from root layout.
- Remove coexistence isolation CSS.
- Run final bundle size comparison.

---

## Gap Component Patterns

For components with no shadcn equivalent, build on Radix primitives directly:

### Multi-Select (Mantine MultiSelect / MUI Autocomplete multi)

```tsx
// Compose: Command + Popover + Badge array for selected values
// See shadcn-data-display for Combobox pattern — extend to multi-select by:
// 1. Storing selected[] array in state instead of single value
// 2. Rendering selected items as Badge components in trigger
// 3. Command items show checkmark (Check icon) when selected
// 4. Clicking selected item removes it from array
```

### Date Range Picker

```tsx
// Compose: Calendar (react-day-picker) + Popover
// react-day-picker supports mode="range" returning { from, to }
npx shadcn add calendar popover
```

### Tree View

```tsx
// Compose: recursive component + Radix Collapsible
// No shadcn equivalent; Radix Collapsible handles expand/collapse ARIA
npx shadcn add collapsible
```

---

## Pragmatic Stop Rule

Stop and deliver when:
1. Component equivalence map covers all components in the project inventory.
2. Token migration map translates all brand values to HSL CSS variables.
3. Coexistence configuration is documented and the two libraries do not conflict.
4. Migration phases are sequenced with rollback markers at each phase boundary.
5. Gap components have either a custom implementation plan or an explicit deferral with rationale.
6. Bundle impact projection is calculated from the baseline.
