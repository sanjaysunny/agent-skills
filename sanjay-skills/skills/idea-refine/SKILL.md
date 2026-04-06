---
name: idea-refine
description: Sharpens raw ideas into buildable specs. Use before any new feature, architectural change, or squad initiative. Stops work that shouldn't start and clarifies work that should.
---

# Idea Refine

## Overview

A structured conversation that turns a vague idea into a concrete direction worth building.
For a bank engineering team: every idea has a cost (squad time, architecture debt, operational risk).
The purpose of this skill is to make that cost visible before it's spent.

## When to Use

- Someone says "we should build X" without a spec
- A squad is about to start something that touches shared architecture
- An ADR is needed but nobody has written the problem statement yet
- You're unsure if an idea is a real problem or a nice-to-have

## Phase 1: Understand & Sharpen

Restate the idea as a **How Might We** problem statement. Then ask:

1. **What problem does this solve for the engineer or user?** Not the feature — the problem.
2. **What does done look like?** Specific, observable, testable.
3. **Which approved architecture pattern does this align with?** If none — is a new pattern needed?
4. **What squad owns this end-to-end?** If multiple squads — who holds the contract?
5. **What's the cost of NOT doing this?** If the answer is "nothing" — challenge whether it should be built.

Do not proceed to variations until questions 1 and 2 are answered concretely.

## Phase 2: Generate Directions (5 max, not 20)

Use these lenses — pick the ones that fit, don't run all of them mechanically:

- **Simplification:** What's the version that's 10x simpler and still solves the real problem?
- **Pattern fit:** Which existing approved pattern handles 80% of this already?
- **Inversion:** What if we solved this by removing something rather than adding it?
- **Constraint removal:** What if we ignored the current tech stack — what's the ideal solution?
- **Squad boundary:** What if we drew the squad boundary differently — does the problem change?

For each direction, state:
- What it is
- Which approved pattern it uses (or why a new one is needed)
- The hardest part to build
- What it explicitly does NOT do

## Phase 3: Converge and Produce the One-Pager

```markdown
# [Idea Name]

## Problem Statement
[One-sentence How Might We]

## Recommended Direction
[Chosen direction, 2-3 paragraphs. Why this, why not the others.]

## Architecture Pattern
[Which approved pattern this follows. Link to patterns/ file.]

## Key Assumptions to Validate
- [ ] [Assumption — how to test it cheaply before building]

## MVP Scope
[Minimum version that tests the core assumption. What's in, what's out.]

## Not Doing (and Why)
- [Thing] — [reason]

## Squad Ownership
[Which squad builds it. Which squads are affected. Who holds the contract.]

## Open Questions for ADR Call
- [Anything requiring architectural committee sign-off]
```

## What Makes a Good Outcome

- The "Not Doing" list is longer than the "MVP Scope" list
- A pattern is named, not invented inline
- At least one assumption is identified that can be tested before full build
- Squad ownership is unambiguous
- If an ADR is needed, the open question is written clearly enough to table it

## Anti-Patterns

- Generating a long list of ideas instead of converging on a direction
- Skipping "what problem does this solve" because the solution feels obvious
- Proposing new architecture without checking the pattern library first
- Leaving squad ownership ambiguous ("we'll figure it out")
- Treating the one-pager as optional — it is the gate to Phase 2 (spec)
