---
name: spec-driven-development
description: Enforces a spec gate before any code is written. Use when starting any feature, change, or initiative that touches more than one file. No spec, no code.
---

# Spec-Driven Development

## Overview

No code without a spec. This is not a suggestion.

A spec is the contract between the engineer and the team. It defines what's being built,
why, which architecture pattern it follows, and how we'll know it's done.
Code without a spec is a liability — it can't be reviewed, it can't be coordinated,
and it can't be rolled back cleanly.

## The Gate

```
IDEA → SPEC → [Director/Architect Review] → TASKS → CODE → REVIEW → MERGE
         ↑                  ↑
    Gate 1: spec        Gate 2: sign-off
    must exist          required for arch changes
```

Gate 1 applies to everything. Gate 2 applies to any change that:
- Introduces a new pattern not in the approved library
- Changes a cross-squad API contract
- Touches shared infrastructure
- Would require an ADR

## Spec Format

```markdown
# Spec: [Feature Name]

## Problem
[One sentence. What breaks or is missing without this?]

## Architecture Pattern
[Name the approved pattern from patterns/. If no pattern exists, stop — raise at ADR call.]
[Link: patterns/[pattern-name].md]

## Tech Stack
[Language, framework, key libraries with versions]

## Commands
- Build: [command]
- Test: [command]
- Lint: [command]

## What We're Building
[2-3 paragraphs. What it does, what it does NOT do, and why.]

## Data Model
[Key entities, relationships, schema changes if any]

## API Contract
[Endpoints or interfaces. If cross-squad, this must be agreed before either squad builds.]

## Success Criteria
[Specific, testable conditions. Not "works correctly" — "returns 200 with X when Y"]

## Not Building (and Why)
- [Thing] — [reason]

## Squad Ownership
[Who builds it. Who is affected. Who reviews the contract.]

## Testing Strategy
[Unit, integration, e2e — what level for what concern]

## Risks
[What could go wrong. What's the rollback plan.]

## Open Questions
[Anything unresolved. If it's blocking, resolve it before implementation.]
```

## Assumptions — Surface Them Early

Before writing any spec content, list your assumptions explicitly:

```
ASSUMPTIONS I'M MAKING:
1. This follows the [pattern name] pattern
2. The database is [X], schema is managed by [Y]
3. Auth is handled by [service] — we are not re-implementing it
→ Correct any of these before I proceed.
```

Wrong assumptions caught at spec time cost nothing.
Wrong assumptions caught at review time cost hours.
Wrong assumptions caught in production cost incidents.

## What a Good Spec Does NOT Look Like

- Vague success criteria ("works correctly", "is fast", "handles errors")
- No pattern reference — if you don't know which pattern, stop and find out
- Missing "Not Building" section — if you didn't say no to anything, the scope isn't clear
- No rollback plan for anything touching production data
- Squad ownership left as "TBD"

## Sample Repos

When a sample repo is available for the referenced pattern, load it:

```
"Here's an implementation of the [pattern name] pattern:
[sample-repo link or path]
Follow the structure, naming conventions, and error handling shown there."
```

This is the fastest way to get consistent implementations across squads.

## Keeping the Spec Alive

- Update the spec when requirements change — before changing the code
- Commit the spec to the repo alongside the code
- Reference the spec in the PR description
- If the spec and code diverge, the spec wins — fix the code, not the spec
