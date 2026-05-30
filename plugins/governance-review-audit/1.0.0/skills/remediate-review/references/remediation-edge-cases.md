# Remediation Edge Cases

Use this reference when review feedback is technically ambiguous or conflicting.

## Typical Edge Cases

- Feedback conflicts with explicit workspace policy.
- Suggested change introduces behavior regression.
- Recommendation assumes libraries or patterns not used in this repository.
- Reviewer asks for speculative complexity (YAGNI risk).
- Two reviewer comments conflict and cannot both be applied.

## Decision Pattern

1. Identify conflict type.
2. Verify against repository evidence.
3. Choose disposition: accept, reject, or clarify.
4. Document technical rationale with references.

## Pushback Template

- "I cannot apply this as-is because it conflicts with <policy/constraint>."
- "Evidence from <file> shows the current behavior is required for <reason>."
- "Proposed alternative: <minimal-change option> that preserves constraints."