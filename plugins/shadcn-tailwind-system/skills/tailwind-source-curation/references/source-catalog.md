# TailwindCSS Source Curation — Source Catalog

Active sources evaluated: 2026-05-06

| ID | Source | URL | Authority | Freshness | Relevance | Actionability | Skill Delta |
|---|---|---|---|---|---|---|---|
| TWC-001 | TailwindCSS Official Docs | https://tailwindcss.com/docs | Primary | Reviewed 2026-05-06 | High | High | Canonical utility reference, v4 CSS-first config, plugin and dark mode guidance. |
| TWC-002 | TailwindCSS v4 Upgrade Guide | https://tailwindcss.com/docs/upgrade-guide | Primary | Reviewed 2026-05-06 | High | High | Breaking changes for config model, removed utilities, and migration sequencing. |
| TWC-003 | TailwindCSS GitHub Releases | https://github.com/tailwindlabs/tailwindcss/releases | Primary | Reviewed 2026-05-06 | High | High | Changelog-driven refresh triggers for skill currency; deprecation tracking. |
| TWC-004 | TailwindCSS Blog | https://tailwindcss.com/blog | First-party | Reviewed 2026-05-06 | Medium | Medium | Feature rationale and release announcements for major capability additions. |
| TWC-005 | Headless UI Docs | https://headlessui.com | First-party | Reviewed 2026-05-06 | High | High | Accessible component interaction patterns (dialog, menu, listbox, combobox) co-designed with Tailwind. |
| TWC-006 | Prettier Plugin for Tailwind | https://github.com/tailwindlabs/prettier-plugin-tailwindcss | First-party | Reviewed 2026-05-06 | High | High | Official class-ordering rules; required for quality gate consistency checks. |
| TWC-007 | TailwindCSS + Vite Setup | https://tailwindcss.com/docs/installation/using-vite | First-party | Reviewed 2026-05-06 | High | High | Canonical Vite integration; PostCSS chain and content scanning config. |
| TWC-008 | TailwindCSS Framework Guides | https://tailwindcss.com/docs/installation/framework-guides | First-party | Reviewed 2026-05-06 | High | High | SvelteKit, Next.js, Vue, Nuxt, Astro per-framework setup guidance. |
| TWC-009 | web.dev Core Web Vitals | https://web.dev/vitals | Vendor | Reviewed 2026-05-06 | High | High | LCP, CLS, INP thresholds used in quality gate CSS delivery checks. |
| TWC-010 | WCAG 2.2 | https://www.w3.org/TR/WCAG22/ | Standard | Reviewed 2026-05-06 | High | High | Contrast, focus-visible, and keyboard accessibility requirements applied to Tailwind color and utility choices. |
| TWC-011 | MDN CSS Reference | https://developer.mozilla.org/docs/Web/CSS | Standard | Reviewed 2026-05-06 | Medium | Medium | Fallback canonical reference for utility semantics, browser compatibility, and cascade behavior. |
| TWC-012 | Awesome Tailwind CSS | https://github.com/aniftyco/awesome-tailwindcss | Community | Reviewed 2026-05-06 | Low | Low | Plugin and tooling discovery only; not cited for behavioral guidance. |

## Source Governance Summary

- Authority: TWC-001 through TWC-008 are first-party Tailwind Lab sources. TWC-009 and TWC-010 are vendor and standards authority. TWC-011 is a standards reference. TWC-012 is community-level (discovery only).
- Freshness: all sources were reviewed 2026-05-06. Refresh threshold is 30 days for primary sources, quarterly for WCAG and web.dev.
- Relevance: all accepted sources materially affect Tailwind setup, component design, accessibility, or quality gate decisions.
- Actionability: primary and first-party sources yield concrete, extractable rules. Community source (TWC-012) is limited to plugin discovery.
