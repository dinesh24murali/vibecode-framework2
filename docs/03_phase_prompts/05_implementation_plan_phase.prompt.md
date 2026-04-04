# Prompt: Generate Phase [[PHASE_NUMBER]] Implementation Plan

> **How to use:**
> 1. Complete prompts 01–04 first — this prompt synthesizes all phase outputs
> 2. Fill every `[[PLACEHOLDER]]` from `docs/00_intake/phase_intake_questionnaire.md`
> 3. Paste this entire file into your AI tool
> 4. Save the output to `docs/02_outputs/phase[[PHASE_NUMBER]]/05_implementation_plan.md`
> 5. After review, create task files with: `make phase-task PHASE=[[PHASE_NUMBER]] NAME=<task-name>`

---

## Instructions to AI

You are a senior engineering lead. Generate a **phased implementation plan** for Phase [[PHASE_NUMBER]] of an existing project. This plan breaks the phase into concrete, ordered development tasks that an AI coding agent can execute one at a time.

**Critical rules:**
- Do NOT re-plan completed v1 work — start from where v1 left off
- Number tasks starting from `TASK-[[LAST_V1_TASK_NUMBER + 1]]` to maintain a global sequence
- Each task must be independently executable (one PR / one scratch file)
- Tasks that touch the same file should be sequenced, not parallelized
- The plan must be conservative — under-promise and over-deliver

If you have file access, read all of these now:
- `docs/02_outputs/05_implementation_plan.md` (v1 plan — know what's already built)
- `docs/02_outputs/phase[[PHASE_NUMBER]]/01_prd_delta.md`
- `docs/02_outputs/phase[[PHASE_NUMBER]]/02_functional_spec_delta.md`
- `docs/02_outputs/phase[[PHASE_NUMBER]]/03_tech_architecture_delta.md`
- `docs/02_outputs/phase[[PHASE_NUMBER]]/04_api_spec_additions.yaml`

---

## v1 Context

**Project name:** [[PROJECT_NAME]]
**Last v1 task number:** `TASK-[[LAST_V1_TASK_NUMBER]]`
**v1 completion status:** All tasks in `tasks/done/` — v1 is shipped.

---

## Phase [[PHASE_NUMBER]] Input

**Phase name:** [[PHASE_NAME]]
**Target completion date:** [[Fill from phase intake section 1.4]]
**New features:** [[Fill from phase intake section 1.1]]
**New integrations:** [[Fill from phase intake section 3]]
**DB changes:** [[Fill from phase intake section 2.3]]

---

## Required Output Structure

### Phase [[PHASE_NUMBER]] Overview
2–3 sentences summarizing what this phase builds and the sequencing strategy.

### Phase Structure
Break the work into sub-phases (P[[PHASE_NUMBER]].0 through P[[PHASE_NUMBER]].N):

**P[[PHASE_NUMBER]].0 — Phase Setup** *(always first)*
- Update memory files, create ADRs for new architectural decisions, update API spec

**P[[PHASE_NUMBER]].1 — Infrastructure & Schema**
- Database migrations, new service scaffolding, environment variable additions

**P[[PHASE_NUMBER]].2+ — Feature Implementation**
- One sub-phase per major feature area (group related tasks)

**P[[PHASE_NUMBER]].N — Quality & Hardening** *(always last)*
- Contract test generation from new API spec additions, e2e test coverage, performance validation

---

### Task List

For each task, use this format:

```
TASK-NNN: [Task name]
Phase:     P[[PHASE_NUMBER]].X
Depends-on: TASK-NNN, TASK-NNN (or "none")
FR refs:   FR-NNN (from phase PRD delta, or "none")
Files:
  - path/to/file.ts  (create)
  - path/to/other.ts (modify)
Description:
  [2–4 sentences describing what the task does and why it's scoped this way]
Acceptance criteria:
  - [ ] [specific, testable criterion]
  - [ ] [specific, testable criterion]
```

### Task Sequencing Notes
Explain any non-obvious ordering decisions — why certain tasks must precede others.

### Risks & Open Items
List anything in the plan that has unresolved dependencies or requires a decision before work can begin.

---

## Output Format

- Markdown with clear H2/H3 headings
- Aim for 15–40 tasks total (fewer is better — tasks can be split during implementation)
- Every task should be completable in a single focused AI coding session
- Do not create tasks for documentation-only work — docs are updated as part of each task
