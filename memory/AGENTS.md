# memory/ — AGENTS.md

## Purpose

Memory files capture domain knowledge that would otherwise be lost between AI sessions. They are the project's long-term memory — facts, decisions, and context that an AI agent needs to do good work, but that aren't obvious from reading the code.

## When to Create a Memory File

Create a memory file when you learn:
- How a domain concept works (e.g. how the billing cycle is calculated)
- A non-obvious constraint (e.g. "the payments API has a 100ms SLA")
- A convention that isn't enforced by tooling (e.g. "all dates are stored as UTC ISO 8601")
- Context behind a decision that isn't in an ADR
- User preferences or feedback that should persist across sessions

## When to Update a Memory File

Update an existing memory file when:
- A fact changes (update in place, note the change)
- A new piece of knowledge belongs to an existing domain
- A memory is found to be wrong

## File Naming

Use `<domain>.md` for the filename:
- `memory/auth.md` — authentication and session behavior
- `memory/billing.md` — billing and subscription logic
- `memory/users.md` — user model and roles
- `memory/api.md` — API conventions and quirks
- `memory/infra.md` — infrastructure and deployment notes

## Index

Always update `memory/_index.md` when creating or significantly changing a memory file.

## Rules for AI Tools

- **Read relevant memory files before starting any task** — check `_index.md` first
- **Never store ephemeral state** in memory files (current task progress, etc.)
- Do not duplicate information that is already in ADRs or code comments
- Keep each memory file focused on one domain — split if it grows beyond ~200 lines
- Write memory entries as permanent facts, not personal notes

---

## Multi-Phase Memory Convention

When a new product phase begins, **append** to existing memory files — do not replace them.

**For existing domain files** (e.g. `memory/api.md`): append a `## Phase N Additions` section at the bottom. If a v1 fact changes, update it in-place and annotate with `*(updated in Phase N)*`.

**For entirely new domains** introduced by a new phase: create `memory/<new-domain>.md` and add a note in the file header indicating which phase introduced it (e.g. `> Introduced in Phase 2.`). Add the file to `memory/_index.md`.

**For `memory/project.md`**: append a `## Phase N Additions` section covering new stack choices, new external services, and new conventions. Also update the Phase Tracking table.
