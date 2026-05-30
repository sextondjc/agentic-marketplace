---
name: write-component-docs
description: 'Create comprehensive, standardized documentation for object-oriented components following industry best practices and architectural documentation standards.'
---
# Generate Standard OO Component Documentation

Route this request to `orchestrator`.

Use the `write-technical-docs` skill as the primary workflow.

Create comprehensive documentation for the object-oriented component(s) at: `${input:ComponentPath}`.

Analyze the component by examining code in the provided path. If folder, analyze all source files. If single file, treat as main component and analyze related files in same directory.

## Documentation Standards

- DOC-001: Follow C4 Model documentation levels (Context, Containers, Components, Code)
- DOC-002: Align with Arc42 software architecture documentation template
- DOC-003: Comply with IEEE 1016 Software Design Description standard
- DOC-004: Use Agile Documentation principles (just enough documentation that adds value)
- DOC-005: Target developers and maintainers as primary audience

## Analysis Instructions

- ANA-001: Determine path type (folder vs single file) and identify primary component
- ANA-002: Examine source code files for class structures and inheritance
- ANA-003: Identify design patterns and architectural decisions
- ANA-004: Document public APIs, interfaces, and dependencies
- ANA-005: Recognize creational/structural/behavioral patterns
- ANA-006: Document method parameters, return values, exceptions
- ANA-007: Assess performance, security, reliability, maintainability
- ANA-008: Infer integration patterns and data flow

## Language-Specific Optimizations

- LNG-001: **C#/.NET** - async/await, dependency injection, configuration, disposal
- LNG-002: **Java** - Spring framework, annotations, exception handling, packaging
- LNG-003: **TypeScript/JavaScript** - modules, async patterns, types, npm
- LNG-004: **Python** - packages, virtual environments, type hints, testing

## Error Handling

- ERR-001: Path doesn't exist - provide correct format guidance
- ERR-002: No source files found - suggest alternative locations
- ERR-003: Unclear structure - document findings and request clarification
- ERR-004: Non-standard patterns - document custom approaches
- ERR-005: Insufficient code - focus on available information, highlight gaps

## Output Format

Generate well-structured Markdown with clear heading hierarchy, code blocks, tables, bullet points, and proper formatting for readability and maintainability.

## File Location

The documentation should be saved in the `/.docs/components/` directory and named according to the convention: `[component-name]-documentation.md`.

## Workspace Alignment

- Prefer concise, maintainable documentation over exhaustive boilerplate.
- Keep generated documentation aligned with `.docs` as the canonical documentation root.
- Prioritize actual code structure and current behavior over assumed architecture.

## Required Documentation Structure

Use the canonical `write-technical-docs` skill templates and include, at minimum, these sections:

1. Component Overview
2. Architecture and Dependencies (include Mermaid diagram)
3. Interface Reference (methods/properties table)
4. Implementation Details
5. Usage Examples
6. Quality Attributes
7. Reference Information

Required metadata fields in doc frontmatter:

- `title`
- `component_path`
- `date_created`

Optional metadata fields:

- `version`
- `last_updated`
- `owner`
- `tags`

Keep this prompt as routing plus output contract only; detailed templates belong in skill references.

