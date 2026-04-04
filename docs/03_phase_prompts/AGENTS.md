# docs/03_phase_prompts/ — AGENTS.md

## Purpose

Phase-specific prompt templates for generating **delta documentation** when a new product phase begins. These prompts produce additive documents only — they do not replace or duplicate v1 outputs in `docs/02_outputs/`.

## Order of Operations

Work through prompts **01 → 05** in sequence. Each prompt builds on the output of the previous one.

| Prompt | Save output to |
|--------|----------------|
| `01_prd_delta.prompt.md` | `docs/02_outputs/phase[[N]]/01_prd_delta.md` |
| `02_functional_spec_delta.prompt.md` | `docs/02_outputs/phase[[N]]/02_functional_spec_delta.md` |
| `03_tech_architecture_delta.prompt.md` | `docs/02_outputs/phase[[N]]/03_tech_architecture_delta.md` |
| `04_api_spec_additions.prompt.md` | `docs/02_outputs/phase[[N]]/04_api_spec_additions.yaml` |
| `05_implementation_plan_phase.prompt.md` | `docs/02_outputs/phase[[N]]/05_implementation_plan.md` |

## Rules for AI Tools

- **Always read the corresponding v1 doc** before generating a delta (e.g. read `docs/02_outputs/01_prd.md` before running the PRD delta prompt)
- **Never rewrite or duplicate v1 content** — only document what is new or changed
- **Number new requirements** (FR, UF, FS, TASK) continuing from the v1 sequence — ask the user for the last v1 number if unknown; default to FR-100+, TASK-200+
- **Call out ADR candidates explicitly** — do not silently make architectural decisions
- **Flag assumptions** with `> **Assumption:**` and open questions with `> **Open question:**`
- If a v1 doc is unavailable, note this and make conservative assumptions

## Do NOT Modify

Do not edit files in `docs/01_prompts/` — those are v1 prompt templates and must remain unchanged.
