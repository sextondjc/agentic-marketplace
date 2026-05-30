# Review Response Examples

## Clarification Before Action

```text
I understand items 1, 2, and 4. Item 3 is ambiguous about expected behavior under timeout. Please clarify item 3 before I start implementation.
```

## Technical Pushback

```text
I verified this suggestion against current compatibility targets. Removing the fallback path would break supported platform versions, so I am keeping the fallback and applying only the bundle identifier fix.
```

## Corrective Follow-Through

```text
Verified your point on null handling in this path. I updated the guard and added regression coverage for the null case.
```

## YAGNI Disposition

```text
I searched usage and found no callers for this endpoint. Recommend removing it instead of adding new export features unless there is external usage not present in this repository.
```

## Multi-Item Disposition Template

| Item | Disposition | Reason | Next Action |
|---|---|---|---|
| 1 | Accept | Reproducible defect | Implement and test |
| 2 | Needs clarification | Ambiguous expected behavior | Ask reviewer |
| 3 | Reject | Breaks compatibility target | Document rationale |
