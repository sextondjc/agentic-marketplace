# TailwindCSS Quality Gate — Source Catalog

Active sources evaluated: 2026-05-06

| ID | Source | URL | Authority | Freshness | Relevance | Actionability | Skill Delta |
|---|---|---|---|---|---|---|---|
| TWQ-001 | TailwindCSS Official Docs | https://tailwindcss.com/docs | Primary | Reviewed 2026-05-06 | High | High | Content scanning config, bundle purge model, and production build expectations. |
| TWQ-002 | TailwindCSS v4 Upgrade Guide | https://tailwindcss.com/docs/upgrade-guide | Primary | Reviewed 2026-05-06 | High | High | v4 config model changes affecting token conformance and build-pipeline checks. |
| TWQ-003 | web.dev Core Web Vitals | https://web.dev/vitals | Vendor | Reviewed 2026-05-06 | High | High | LCP ≤ 2.5s, CLS ≤ 0.1, INP ≤ 200ms thresholds for CSS-delivery impact assessment. |
| TWQ-004 | WCAG 2.2 | https://www.w3.org/TR/WCAG22/ | Standard | Reviewed 2026-05-06 | High | High | SC 1.4.3 (contrast), SC 2.4.11 (focus appearance), SC 2.5.8 (target size), SC 2.3.3 (animation). |
| TWQ-005 | WAI-ARIA APG | https://www.w3.org/WAI/ARIA/apg/ | Standard | Reviewed 2026-05-06 | High | High | Keyboard interaction patterns for verifying Headless UI component coverage. |
| TWQ-006 | Prettier Plugin for Tailwind | https://github.com/tailwindlabs/prettier-plugin-tailwindcss | First-party | Reviewed 2026-05-06 | Medium | High | Class ordering consistency enforcement; gate check for unordered commits. |
| TWQ-007 | Headless UI Docs | https://headlessui.com | First-party | Reviewed 2026-05-06 | Medium | Medium | Component ARIA contract reference used to verify implementation correctness. |

## Source Governance Summary

- Authority: TWQ-001, TWQ-002, TWQ-006, TWQ-007 are first-party TailwindCSS Lab sources. TWQ-003 is vendor authority. TWQ-004 and TWQ-005 are W3C standards.
- Freshness: all sources reviewed 2026-05-06. Refresh primary and vendor sources monthly; W3C standards quarterly.
- Relevance: all sources directly inform one or more gate dimensions (bundle, tokens, accessibility, performance, pipeline).
- Actionability: all sources yield concrete, testable pass/fail criteria for the gate checklist.
