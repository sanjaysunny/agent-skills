---
name: code-review-and-quality
description: Runs a real five-axis code review. Use on every PR before requesting approval. Blind approvals are not approvals. Architecture conformance is always blocking.
---

# Code Review and Quality

## Overview

Code review is broken when it becomes a social courtesy instead of an engineering discipline.
A blind approval is worse than no review — it creates false confidence.

This skill runs a structured review across five axes. Every PR gets it.
The AI runs it first. Humans verify the findings.

## The Five Axes

### 1. Correctness
- Does the code do exactly what the spec says? Read the spec first.
- Are edge cases handled: null, empty, boundary values, concurrent access, error paths?
- Do the tests actually verify the behavior — or just execute code without asserting?
- Is there any state that can become inconsistent?

### 2. Architecture Conformance (Always Blocking)
- Which approved pattern does this follow? Name it explicitly.
- Load `patterns/[pattern-name].md` and check the implementation against it.
- If it deviates — is the deviation documented and justified? If not, it's a blocking issue.
- Are module boundaries maintained? No circular dependencies.
- Are cross-squad contracts respected — no silent changes to shared interfaces.

### 3. Security
- Is all input validated at system boundaries? (Not just "checked" — validated against a schema.)
- Are secrets out of code, logs, environment variables that get committed?
- Is authentication checked? Is authorization checked? They are not the same thing.
- Are queries parameterized? Is output encoded?
- Any new dependency with a known CVE?

### 4. Readability
- Can another senior engineer on a different squad understand this without a walkthrough?
- Are names accurate — does the name describe what the thing actually does?
- Is the control flow followable — no deeply nested conditionals, no magic numbers?
- Are the tests readable — do they document intent, not just cover lines?

### 5. Performance
- Any N+1 query patterns?
- Any unbounded data fetch (no pagination, no limit)?
- Any synchronous blocking I/O where async is required?
- Any operation that could degrade under load that isn't load-tested?

## Review Output Format

```markdown
## Review: [PR Title]

**Verdict:** APPROVE | REQUEST CHANGES | BLOCKING

**Spec checked:** [yes — link] | [no spec found — blocking]
**Pattern referenced:** [pattern name] | [no pattern — blocking]

### Blocking Issues
- [file:line] [what's wrong and what to do instead]

### Should Fix Before Merge
- [file:line] [what's wrong and recommended fix]

### Suggestions
- [file:line] [optional improvement]

### What's Done Well
- [specific observation — always include at least one]
```

## How to Run This Review

In Claude Code, with the PR diff or changed files loaded:

```
/review
```

Or invoke directly:
```
"Review this PR against the [pattern name] pattern.
Spec is at [path]. Load it first.
Flag any architecture deviation as blocking."
```

## When Architecture Conformance Blocks

If the implementation doesn't follow an approved pattern:

1. Name the deviation specifically — "this uses X but the approved pattern requires Y"
2. Don't soften it — "this is a blocking issue"
3. Provide the path forward — "follow [pattern-name].md section Z, or raise a new pattern at the ADR call"

Architectural debt added in one PR is architectural debt the whole squad carries.
It is not unkind to block a PR. It is unkind to approve one that creates problems for everyone.

## What a Real Review Is Not

- Reading the diff and clicking approve because it looks fine
- Commenting only on style and naming while missing logic errors
- Approving because the author is senior — seniority doesn't exempt code from review
- Leaving only positive comments to avoid conflict
- Marking reviewed without loading the spec

## Sample Repo Usage

If the PR references a sample repo pattern, load the sample:

```
"Compare this implementation to the reference at [sample-repo].
Flag anywhere the structure, error handling, or naming diverges without justification."
```

## Calibration

Run this review agent against 5 recent PRs that caused incidents.
Check what it would have flagged. If it misses the real issues, tune the pattern references.
If it flags the right things, you have a calibrated reviewer.
