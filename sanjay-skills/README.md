# Sanjay's Engineering Intelligence Pack

Engineering standards and AI skills for [Bank Name] engineering teams.
Authored by the Director of Architecture.

## What This Is

A repo of skills, review agents, and pattern references that embed architecture decisions
into every AI-assisted development session. When a developer opens Claude Code on any repo,
these standards are loaded automatically.

## Structure

```
CLAUDE.md                          ← Load this into every project repo
skills/
  idea-refine/SKILL.md            ← Sharpen ideas before writing specs
  spec-driven-development/SKILL.md ← Spec gate before any code
  code-review-and-quality/SKILL.md ← Real reviews, five axes
  planning-and-task-breakdown/SKILL.md ← Task decomposition with squad coordination
  architecture-patterns/SKILL.md  ← Pattern index and governance
agents/
  reviewer.md                     ← AI reviewer persona, calibrated to our patterns
patterns/
  README.md                       ← How to add pattern files and sample repos
  [pattern-name].md               ← One file per approved pattern (add as written)
references/                       ← Checklists and supporting material
```

## How to Use

### For a new project repo

Copy `CLAUDE.md` into the root of the project repo. Update the bank name and any
project-specific boundaries. Claude Code loads it automatically at session start.

### For a new feature

```
1. /idea-refine    → sharpen the idea, produce the one-pager
2. /spec           → write the spec, reference a pattern, get sign-off
3. /plan           → break into tasks with squad ownership
4. [build]         → implement incrementally
5. /review         → run the five-axis review before requesting approval
```

### For a code review

```
/review
```

Or: load `agents/reviewer.md` and provide the PR diff + spec + pattern file.

### For a new architecture pattern

1. Write the one-pager using idea-refine
2. Add to `skills/architecture-patterns/SKILL.md` as `🟡 Proposed`
3. Bring to ADR call
4. On approval: create `patterns/[name].md`, add sample repo link, update status to `✅ Approved`

## Adding Sample Repos

Sanjay assigns sample repos to patterns. When a sample repo is added:
1. Open `patterns/[pattern-name].md`
2. Add the repo link under `## Reference Implementation`
3. Note the 3-5 key files to study
4. The reviewer agent picks this up automatically on next use

## Principles

- Senior engineers reviewing senior engineers — peer standard, not policing
- Patterns are decisions already made — implement them, don't reinvent them
- Spec first, always — code without a spec is a liability
- Real reviews only — a blind approval is worse than no review
- Architecture violations are blocking — no exceptions, raise it at the ADR call
