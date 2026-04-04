# Task: p[[PHASE_NUMBER]]-{{TASK_NAME}}

**Phase:** [[PHASE_NUMBER]]
**Status:** active | done
**Created:** {{DATE}}
**ADR refs:** <!-- e.g. ADR-0005, or "none" -->
**Phase docs:** `docs/02_outputs/phase[[PHASE_NUMBER]]/`

---

## Goal

<!-- One sentence: what this task achieves and why it matters in the context of Phase [[PHASE_NUMBER]] -->

## Background

<!-- Why this task exists. Reference the phase PRD delta section (e.g. FR-101), the phase
     implementation plan task number (e.g. TASK-205), and any relevant v1 context.
     Include enough that an AI agent starting fresh can understand the purpose. -->

## Acceptance Criteria

- [ ] <!-- Specific, testable criterion -->
- [ ] <!-- Specific, testable criterion -->
- [ ] <!-- Add as many as needed -->

## Dependencies

- **Tasks:** <!-- List p[[PHASE_NUMBER]]- task names this depends on, or v1 tasks in tasks/done/, or "none" -->
- **Memory files:** <!-- List relevant memory files to read first (check memory/_index.md) -->
- **Docs:** <!-- Link to phase doc section, e.g. docs/02_outputs/phase[[PHASE_NUMBER]]/01_prd_delta.md §FR-101 -->

## Files Expected to Change

<!-- List the files you expect to create or modify. AI: fill this in the scratch file. -->

## Notes

<!-- Any phase-specific constraints, gotchas, or context. Note any v1 code that must not
     be broken by this task. -->

---

## Scratch File

AI: before implementing, create `tasks/active/p[[PHASE_NUMBER]]-{{TASK_NAME}}.scratch.md` with your plan.
See `tasks/AGENTS.md` for the required scratch file format.
