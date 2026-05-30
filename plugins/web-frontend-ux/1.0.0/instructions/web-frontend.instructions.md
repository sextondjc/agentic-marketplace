---
name: web-frontend
description: 'Web frontend coding standards: component boundaries, accessibility, Core Web Vitals, security (XSS, CSP), and prohibited patterns.'
applyTo: '**/*.ts,**/*.tsx,**/*.js,**/*.jsx,**/*.css,**/*.html'
---
# Web Frontend Policy

## Component Design

- Keep one component per file; co-locate styles and tests in the same folder as the component.
- Components must not directly access global state or backend APIs; use explicit service or hook abstractions.
- Props and state interfaces must be explicitly typed; do not use `any`.
- Extract shared logic into named hooks or utility functions; do not duplicate across components.
- Avoid inline styles; use CSS modules, utility classes, or a design-token-aware styling solution.

## Accessibility

- All images must have descriptive `alt` text; use `alt=""` for decorative images.
- Interactive elements must be keyboard-navigable and have visible focus indicators.
- Use semantic HTML elements before reaching for ARIA attributes.
- Do not suppress focus outlines globally.
- Form inputs must be associated with visible labels via `for`/`id` or `aria-label`.

## Performance

- Core Web Vitals targets: LCP ≤ 2.5 s, CLS ≤ 0.1, INP ≤ 200 ms.
- Code-split at route boundaries; do not bundle the entire app in a single chunk.
- Do not import entire libraries when tree-shaking or named imports are available.
- Lazy-load non-critical resources and below-the-fold images.
- Measure before optimizing; do not add performance complexity without a measurable baseline.

## Security

- Never store authentication tokens in `localStorage`; prefer `HttpOnly` cookies or in-memory storage.
- Do not use `dangerouslySetInnerHTML` or equivalent DOM injection without explicit sanitization.
- Do not construct URLs, CSS values, or HTML from untrusted input without encoding.
- Apply a Content Security Policy; do not use `unsafe-inline` or `unsafe-eval` without documented justification.
- Validate all user input at the frontend boundary before submission; treat server responses as untrusted too.

## Prohibited Patterns

- `eval()`, `new Function()`, and dynamic script injection.
- Inline event handlers in HTML templates (`onclick="..."`, `onload="..."`).
- Untyped API response consumption without explicit schema validation.
- Direct DOM manipulation bypassing the component framework lifecycle.
- Hardcoded credentials, tokens, or environment-specific URLs in source files.

## Routing Notes

- Use [SKILL.md](./../skills/build-web-frontend/SKILL.md) for component architecture, accessibility validation, performance tuning, and security review workflow.
- Use quality-gate skills for domain-specific evidence-based decisions:
  - [SKILL.md](./../skills/web-ux-accessibility/SKILL.md) for accessibility findings
  - [SKILL.md](./../skills/web-ux-performance/SKILL.md) for Core Web Vitals validation
  - [SKILL.md](./../skills/web-ux-quality-gate/SKILL.md) for unified web UX quality sign-off
