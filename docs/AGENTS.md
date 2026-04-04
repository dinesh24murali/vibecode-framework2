# docs/ — AGENTS.md

## Purpose

This folder drives **Phase 1** of the vibecode workflow: generating the foundational documents before any code is written.

## Folder Layout

```
docs/
├── 00_intake/              ← Start here: fill out the questionnaire
│   ├── intake_questionnaire.md          ← v1 intake
│   ├── phase_intake_questionnaire.md    ← Phase 2+ intake
│   └── phaseN_attachments/             ← Drop external feature docs here for phase N
├── 01_prompts/             ← v1 prompt files — paste into any AI tool
├── 02_outputs/             ← v1 AI-generated outputs
│   └── phaseN/             ← Phase N delta outputs
└── 03_phase_prompts/       ← Phase 2+ prompt files (delta docs only)
```

## Order of Operations

1. **Fill in `00_intake/intake_questionnaire.md`** — this is the source of truth for all `[[PLACEHOLDER]]` tokens
2. **Work through `01_prompts/` in order** (01 → 06):
   - Fill placeholders from the intake answers
   - Paste the prompt into your AI tool
   - Save the output to `02_outputs/` with a matching filename (e.g. `02_outputs/01_prd.md`)
3. **Review all outputs** before starting Phase 2
4. **Seed `adr/` and `memory/`** from the architecture and implementation plan docs

## Rules for AI Tools

- Do **not** modify files in `01_prompts/` or `03_phase_prompts/` — these are prompt templates
- Place v1 generated documents in `02_outputs/`; place phase N outputs in `02_outputs/phaseN/`
- The v1 OpenAPI spec (`04_api_spec.yaml`) in `02_outputs/` is the contract for `tests/contract/` — do not overwrite it; phase additions go in `02_outputs/phaseN/04_api_spec_additions.yaml`
- If a document is revised, save the new version to the same path (overwrite is fine; git history tracks changes)

---

## Phase N+ Document Generation

When starting a new product phase, follow this order:

1. **Fill** `docs/00_intake/phase_intake_questionnaire.md`
2. **Drop** external feature documents into `docs/00_intake/phaseN_attachments/`
3. **Work through** `docs/03_phase_prompts/` in order (01 → 05):

| Prompt | Output |
|--------|--------|
| `01_prd_delta.prompt.md` | `docs/02_outputs/phaseN/01_prd_delta.md` |
| `02_functional_spec_delta.prompt.md` | `docs/02_outputs/phaseN/02_functional_spec_delta.md` |
| `03_tech_architecture_delta.prompt.md` | `docs/02_outputs/phaseN/03_tech_architecture_delta.md` |
| `04_api_spec_additions.prompt.md` | `docs/02_outputs/phaseN/04_api_spec_additions.yaml` |
| `05_implementation_plan_phase.prompt.md` | `docs/02_outputs/phaseN/05_implementation_plan.md` |

### Rules for AI Tools (Phase Prompts)

- **Always read the corresponding v1 doc** before generating a delta
- **Never rewrite or duplicate v1 content** — delta docs cover new/changed content only
- **Number new FRs, UFs, FSs, and TASKs** continuing from the v1 sequence
- **Call out ADR candidates explicitly** — do not silently make architectural decisions
- If a v1 doc is unavailable, note the gap and make conservative assumptions
