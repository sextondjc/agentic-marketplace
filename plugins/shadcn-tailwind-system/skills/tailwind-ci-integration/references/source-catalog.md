# TailwindCSS CI Integration — Source Catalog

Active sources evaluated: 2026-05-06

| ID | Source | URL | Authority | Freshness | Relevance | Actionability | Skill Delta |
|---|---|---|---|---|---|---|---|
| TWCI-001 | TailwindCSS Official Docs | https://tailwindcss.com/docs | Primary | Reviewed 2026-05-06 | High | High | Content scanning config, production build expectations, and purge model for CI verification. |
| TWCI-002 | Prettier Plugin for Tailwind | https://github.com/tailwindlabs/prettier-plugin-tailwindcss | First-party | Reviewed 2026-05-06 | High | High | Class-ordering enforcement configuration; `prettier --check` usage in CI. |
| TWCI-003 | Lighthouse CI Docs | https://github.com/GoogleChrome/lighthouse-ci/blob/main/docs/getting-started.md | Vendor | Reviewed 2026-05-06 | High | High | `lhci autorun`, `lighthouserc.json` schema, assertion configuration, and GitHub Actions integration. |
| TWCI-004 | web.dev Core Web Vitals | https://web.dev/vitals | Vendor | Reviewed 2026-05-06 | High | High | LCP ≤ 2.5s, CLS ≤ 0.1, INP ≤ 200ms threshold definitions for committed Lighthouse CI assertions. |
| TWCI-005 | GitHub Actions Docs | https://docs.github.com/actions | Vendor | Reviewed 2026-05-06 | High | High | Workflow syntax, repository variables, secrets handling, and artifact upload/retention configuration. |
| TWCI-006 | TailwindCSS v4 Upgrade Guide | https://tailwindcss.com/docs/upgrade-guide | Primary | Reviewed 2026-05-06 | Medium | Medium | v4 content-scan behavior changes affecting CI purge-verification approach. |

## Source Governance Summary

- Authority: TWCI-001, TWCI-002, TWCI-006 are first-party TailwindCSS Lab sources. TWCI-003, TWCI-004, TWCI-005 are vendor authority (Google/GitHub).
- Freshness: all sources reviewed 2026-05-06. Refresh primary and vendor sources monthly.
- Relevance: all sources directly support one or more CI job types (ordering, bundle, content-scan, performance).
- Actionability: all sources yield concrete, configuration-level guidance for CI implementation.
