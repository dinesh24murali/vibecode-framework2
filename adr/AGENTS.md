# adr/ — AGENTS.md

## Purpose

Architecture Decision Records (ADRs) document significant technical decisions made during the project. They create a permanent, searchable history of *why* things were built the way they were.

## When to Create an ADR

Create an ADR when a decision:
- Is hard to reverse (framework choice, database schema, auth strategy)
- Affects multiple teams or components
- Has meaningful trade-offs worth recording
- Was debated and a specific option was chosen over alternatives
- Will confuse future contributors if unexplained

Do **not** create ADRs for routine implementation details.

## Naming Convention

```
adr/NNNN-short-slug.md
```

- `NNNN` is a zero-padded 4-digit number (0001, 0002, ...)
- `short-slug` is a kebab-case description (3-5 words)
- Examples: `0001-use-postgresql.md`, `0002-jwt-auth-strategy.md`

## How to Create an ADR

```bash
make adr SLUG=my-decision
```

This copies `adr/template.md` to `adr/NNNN-my-decision.md`.

## Status Values

- `Proposed` — under discussion
- `Accepted` — decided and in effect
- `Deprecated` — superseded by a newer ADR
- `Superseded by ADR-NNNN` — link to replacement

## Rules for AI Tools

- Reference ADRs in task files when implementing a decision
- If an implementation contradicts an ADR, flag it and ask for guidance
- Do not modify `Accepted` ADRs — create a new one that supersedes the old one
- Update the status field if a decision changes

---

## Phase-Scoped ADRs

ADR numbering is **global** — it never resets per phase. Phase 2+ ADRs continue the same sequence (e.g. v1 ends at ADR-0006, Phase 2 starts at ADR-0007).

For Phase 2+ ADRs, add a `Phase:` field to the standard header:

```markdown
# ADR-NNNN: [Short Title]

**Status:** Proposed | Accepted | Deprecated | Superseded by ADR-NNNN
**Date:** YYYY-MM-DD
**Phase:** 2
**Deciders:** [Names or "team"]
```

To supersede a v1 ADR in a later phase:
1. Create a new ADR (next number in sequence) with `Phase: N`
2. In the new ADR, reference the old one in `## References`
3. Update the old ADR's `Status` field to `Superseded by ADR-NNNN`

See `adr/phase_adr_guide.md` for the full multi-phase ADR protocol.
