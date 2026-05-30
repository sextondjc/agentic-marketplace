---
name: generate-readme
description: 'Prompt to build a consolidated README from repository documentation, standards, and architecture sources.'
---
# README Generation Prompt

Route this request to `orchestrator`.
Use the `write-technical-docs` skill as the primary workflow.
Generate a concise, useful [README.md](./../../../README.md) from repository docs, architecture guidance, coding standards, testing strategy, and development workflow.

## Content Goals

- Explain what the project is and who it is for.
- Summarize the technology stack and notable versions when available.
- Provide a high-level architecture overview.
- Describe project structure and where important code lives.
- Include local setup, build, test, and run guidance when the information exists.
- Summarize coding standards, testing approach, and contribution expectations.

## Source Priorities

- Prefer [copilot-instructions.md](./../copilot-instructions.md) and `.github/instructions/*` for canonical standards.
- Use repository docs and architecture files for implementation details.
- Do not invent sections when source material is missing.

## Output Rules

- Keep the README readable for new contributors.
- Prefer clear headings, short paragraphs, and flat lists.
- Link to deeper docs instead of duplicating large internal guidance.

## Output Contract

Return output in this order:

1. Source inventory used for generation.
2. Coverage notes for missing information.
3. Final README content.
4. Follow-up gaps that require user input.

