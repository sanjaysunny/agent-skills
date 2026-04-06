---
name: planning-and-task-breakdown
description: Breaks a signed-off spec into tasks with clear ownership, dependencies, and squad coordination points. Use after spec is approved, before implementation begins.
---

# Planning and Task Breakdown

## Overview

A spec tells you what to build. A plan tells you in what order and who does what.
For a multi-squad bank team, the plan is also a coordination contract — it makes
dependencies visible before they become blockers.

## Input Required

- A signed-off spec (spec gate must be passed)
- Named squad owner(s)
- Any cross-squad dependencies identified

If the spec isn't signed off, stop. Don't plan unconfirmed work.

## Task Structure

Each task must have:

```markdown
- [ ] Task: [Description — verb + noun, e.g. "Implement payment validation endpoint"]
  - Owner: [Squad or engineer name]
  - Pattern: [Which approved pattern section this follows]
  - Acceptance: [What must be true when done — specific and testable]
  - Verify: [How to confirm — test command, manual check, or both]
  - Files: [Which files will be touched — max 5, if more, split the task]
  - Depends on: [Task ID or "none"]
  - Cross-squad: [yes/no — if yes, contract must be agreed before this task starts]
```

## Decomposition Rules

**One task = one logical change.** If you can't describe it in one verb-noun phrase, split it.

**Five files max per task.** More than five files means the task is doing too many things.

**Cross-squad tasks go last in dependency order, first in communication order.**
Identify them early. Agree the contract. Then build on both sides independently.

**Risk-first ordering:** If a task is uncertain or technically risky, put it first.
Discovering a blocker on task 8 of 10 is expensive. Discovering it on task 1 is free.

## Dependency Mapping

Before finalizing tasks, draw the dependency chain:

```
Task 1 (DB schema) → Task 2 (data layer) → Task 3 (API endpoint)
                                                      ↓
                                         Task 4 (frontend — cross-squad)
```

Tasks with no upstream dependencies can run in parallel across squads.
Tasks with upstream dependencies cannot start until the upstream is merged and verified.

## Squad Coordination Checklist

Before any cross-squad task begins:

- [ ] API contract is defined (OpenAPI spec or typed interface)
- [ ] Both squads have reviewed and signed off the contract
- [ ] Contract is committed to a shared location both squads can reference
- [ ] A contact from each squad is named for integration questions

If the contract isn't agreed, the cross-squad task doesn't start. Period.

## Task Sizing

| Size | Lines changed | Time | Split if... |
|------|--------------|------|-------------|
| Small | < 50 | < 2h | Never |
| Medium | 50–200 | 2–4h | Rarely |
| Large | 200–500 | 4–8h | Consider it |
| Too large | > 500 | > 1 day | Always split |

## Output Format

Produce the full task list as a markdown checklist in the spec file under a `## Tasks` heading.
Tasks are ordered by dependency, not by perceived importance.

## Verification Before Implementation Starts

- [ ] Every task has acceptance criteria that are specific and testable
- [ ] Every task has a named owner (squad or engineer)
- [ ] Cross-squad dependencies are identified and contracts agreed
- [ ] The riskiest task is scheduled first
- [ ] No task touches more than 5 files
- [ ] The full list has been reviewed by the architect (Sanjay) for pattern alignment
