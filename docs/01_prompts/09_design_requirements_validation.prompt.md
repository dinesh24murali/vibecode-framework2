# Prompt: Validate Figma Designs Against Requirements

> **When to run:** Once, during Phase 1, after both the PRD (`01_prd.md`) and Figma designs
> are available. Requires the **Figma MCP server** to be configured and connected.
>
> **Output:** Save results to `docs/02_outputs/09_design_gap_report.md`.
> Use findings to update the design registry (`docs/02_outputs/05_design_registry.md`)
> and raise open questions with the designer or product owner before development starts.

---

## Instructions to AI

You have access to the Figma MCP server. Your job is to cross-check the Figma designs against
the product requirements and surface any gaps in either direction.

**Figma file URL:** [[FIGMA_FILE_URL]]
**PRD location:** `docs/02_outputs/01_prd.md`
**Functional spec location:** `docs/02_outputs/02_functional_spec.md`

---

## Validation Steps

### Step 1 — Inventory the Figma

Load the Figma file and list every distinct screen or flow visible:
- Screen / frame name
- Brief description (1 sentence: what is this screen for?)
- User-facing actions available on the screen

### Step 2 — Inventory the Requirements

Read `docs/02_outputs/01_prd.md` and `docs/02_outputs/02_functional_spec.md`. List every
user-facing feature or flow that implies a UI screen:
- Feature name
- Expected screens or interactions

### Step 3 — Cross-Check

Produce three lists:

**A. Matched** — Requirements with a corresponding Figma screen (good)

**B. Requirements without a design** — A requirement implies a UI but no Figma screen exists.
This is a design gap. Flag for the designer.

**C. Designs without a requirement** — A Figma screen exists but no requirement covers it.
This may be scope creep, a designer assumption, or a missing requirement. Flag for the PM.

### Step 4 — High-Level Consistency Check

For each matched pair, do a quick sanity check:
- Does the Figma screen support all the actions the requirement describes?
- Are there obvious missing states (error, empty, loading) in the design?
- Does the design imply any technical requirements not mentioned in the PRD (e.g. real-time updates, file upload, complex permissions)?

---

## Output Format

Save as `docs/02_outputs/09_design_gap_report.md`:

```markdown
# Design Gap Report

> Generated on [[DATE]]
> Figma: [[FIGMA_FILE_URL]]
> PRD: docs/02_outputs/01_prd.md

## Summary
- Total Figma screens inventoried: N
- Total requirement flows inventoried: N
- Matched: N
- Requirements without a design: N  ← need designer action
- Designs without a requirement: N  ← need PM action

## Matched Features
| Feature | Figma screen | Consistency notes |
|---------|-------------|-------------------|

## Requirements Without a Design (Design Gaps)
| Feature | Expected screens | Action needed |
|---------|-----------------|---------------|

## Designs Without a Requirement (Scope Review)
| Figma screen | Description | Action needed |
|-------------|-------------|---------------|

## Missing States Flagged
| Screen | Missing state | Recommendation |
|--------|--------------|----------------|

## Open Questions
<!-- Questions for the designer or PM that should be resolved before dev starts -->
```

---

## Notes

- Be specific but concise — this report is for humans to act on, not an exhaustive audit
- If the Figma file is very large, focus on the core user flows first
- Mark items as `[BLOCKER]` if they would prevent implementation without resolution
