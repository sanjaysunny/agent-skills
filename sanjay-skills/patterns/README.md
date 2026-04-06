# Pattern Library

This directory contains the canonical architecture patterns for [Bank Name] engineering.
Each pattern is a decision already made. Reference them in specs, enforce them in reviews.

## Adding a Pattern File

Use this structure for each `patterns/[name].md`:

```markdown
# [Pattern Name]

## What It Solves
## When to Use
## When NOT to Use
## Structure
## Reference Implementation   ← add sample repo here
## Rules
## Common Mistakes
```

## Adding a Sample Repo

When Sanjay assigns a sample repo to a pattern:
1. Add the repo link under `## Reference Implementation`
2. Note the 3-5 key files worth studying
3. Note any intentional deviations from the pure pattern

## Current Patterns

See `skills/architecture-patterns/SKILL.md` for the full index with status.

Patterns go here as individual files:
- `rest-resource-api.md`
- `event-driven-api.md`
- `repository-pattern.md`
- `outbox-pattern.md`
- ... (add as written)
