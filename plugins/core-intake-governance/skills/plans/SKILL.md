---
name: plans
description: Use when you have a written implementation plan to execute in a separate session with review checkpoints
---

# Executing Plans

## Overview

Load plan, review critically, execute all tasks, report when complete.

**Announce at start:** "I'm using the plans skill to implement this plan."

**Execution mode selection:**

| Situation | Mode |
|---|---|
| Subagents are available in the current session | Use per-task subagent dispatch (preferred) |
| Working in an environment without subagent support | Execute tasks directly in-session |
| Executing the plan in a separate, dedicated session | Use checkpointed task execution with explicit status updates |
| Requires a human-in-loop checkpoint between tasks | Pause between tasks for explicit confirmation |

## The Process

### Step 1: Load and Review Plan
1. Read plan file
2. Review critically - identify any questions or concerns about the plan
3. If concerns: Raise them with your human partner before starting
4. If no concerns: Create TodoWrite and proceed

### Step 2: Execute Tasks

For each task:
1. Mark as in_progress
2. Follow each step exactly (plan has bite-sized steps)
3. Run verifications as specified
4. Mark as completed

### Step 3: Complete Development

After all tasks complete and verified:
- **REQUIRED:** Keep execution self-contained within this skill. Do not delegate execution to sibling skills.
- Verify tests, present completion options, and execute the selected choice

## When to Stop and Ask for Help

**STOP executing immediately when:**
- Hit a blocker (missing dependency, test fails, instruction unclear)
- Plan has critical gaps preventing starting
- You don't understand an instruction
- Verification fails repeatedly

**Ask for clarification rather than guessing.**

## When to Revisit Earlier Steps

**Return to Review (Step 1) when:**
- Partner updates the plan based on your feedback
- Fundamental approach needs rethinking

**Don't force through blockers** - stop and ask.

## Remember
- Review plan critically first
- Follow plan steps exactly
- Don't skip verifications
- Reference skills when plan says to
- Stop when blocked, don't guess
- Never start implementation on main/master branch without explicit user consent

## Integration

This skill is fully self-contained and includes its own review, verification, and completion handoff process.

## Trigger Conditions

Invoke this skill when any of the following is true:

- An approved plan exists and execution will happen through a dedicated or later session.
- The work needs checkpointed progress against a saved plan.
- Execution must preserve a durable handoff boundary between sessions.

## Inputs

- Approved plan path.
- Current execution constraints and branch context.
- Any known blockers or pending decisions.

## Required Outputs

- Task-by-task execution status updates.
- Verification outcomes for completed tasks.
- Branch completion handoff once execution is done.

## Workflow

1. Load and critically review the plan.
2. Execute tasks in order with explicit verification.
3. Stop and ask for guidance when blocked.
4. Complete branch handoff actions after all tasks pass.



