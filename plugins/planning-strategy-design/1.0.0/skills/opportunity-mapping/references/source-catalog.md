# Source Catalog - opportunity-mapping

This catalog tracks the authoritative external sources used to keep this skill current and reusable.

| Source | What It Provides | Why It Is Valuable | In Use | Last Evaluated | Current Status | Notes |
|---|---|---|---|---|---|---|
| [Opportunity Solution Tree](https://www.producttalk.org/opportunity-solution-tree/) | Discovery structure linking outcomes, opportunities, solutions, and assumption tests | Canonical public reference for turning discovery into a machine-usable reasoning graph instead of a flat feature list | Yes | 2026-04-24 | Current | Primary method source for outcome -> opportunity -> solution -> test decomposition |
| [Shape Up](https://basecamp.com/shapeup) | Bounded shaping, appetite-driven scoping, and explicit no-go decisions | Reinforces tight scope boundaries and anti-sprawl behavior during discovery shaping | Yes | 2026-04-24 | Current | Used for boundary discipline and rejection logic |
| [Impact Mapping (Gojko Adzic)](https://impactmapping.org) | Outcome-to-impact-to-deliverable decomposition with explicit actor and behavior tracing | Bridges business goals and delivery scope by making the reasoning chain from outcome to feature explicit; strengthens outcome framing and rejection logic | Yes | 2026-05-06 | Current | Used for outcome-to-opportunity tracing and deliverable boundary discipline |
| [Story Mapping (Jeff Patton)](https://www.jpattonassociates.com/story-mapping/) | Backbone-and-walking-skeleton structure for mapping user journeys to delivery slices | Provides a user-narrative frame for opportunity decomposition; complements the solution-hypothesis register with user-journey context | Yes | 2026-05-06 | Current | Used for user-journey framing in opportunity and solution decomposition |

## Freshness Policy

- Default maximum age: 30 days.
- If Last Evaluated exceeds the threshold, set Current Status to Needs Review.
- If a source is no longer maintained or relevant, mark In Use as No and Current Status as Deprecated.