# Routing Decision Output Template

Use this structure when returning a routing decision from the `customization-routing-decision` skill.

```markdown
Decision: <Agent | Instruction | Skill | No New Artifact>
Why: <one to three concrete reasons>
Target Path: <exact file path to create or update>
Alternative Rejected: <what was considered and why not selected>
```

## Field Guidance

| Field | Required | Notes |
|---|---|---|
| Decision | Yes | Exactly one of: Agent, Instruction, Skill, No New Artifact |
| Why | Yes | One to three concrete reasons grounded in the Decision Flow |
| Target Path | Yes | Full workspace-relative path including filename and extension |
| Alternative Rejected | Yes | At least one alternative considered and why it was ruled out |
