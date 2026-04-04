# Phase ADR Guide

> This is a guidance document, not an ADR itself. It explains how to create ADRs for new product phases.

---

## Key Rules

**ADR numbering never resets per phase.**

ADRs are numbered in a single global sequence across all phases:
- `adr/0001-use-vibecode-framework.md` — v1
- `adr/0002-jwt-auth-strategy.md` — v1
- `adr/0007-phase2-payment-processor.md` — Phase 2 (numbering continues)

This preserves a complete, chronological decision history across the life of the project.

---

## Adding a Phase Field to ADR Headers

For Phase 2+ ADRs, add a `Phase:` field to the standard ADR header:

```markdown
# ADR-NNNN: [Short Title]

**Status:** Proposed | Accepted | Deprecated | Superseded by ADR-NNNN
**Date:** YYYY-MM-DD
**Phase:** 2
**Deciders:** [Names or "team"]
```

This allows filtering ADRs by phase without breaking the global sequence.

---

## When to Create a Phase ADR

The architecture delta prompt (`03_tech_architecture_delta.prompt.md`) will call out ADR candidates. Create an ADR for each one:

```bash
make adr SLUG=phase2-payment-processor-choice
```

Also create an ADR when:
- Choosing a new third-party integration
- Changing an existing architectural pattern from v1 (e.g. switching from REST to GraphQL for a new domain)
- Introducing a new database or cache
- Making a security or auth decision that affects new flows

---

## Superseding a v1 ADR

If a Phase 2 decision overrides an existing v1 ADR:

1. Create a new ADR (next number in sequence) with `Phase: 2`
2. In the new ADR's header: `**Status:** Accepted` and reference the old one in `## References`
3. Update the old ADR's status field: `**Status:** Superseded by ADR-NNNN`

Do not modify the body of an `Accepted` ADR — only update its `Status` field.

---

## Referencing Phase ADRs in Task Files

In `tasks/active/p2-*.md` files, the `ADR refs:` field should list the ADR numbers relevant to that task:

```markdown
**ADR refs:** ADR-0007, ADR-0008
```
