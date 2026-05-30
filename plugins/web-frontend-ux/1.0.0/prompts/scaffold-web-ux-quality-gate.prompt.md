---
name: scaffold-web-ux-quality-gate
description: Scaffold a web UX quality-gate evidence bundle for a workstream using either the core 3 dimensions or the full portable dimension set.
argument-hint: workstream-id=<id> bundle-scope=<core|full> scope-summary=<text>
agent: agent
---

Create a web UX quality-gate evidence bundle under `.docs/changes/<workstream-id>/`.

Inputs:
- `workstream-id`: `${input:workstream-id:web-ux-example}`
- `bundle-scope`: `${input:bundle-scope:core}`
- `scope-summary`: `${input:scope-summary:checkout refresh and registration flow}`

Execution rules:
- Load and follow [SKILL.md](../skills/web-ux-quality-gate/SKILL.md).
- If `bundle-scope=core`, create the core bundle for accessibility, usability, and performance plus the unified recommendation artifact.
- If `bundle-scope=full`, create the full portable bundle supported by the umbrella quality-gate skill.
- Use the templates and worked examples in these references:
  - [web-ux-quality-gate skill](../skills/web-ux-quality-gate/SKILL.md)
  - [unified recommendation template](../skills/web-ux-quality-gate/references/unified-release-recommendation-template.md)
  - [core worked example](../../.docs/changes/web-ux-quality-gate-example/ux-quality-gate-recommendation.md)
  - [full worked example](../../.docs/changes/web-ux-quality-gate-full-example/ux-quality-gate-recommendation.md)
- Produce realistic but clearly example-safe placeholder data when concrete evidence is not supplied.
- Keep artifact names consistent with the umbrella skill evidence contract.
- Include a phase-output ownership matrix and a dimension evidence index when `bundle-scope=full`.
- For `bundle-scope=full`, include all dimensions currently supported by the umbrella quality-gate skill, not a hardcoded subset.
- End with a concise summary of which files were created and the final recommendation status.

