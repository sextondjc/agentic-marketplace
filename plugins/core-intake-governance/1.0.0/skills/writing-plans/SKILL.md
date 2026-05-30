---
name: writing-plans
description: Use when you have a spec or requirements for a multi-step task, before touching code
---

# Writing Plans

## Overview

Write comprehensive implementation plans that are durable, execution-ready, and traceable across sessions. Document everything needed to execute safely: files to touch, expected code changes, validation steps, and references required for context. Use DRY, YAGNI, TDD, and frequent commits.

Assume they are a skilled developer, but know almost nothing about our toolset or problem domain. Assume they don't know good test design very well.

**Announce at start:** "I'm using the writing-plans skill to create the implementation plan."

**Save plans to:** `.docs/plans/<domain>/<workstream>/<plan-name>.md`
- (User preferences for plan location override this default)

## Plan Stability Contract

Use this skill as the single source of truth for planning structure and quality gates.

- Do not create alternate planning templates in multiple assets.
- Keep mandatory policy in instructions and procedural detail in this skill.
- Update this skill only when one of these triggers occurs:
    - Repeated planning misses are found in review.
    - Lane ownership or routing policy changes.
    - A new required output type is introduced.

## Plan Folder Granularity

Plan artifacts must use granular folder hierarchy, not flat placement.

- Required minimum hierarchy: `.docs/plans/<domain>/<workstream>/<artifact>.md`
- Optional deeper hierarchy for large initiatives: `.docs/plans/<domain>/<program>/<workstream>/<artifact>.md`
- Keep each folder level lowercase and one word.
- Do not place plan files directly under `.docs/plans/` unless the user explicitly overrides this policy.

Examples:
- `.docs/plans/payments/reconciliation/retry-window-plan.md`
- `.docs/plans/governance/catalog/lane-mapping-remediation.md`

## Scope Check

If the spec covers multiple independent subsystems, it should have been broken into sub-project specs during brainstorming. If it wasn't, suggest breaking this into separate plans — one per subsystem. Each plan should produce working, testable software on its own.

## File Structure

Before defining tasks, map out which files will be created or modified and what each one is responsible for. This is where decomposition decisions get locked in.

- Design units with clear boundaries and well-defined interfaces. Each file should have one clear responsibility.
- You reason best about code you can hold in context at once, and your edits are more reliable when files are focused. Prefer smaller, focused files over large ones that do too much.
- Files that change together should live together. Split by responsibility, not by technical layer.
- In existing codebases, follow established patterns. If the codebase uses large files, don't unilaterally restructure - but if a file you're modifying has grown unwieldy, including a split in the plan is reasonable.

This structure informs the task decomposition. Each task should produce self-contained changes that make sense independently.

## Bite-Sized Task Granularity

**Each step is one action (2-5 minutes):**
- "Write the failing test" - step
- "Run it to make sure it fails" - step
- "Implement the minimal code to make the test pass" - step
- "Run the tests and make sure they pass" - step
- "Commit" - step

## Plan Document Header

**Every plan MUST start with this header:**

```markdown
# [Feature Name] Implementation Plan

> **For agentic workers:** REQUIRED WORKFLOW: Use the `plan-researcher` agent for planning handoff, then use `csharp-engineer` or `defect-debugger` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** [One sentence describing what this builds]

**Architecture:** [2-3 sentences about approach]

**Tech Stack:** [Key technologies/libraries]

---
```

## Required Plan Metadata

Every plan must include explicit metadata immediately after the header.

```markdown
## Metadata

- Plan ID: `plan-<domain>-<workstream>-<slug>-<yyyymmdd>`
- Workstream ID: `ws-<domain>-<workstream>`
- Lane: `Planning`
- Owner: `<role-or-agent>`
- Scope: `<in-scope summary>`
- Out of Scope: `<out-of-scope summary>`
- Dependencies: `<list or none>`
- Acceptance Inputs: `<linked requirements, ADRs, or decision notes>`
```

This metadata is mandatory for deterministic handoff and later review.

## Planning Quality Gate (Pre-Execution)

