---
name: architecture-patterns
description: Index of approved architecture patterns. Use when writing a spec, reviewing code, or proposing a new pattern. If your implementation doesn't reference a pattern from this index, it needs to.
---

# Architecture Patterns

## Overview

These are the approved patterns for [Bank Name] engineering.
Every spec must reference at least one. Every review checks conformance to one.

Patterns are not suggestions. They are decisions already made.
If you think a pattern is wrong, raise it at the ADR call — don't work around it inline.

## How to Use This Index

1. When writing a spec: find the pattern that fits, link to `patterns/[name].md`
2. When reviewing code: load the referenced pattern and check conformance
3. When adding a sample repo: update the pattern file with the reference implementation link
4. When proposing a new pattern: write the one-pager and bring it to the ADR call

## Pattern Index

Each entry: pattern name → what it solves → status → sample repo (add when available)

---

### API Patterns

| Pattern | Solves | Status | Sample Repo |
|---------|--------|--------|-------------|
| `rest-resource-api` | Standard CRUD API surface | ✅ Approved | _add link_ |
| `event-driven-api` | Async inter-squad communication | ✅ Approved | _add link_ |
| `contract-first-api` | Cross-squad API alignment | ✅ Approved | _add link_ |
| `bff-pattern` | Backend-for-frontend aggregation | ✅ Approved | _add link_ |

### Data Patterns

| Pattern | Solves | Status | Sample Repo |
|---------|--------|--------|-------------|
| `repository-pattern` | Data access abstraction | ✅ Approved | _add link_ |
| `event-sourcing` | Audit trail, temporal queries | ✅ Approved | _add link_ |
| `cqrs` | Read/write separation at scale | ✅ Approved | _add link_ |
| `outbox-pattern` | Reliable event publishing | ✅ Approved | _add link_ |

### Service Patterns

| Pattern | Solves | Status | Sample Repo |
|---------|--------|--------|-------------|
| `strangler-fig` | Incremental legacy migration | ✅ Approved | _add link_ |
| `saga-pattern` | Distributed transaction coordination | ✅ Approved | _add link_ |
| `circuit-breaker` | Resilience for external dependencies | ✅ Approved | _add link_ |
| `sidecar` | Cross-cutting concerns (logging, auth) | 🔄 Under Review | _add link_ |

### Frontend Patterns

| Pattern | Solves | Status | Sample Repo |
|---------|--------|--------|-------------|
| `feature-slice` | Frontend squad boundaries | ✅ Approved | _add link_ |
| `container-presenter` | UI/logic separation | ✅ Approved | _add link_ |

---

## Adding a Sample Repo to a Pattern

When Sanjay assigns a sample repo to a pattern:

1. Open `patterns/[pattern-name].md`
2. Add the repo link under `## Reference Implementation`
3. Add the key files to look at and what they demonstrate
4. Note any deviations from the pattern that are intentional (and why)

## Proposing a New Pattern

If your implementation genuinely requires a pattern not in this index:

1. Write a one-pager using the idea-refine skill
2. Add it to this index with status `🟡 Proposed`
3. Bring it to the next ADR call with the one-pager
4. Do not implement against a proposed pattern until it reaches `✅ Approved`

## Pattern File Structure

Each `patterns/[name].md` contains:

```markdown
# [Pattern Name]

## What It Solves
[One paragraph — the problem this pattern exists to solve]

## When to Use
[Conditions — what type of work this applies to]

## When NOT to Use
[Counter-indications — common misapplications]

## Structure
[Diagram or description of the components and their relationships]

## Reference Implementation
[Link to sample repo]
[Key files: what to look at and why]

## Rules
- Always: [...]
- Never: [...]

## Common Mistakes
[What goes wrong when engineers misapply this pattern]
```
