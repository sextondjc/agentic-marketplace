# Skill Source Catalog

This catalog tracks authoritative sources used to keep type-level customization audit guidance current.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [VS Code Customization Overview](https://code.visualstudio.com/docs/copilot/customization/overview) | Cross-type customization model and discovery behavior across prompts, instructions, skills, and agents. | Grounds type boundary and cross-type interaction checks. | Yes | 2026-04-18 | Current | Verified for customization taxonomy and parent-repository discovery guidance. |
| [VS Code Custom Agents Documentation](https://code.visualstudio.com/docs/copilot/customization/custom-agents) | Agent-specific structure and behavior constraints. | Supports interaction analysis for agent-vs-* pairs. | Yes | 2026-04-18 | Current | Used when conflicts involve agent routing, handoffs, or tool boundaries. |
| [VS Code Custom Instructions Documentation](https://code.visualstudio.com/docs/copilot/customization/custom-instructions) | Instruction-file scope, apply behavior, and precedence context. | Supports interaction analysis for instruction-vs-* pairs. | Yes | 2026-04-18 | Current | Used for apply-pattern and instruction-precedence interactions. |
| [VS Code Prompt Files Documentation](https://code.visualstudio.com/docs/copilot/customization/prompt-files) | Prompt file format, metadata behavior, and invocation model. | Supports interaction analysis for prompt-vs-* pairs. | Yes | 2026-04-18 | Current | Used for prompt routing, metadata, and output-contract interactions. |
| [VS Code Agent Skills Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-skills) | Skill packaging and discovery expectations. | Supports interaction analysis for skill-vs-* pairs and cross-skill boundaries. | Yes | 2026-04-18 | Current | Used when conflicts involve skill scope or invocation expectations. |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is sunset, inaccessible, or no longer relevant, set In Use to No and Current Status to Deprecated.
- Resolve any Needs Review source before publishing source-sensitive findings.