Before any execution starts, the plan must pass all six checks.

```markdown
## Quality Gate

- [ ] QG1 Scope Boundaries: In-scope and out-of-scope are explicit and non-overlapping.
- [ ] QG2 Traceability IDs: Plan ID and Workstream ID are present and used consistently.
- [ ] QG3 File-Level Mapping: Tasks list concrete create/modify/test file targets.
- [ ] QG4 Verification Steps: Each task includes runnable validation commands and expected outcomes.
- [ ] QG5 Handoff Completeness: Dependencies, assumptions, and risks are listed with owners.
- [ ] QG6 Acceptance Coverage: Every requirement maps to one or more tasks with no gaps.
```

If any check is unchecked, the plan is not execution-ready.

## Task Structure

````markdown
### Task N: [Component Name]

**Files:**
- Create: `exact/path/to/file.py`
- Modify: `exact/path/to/existing.py:123-145`
- Test: `tests/exact/path/to/test.py`

- [ ] **Step 1: Write the failing test**

```python
def test_specific_behavior():
    result = function(input)
    assert result == expected
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/path/test.py::test_name -v`
Expected: FAIL with "function not defined"

- [ ] **Step 3: Write minimal implementation**

```python
def function(input):
    return expected
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest tests/path/test.py::test_name -v`
Expected: PASS

- [ ] **Step 5: Commit**

```bash
git add tests/path/test.py src/path/file.py
git commit -m "feat: add specific feature"
```
````

## No Placeholders

Every step must contain the actual content an engineer needs. These are **plan failures** — never write them:

## Self-Review

After writing the complete plan, look at the spec with fresh eyes and check the plan against it. This is a checklist you run yourself — not a subagent dispatch.

**1. Spec coverage:** Skim each section/requirement in the spec. Can you point to a task that implements it? List any gaps.

**2. Placeholder scan:** Search your plan for red flags — any of the patterns from the "No Placeholders" section above. Fix them.

**3. Type consistency:** Do the types, method signatures, and property names you used in later tasks match what you defined in earlier tasks? A function called `clearLayers()` in Task 3 but `clearFullLayers()` in Task 7 is a bug.

If you find issues, fix them inline. No need to re-review — just fix and move on. If you find a spec requirement with no task, add the task.

## Minimal Maintenance Cadence

To avoid endless revisits, use a lightweight maintenance loop.

1. Revalidate this skill quarterly or after a major planning miss.
2. Only patch sections impacted by a trigger condition.
3. Preserve existing template contracts unless a policy change requires a version bump.
4. Record significant planning-process changes in a decision artifact before changing this skill.

## Execution Handoff

After saving the plan, offer execution choice:

**"Plan complete and saved to `.docs/plans/<domain>/<workstream>/<filename>.md`. Two execution options:**

**1. Agent-Routed (recommended)** - Route each task through `orchestrator` to the right specialist and review between tasks.

**2. Inline Execution** - Execute tasks in this session directly, with checkpoint reviews between batches.

**Which approach?"**

**If Agent-Routed chosen:**
- **REQUIRED AGENT:** Use `orchestrator` to route each task.
- Use specialist agents for each task and run a review after each logical chunk.

**If Inline Execution chosen:**
- Follow this plan in order with explicit test and validation checkpoints after each task.

## Trigger Conditions

Invoke this skill when any of the following is true:

- The user has a multi-step task or spec and needs an implementation plan.
- Execution should not begin until a durable, traceable plan exists.
- The work needs explicit task decomposition and handoff context.

## Hard Constraint

- Never create root-level folders in any workspace.
- Never create top-level reference folders; keep references under owning asset paths.

## Inputs

- User request context and target scope for this skill invocation.

## Required Outputs

- A concrete, workspace-applicable result aligned with this skill purpose.
- A completed Quality Gate section with all checks passing before execution handoff.

## Workflow

1. Gather required context and constraints from the workspace and user request.
2. Execute the skill-specific steps and produce the required artifacts or decisions.
3. Validate outputs for completeness and consistency with active workspace instructions.


