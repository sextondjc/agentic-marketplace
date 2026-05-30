# TailwindCSS Component Design — Source Catalog

Active sources evaluated: 2026-05-06

| ID | Source | URL | Authority | Freshness | Relevance | Actionability | Skill Delta |
|---|---|---|---|---|---|---|---|
| TWD-001 | TailwindCSS Official Docs | https://tailwindcss.com/docs | Primary | Reviewed 2026-05-06 | High | High | Utility reference, responsive breakpoints, dark mode config, `@theme` custom properties, container queries. |
| TWD-002 | TailwindCSS v4 Upgrade Guide | https://tailwindcss.com/docs/upgrade-guide | Primary | Reviewed 2026-05-06 | High | High | CSS-first `@theme` token model replacing JS config; dark mode variant changes. |
| TWD-003 | Headless UI Docs | https://headlessui.com | First-party | Reviewed 2026-05-06 | High | High | Dialog, Menu, Listbox, Combobox, Tab component patterns and data-attribute styling API. |
| TWD-004 | Prettier Plugin for Tailwind | https://github.com/tailwindlabs/prettier-plugin-tailwindcss | First-party | Reviewed 2026-05-06 | High | High | Canonical class ordering rules and enforcement configuration. |
| TWD-005 | WCAG 2.2 | https://www.w3.org/TR/WCAG22/ | Standard | Reviewed 2026-05-06 | High | High | Contrast ratios (1.4.3, 1.4.6), focus-visible (2.4.11), touch target (2.5.8), reduced motion (2.3.3). |
| TWD-006 | WAI-ARIA APG | https://www.w3.org/WAI/ARIA/apg/ | Standard | Reviewed 2026-05-06 | High | High | Keyboard interaction patterns for dialog, menu, listbox, tabs; used to verify Headless UI coverage. |
| TWD-007 | MDN CSS Reference | https://developer.mozilla.org/docs/Web/CSS | Standard | Reviewed 2026-05-06 | Medium | Medium | Cascade, custom property, and container query semantics underlying Tailwind utilities. |

## Source Governance Summary

- Authority: TWD-001 through TWD-004 are first-party TailwindCSS Lab sources. TWD-005 and TWD-006 are W3C standards. TWD-007 is a standards reference.
- Freshness: all sources reviewed 2026-05-06. Refresh primary sources monthly; W3C and MDN quarterly.
- Relevance: all sources directly support token design, component patterns, accessibility enforcement, and class ordering.
- Actionability: all sources yield concrete, extractable rules for component implementation and review.
