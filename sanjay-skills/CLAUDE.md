# Sanjay's Engineering Intelligence Pack

This is the team engineering standard for [Bank Name] — authored by the Director of Architecture.
These rules travel with every repo. Every AI-assisted session loads them automatically.

## Who This Is For

Senior engineers building production systems. Tone is peer-to-peer.
No hand-holding. High expectations. Direct feedback is a sign of respect.

## Skill Pack Structure

```
skills/               → Customized engineering skills
  idea-refine/        → Idea sharpening before any work begins
  spec-driven-dev/    → Spec gate — no code without a signed-off spec
  code-review/        → Real reviews, not rubber stamps
  planning/           → Task breakdown with squad coordination
  architecture-patterns/ → Approved patterns index
agents/               → AI personas (reviewer, architect)
patterns/             → Canonical architecture patterns (add sample repos here)
references/           → Checklists and supporting material
```

## Non-Negotiables

- **Always:** Write a spec before writing code. Reference at least one approved pattern.
- **Always:** Run `/review` before requesting a PR approval. Blind approvals are not approvals.
- **Always:** Link to the ADR or pattern your implementation follows.
- **Ask first:** Introducing a new pattern not in the approved library.
- **Ask first:** Cross-squad API contract changes.
- **Never:** Merge without a real review — AI review counts, rubber stamp does not.
- **Never:** Invent architecture inline. If the pattern doesn't exist, raise it in the ADR call.

## Architecture Patterns

Approved patterns live in `patterns/`. Each pattern includes:
- What it is and when to use it
- A reference implementation (sample repo)
- What NOT to do (and why)

When writing a spec or reviewing code, load the relevant pattern file.

## Review Standard

The review agent (`agents/reviewer.md`) runs five axes:
1. Correctness — does it do what the spec says?
2. Architecture — does it follow an approved pattern?
3. Security — input validation, secrets, auth
4. Readability — can another senior engineer understand this without explanation?
5. Performance — no N+1s, no unbounded queries, no blocking I/O where async is needed

**Architecture conformance is blocking.** The other four axes have severity levels.

## Squad Coordination

Before any cross-squad work:
- Define the API contract first (OpenAPI or typed interface)
- Both squads sign off on the contract before either builds
- Contract changes go through the same spec gate as new features
