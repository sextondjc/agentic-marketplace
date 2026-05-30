# TailwindCSS Design System — Source Catalog

Active sources evaluated: 2026-05-06

| ID | Source | URL | Authority | Freshness | Relevance | Actionability | Skill Delta |
|---|---|---|---|---|---|---|---|
| TWDS-001 | TailwindCSS Official Docs | https://tailwindcss.com/docs | Primary | Reviewed 2026-05-06 | High | High | `@theme` custom property model; CSS-first token definition and cascade behavior. |
| TWDS-002 | TailwindCSS v4 Upgrade Guide | https://tailwindcss.com/docs/upgrade-guide | Primary | Reviewed 2026-05-06 | High | High | Token model migration from JS config to CSS; impacts shared package structure. |
| TWDS-003 | TailwindCSS Framework Guides | https://tailwindcss.com/docs/installation/framework-guides | First-party | Reviewed 2026-05-06 | High | High | Per-framework import patterns for consuming a shared token package. |
| TWDS-004 | WCAG 2.2 | https://www.w3.org/TR/WCAG22/ | Standard | Reviewed 2026-05-06 | High | High | Contrast and focus requirements that shared semantic tokens must satisfy across all consumers. |
| TWDS-005 | MDN CSS Reference — Custom Properties | https://developer.mozilla.org/docs/Web/CSS/--* | Standard | Reviewed 2026-05-06 | High | High | CSS custom property cascade, inheritance, and fallback semantics underpinning token architecture. |
| TWDS-006 | Semantic Versioning Spec | https://semver.org | Standard | Reviewed 2026-05-06 | High | High | Semver rules applied to token package versioning policy. |
| TWDS-007 | Style Dictionary Docs | https://amzn.github.io/style-dictionary | Vendor | Reviewed 2026-05-06 | Medium | Medium | Token transformation pipeline; relevant if the team uses Style Dictionary to generate `@theme` blocks from design tool exports. |

## Source Governance Summary

- Authority: TWDS-001 through TWDS-003 are first-party TailwindCSS Lab sources. TWDS-004 and TWDS-005 are W3C standards. TWDS-006 is the authoritative semver specification. TWDS-007 is vendor authority (Amazon/Style Dictionary).
- Freshness: all sources reviewed 2026-05-06. Refresh primary and vendor sources monthly; W3C and semver spec quarterly.
- Relevance: all sources directly support token architecture, versioning, cross-framework consumption, or accessibility compliance.
- Actionability: all sources yield concrete, extractable rules for token design and governance decisions.
