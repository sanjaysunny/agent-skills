# Placeholders — Things To Fill In

Work through this list before rolling this pack out to your team.
Grouped by priority: do the top section first, rest can follow.

---

## 1. Global — Do First

These appear everywhere. Fix them once and the whole pack is consistent.

| Placeholder | File(s) | What to put |
|-------------|---------|-------------|
| `[Bank Name]` | `CLAUDE.md`, `README.md`, `agents/reviewer.md`, `patterns/README.md`, `skills/architecture-patterns/SKILL.md` | Your actual bank or division name |

---

## 2. Pattern Library — Most Important Work

Each row in the pattern index needs a sample repo link and a `patterns/[name].md` file.
Share a repo with me and I'll write the pattern file from it.

### API Patterns

| Pattern | Sample Repo Link | Pattern File |
|---------|-----------------|--------------|
| `rest-resource-api` | _add link_ | `patterns/rest-resource-api.md` — not created yet |
| `event-driven-api` | _add link_ | `patterns/event-driven-api.md` — not created yet |
| `contract-first-api` | _add link_ | `patterns/contract-first-api.md` — not created yet |
| `bff-pattern` | _add link_ | `patterns/bff-pattern.md` — not created yet |

### Data Patterns

| Pattern | Sample Repo Link | Pattern File |
|---------|-----------------|--------------|
| `repository-pattern` | _add link_ | `patterns/repository-pattern.md` — not created yet |
| `event-sourcing` | _add link_ | `patterns/event-sourcing.md` — not created yet |
| `cqrs` | _add link_ | `patterns/cqrs.md` — not created yet |
| `outbox-pattern` | _add link_ | `patterns/outbox-pattern.md` — not created yet |

### Service Patterns

| Pattern | Sample Repo Link | Pattern File |
|---------|-----------------|--------------|
| `strangler-fig` | _add link_ | `patterns/strangler-fig.md` — not created yet |
| `saga-pattern` | _add link_ | `patterns/saga-pattern.md` — not created yet |
| `circuit-breaker` | _add link_ | `patterns/circuit-breaker.md` — not created yet |
| `sidecar` | _add link_ | `patterns/sidecar.md` — not created yet (status: Under Review) |

### Frontend Patterns

| Pattern | Sample Repo Link | Pattern File |
|---------|-----------------|--------------|
| `feature-slice` | _add link_ | `patterns/feature-slice.md` — not created yet |
| `container-presenter` | _add link_ | `patterns/container-presenter.md` — not created yet |

---

## 3. Pattern Index — Review and Prune

**File:** `skills/architecture-patterns/SKILL.md`

The pattern list above was generated from common banking/enterprise patterns.
You may not use all of them. Before rolling out:

- [ ] Remove any patterns your team doesn't actually use
- [ ] Add any patterns that are missing from the list
- [ ] Confirm `sidecar` is still "Under Review" or change its status

---

## 4. Reviewer Agent — Calibration

**File:** `agents/reviewer.md`

- [ ] Run the reviewer against 5 recent PRs that caused bugs or incidents
- [ ] Check what it would have flagged vs. what actually happened
- [ ] If it's missing real issues, come back and we'll tune the pattern references

---

## 5. CLAUDE.md — Adjust for Your Team

**File:** `CLAUDE.md`

- [ ] Review the "Non-Negotiables" section — add or remove rules that don't fit
- [ ] Review the ADR call cadence — how often does the committee meet? Is the process described accurately?
- [ ] Confirm the squad coordination rules match how your squads actually work

---

## 6. Pilot Squad

**Not a file — a decision:**

- [ ] Pick one squad to pilot this with for two sprints
- [ ] Copy `CLAUDE.md` into one of their repos
- [ ] Watch what the reviewer flags in their next 5 PRs
- [ ] Tune based on what it gets right and wrong

---

## Summary: Minimum to Go Live

1. Replace `[Bank Name]` everywhere
2. Add at least 3 sample repos to the pattern library (the ones your squads use most)
3. Create the corresponding `patterns/[name].md` files (share repos and I'll write them)
4. Remove patterns from the index that your team doesn't use
5. Drop `CLAUDE.md` into one pilot squad's repo
