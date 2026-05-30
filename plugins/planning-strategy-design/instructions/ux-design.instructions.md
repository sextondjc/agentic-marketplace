---
name: ux-design
description: 'UX design policy standards: accessibility baseline, interaction conventions, and wireframe/prototype mandates.'
applyTo: '.docs/**/*.md'
---
# UX Design Policy

## Accessibility

- Target WCAG 2.1 AA compliance as the minimum baseline for all surfaces.
- Provide visible focus indicators for all interactive elements.
- Maintain a minimum contrast ratio of 4.5:1 for normal text and 3:1 for large text.
- Touch targets must be at least 44×44 logical pixels on mobile surfaces.
- All interactive elements must have meaningful accessible names.
- Do not rely on color alone to convey state or meaning.

## Interaction Design

- One primary action per screen or view; secondary actions must be visually subordinate.
- Back and cancel behavior must be predictable and consistent across all flows.
- Always provide visible feedback for loading, success, error, and empty states.
- Use plain-language microcopy; avoid jargon and technical error messages in user-facing strings.
- Keep navigation depth to three levels or fewer unless explicitly justified.

## Wireframe and Prototype Standards

- Low-fidelity wireframes must cover primary flow, edge cases, and error states before mid-fidelity work begins.
- Annotate every interactive element with behavior, state transitions, and accessible label expectations.
- Mid-fidelity wireframes must include content hierarchy, spacing intent, and tap or click target sizing.
- Do not skip the low-fidelity stage for flows with more than three steps.

## Routing Notes

- Use [SKILL.md](./../skills/design-web-ux/SKILL.md) for web UX research, wireframing, validation, and handoff workflow.
- Use [SKILL.md](./../skills/design-mobile-ux/SKILL.md) for mobile UX research, wireframing, validation, and handoff workflow.
- Use [SKILL.md](./../skills/usability-test-scripts/SKILL.md) for usability test design, scoring rubrics, and findings templates.

