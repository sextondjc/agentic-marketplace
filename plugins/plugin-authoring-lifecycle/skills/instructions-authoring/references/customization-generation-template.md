# Customization Generation Template

Use this template to generate customization artifacts with minimal tokens while preserving behavior.

This template is an authoring aid only. Every generated artifact MUST remain self-contained.

## Self-Contained Guardrail

- Do not move mandatory execution logic out of the target artifact.
- The target artifact must still be usable if this template is unavailable.

## Step 1: Route First

```markdown
Decision: <Agent | Instruction | Skill | No New Artifact>
Why: <one to three concrete reasons>
Target Path: <exact file path to create or update>
Alternative Rejected: <what was considered and why not selected>
```

## Step 2: Emit Minimum Valid Structure

### Instruction (`*.instructions.md`)

```markdown
---
name: <policy-domain>
description: '<Single sentence describing the policy scope.>'
applyTo: '<glob pattern from workspace root>'
---

# <Policy Domain Title>

## Rules
- <mandatory rule>
```

### Agent (`*.agent.md`)

```markdown
---
name: <agent-name>
description: '<Third-person role description with invocation conditions.>'
---

# <Agent Title> Agent

## Specialization

<One paragraph for lane and boundaries>

## Focus Areas
- <capability>

## Standards
- <instruction-file>.instructions.md

## Hard Constraints
- <non-negotiable limit>

## Preferred Companion Skills
- <skill-name> for <purpose>
```

### Skill (`SKILL.md`)

```markdown
---
name: <skill-name>
description: Use when <specific trigger conditions>
---

# <Skill Title>

## Specialization
<One narrow objective only>

## Trigger Conditions
- <concrete trigger>

## Inputs
- <required input>

## Required Outputs
- <concrete output>

## Workflow
1. <step>
2. <step>
3. <step>

## Done Criteria
- <verifiable completion condition>
```

## Step 3: Token Economy Pass

- Remove duplication first.
- Replace long narrative with concrete bullets or grids.
- Keep one idea per line.
- Keep examples only when they prevent ambiguity.
- Prefer references to reusable assets over repeated prose.

## Step 4: Validation Route

- For skills: run concision passes in `skills-authoring` as needed, then `audit-skill`.
- For agents: run concision passes in `agent-authoring` as needed, then `audit-agent`.
- For instructions: run concision passes in `instructions-authoring` as needed, then `audit-instructions`.

## Suggested Budget Targets

| Artifact | Target |
|---|---|
| Skill | Keep core workflow concise and avoid repeated policy text |
| Agent | Keep role boundaries explicit; avoid duplicating instruction content |
| Instruction | Keep policy-only rules; no workflows or narrative padding |
