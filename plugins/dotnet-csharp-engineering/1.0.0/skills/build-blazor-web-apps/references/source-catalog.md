# Blazor Web Apps Source Catalog

This catalog tracks authoritative sources used to keep Blazor guidance current and actionable.

## Primary Sources

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [Blazor Official Documentation](https://dotnet.microsoft.com/en-us/apps/aspnet/web-apps/blazor) | Comprehensive Blazor guide covering WebAssembly, Server, and Hybrid hosting models, component lifecycle, data binding, authentication, performance optimization, and best practices. | Canonical Microsoft source for all Blazor platform features, hosting models, and official recommendations. | Yes | 2026-04-19 | Current | Primary authority for workspace Blazor implementation standards. Includes tutorials, API reference, and upgrade guidance. |
| [ASP.NET Core Blazor Security and Identity](https://learn.microsoft.com/en-us/aspnet/core/blazor/security/) | Security patterns for authentication, authorization, CSRF protection, and secure data handling across hosting models. | Essential for production-ready security posture and compliance alignment. | Yes | 2026-04-19 | Current | Reference for authorization guards, token storage, and secure interop patterns. |
| [ASP.NET Core Blazor Performance Best Practices](https://learn.microsoft.com/en-us/aspnet/core/blazor/performance) | Optimization guidance for bundle size, rendering performance, lazy loading, and hosting-model-specific tuning. | Required for meeting performance baselines and understanding trade-offs between hosting models. | Yes | 2026-04-19 | Current | Reference for metrics targets, trimming strategy, and AOT guidance. |
| [WebAssembly (WASM) Performance](https://webassembly.org/docs/gc/) | Low-level WASM garbage collection, optimization, and performance debugging techniques. | Technical foundation for understanding Blazor WebAssembly performance characteristics. | Partial | 2026-04-19 | Current | Optional deep-dive; rely on Blazor docs first, escalate to WASM specs for extreme optimization. |
| [ARIA Authoring Practices Guide (APG)](https://www.w3.org/WAI/ARIA/apg/) | Accessible Rich Internet Applications patterns, roles, properties, and states for interactive components. | Canonical reference for WCAG 2.1 AA compliance and accessible component patterns. | Yes | 2026-04-19 | Current | Reference for ARIA annotations in custom Blazor components. |
| [Web Content Accessibility Guidelines 2.1 (WCAG 2.1)](https://www.w3.org/WAI/WCAG21/quickref/) | Four-level accessibility conformance (A, AA, AAA) with success criteria and techniques. | Mandatory baseline for accessibility audit criteria and remediation. | Yes | 2026-04-19 | Current | Reference for audit checkpoints and conformance level targets (AA). |
| [Core Web Vitals](https://web.dev/vitals/) | Metrics for user experience (LCP, FID/INP, CLS) with measurement tools and optimization guidance. | Standard metrics for performance baseline and regression detection. | Yes | 2026-04-19 | Current | Reference for performance targets and measurement methodology. |

## Secondary Sources (Reference-Only)

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [MDN Web Docs (JavaScript Interop)](https://developer.mozilla.org/en-US/docs/Web/API) | Browser APIs and JavaScript patterns for interop scenarios. | Reference for JS interop design decisions and browser compatibility. | Partial | 2026-04-19 | Current | Consulted when designing JS interop surfaces; not primary authority. |
| [dotnet/aspnetcore repository](https://github.com/dotnet/aspnetcore) | Source code, issues, and PR discussions for ASP.NET Core and Blazor. | Evidence base for understanding implementation details and pending changes. | Partial | 2026-04-19 | Current | Consulted for deep architecture questions or when official docs are outdated. |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
- Evaluate sources on a rolling basis; priority goes to Primary Sources.

## Last Updated

- Evaluated: 2026-04-19
- Next Review: 2026-05-19 (30 days)
