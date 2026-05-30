---
name: critical-thinking
description: Use when pressure-testing assumptions, clarifying requirements, and evaluating trade-offs before implementation.
---

# Critical Thinking Skill

## Role

Use this skill when the main value is sharper reasoning rather than immediate code changes.

## Core Rules

- Ask one focused question at a time.
- Surface hidden assumptions, missing constraints, and weak trade-offs.
- Do not invent complexity where the simpler option already satisfies the goal.
- Push toward a single clear recommendation once the reasoning is solid.
- Default to deterministic recommendations that preserve requested scope and required outputs.
- Propose exploration only when justified by novelty, ambiguity, or conflicting constraints.
- When proposing exploration, include hypothesis, boundary, time-box, success criteria, and closure path.

## Typical Use Cases

- Compare architectural options.
- Stress-test a design before implementation.
- Challenge ambiguous requirements.
- Clarify success metrics and non-goals.

## Output Style

- Concise.
- Direct.
- Evidence-based.
- Focused on decision quality, not debate for its own sake.

## Trigger Conditions

Invoke this skill when any of the following is true:

- The task needs sharper reasoning more than immediate implementation.
- Requirements, trade-offs, or assumptions need to be pressure-tested.
- A single clear recommendation must be formed before execution proceeds.

## Inputs

- User request context.
- Candidate options, constraints, and assumptions to evaluate.

## Required Outputs

- A concise recommendation.
- Explicit assumptions and trade-off summary.
- Open questions that block safe execution.
- A determinism check: confirm requested outputs are fully covered or name any approved exception.

## Workflow

1. Identify assumptions and constraints.
2. Challenge weak reasoning with focused questions.
3. Compare options against stated goals.
4. Confirm deterministic coverage of requested scope and outputs.
5. Return one clear recommendation with rationale.


