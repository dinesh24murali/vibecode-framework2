# Prompt: Generate PRD Delta for Phase [[PHASE_NUMBER]]

> **How to use:**
> 1. Fill every `[[PLACEHOLDER]]` from `docs/00_intake/phase_intake_questionnaire.md`
> 2. Paste this entire file into your AI tool (Claude, Cursor, Gemini, ChatGPT, etc.)
> 3. Save the output to `docs/02_outputs/phase[[PHASE_NUMBER]]/01_prd_delta.md`

---

## Instructions to AI

You are a senior product manager. Generate a **PRD Delta** document for Phase [[PHASE_NUMBER]] of an existing product.

**Critical rule:** Do NOT rewrite the existing PRD. Only document what is NEW or CHANGED in this phase. The v1 PRD is already final — treat it as authoritative background context.

If you have file access, read `docs/02_outputs/01_prd.md` now.
If not, the summary below is your v1 context.

---

## v1 Context

**Project name:** [[PROJECT_NAME]]
**v1 PRD location:** `docs/02_outputs/01_prd.md`
**Summary of v1 scope (do not re-document these):** [[SUMMARIZE_V1_FEATURES_IN_2_TO_3_SENTENCES]]

**Last v1 requirement numbers:**
- Last functional requirement: `FR-[[LAST_V1_FR_NUMBER]]`
- Last user story: `US-[[LAST_V1_US_NUMBER]]`

---

## Phase [[PHASE_NUMBER]] Input

**Phase name:** [[PHASE_NAME]]

**New features for this phase:**
[[Fill from phase intake section 1.1 — list each feature on its own line]]

**External feature documents:**
[[PHASE_ATTACHMENTS]]
*(AI with file access: read all files in `docs/00_intake/phase[[PHASE_NUMBER]]_attachments/`. Web AI tools: content is pasted above.)*

**v1 constraints still applying:**
[[Fill from phase intake section 2 — stack, auth, DB, deployment notes]]

**New integrations / third-party services:**
[[Fill from phase intake section 3]]

**New user roles introduced:**
[[Fill from phase intake section 4.3, or "none"]]

**New compliance requirements:**
[[Fill from phase intake section 4.2, or "none"]]

**Explicitly OUT of scope for this phase:**
[[Fill from phase intake section 1.3]]

---

## Required Output Sections

Generate a PRD delta document with the following sections:

### 1. Phase Summary
2–3 sentences: what this phase adds and why it matters to the product.

### 2. New Problem Statement
What new user pain, opportunity, or business requirement does this phase address — distinct from the v1 problem.

### 3. New Goals & Success Metrics
SMART goals for this phase only. Do not repeat v1 goals.

### 4. New User Personas *(only if new personas not in v1 PRD)*
If all users are already covered by v1 personas, write "No new personas — see v1 PRD."

### 5. New User Stories
Number starting from `US-[[LAST_V1_US_NUMBER + 1]]`. Format:
> As a [persona], I want [action] so that [benefit].
> **Acceptance criteria:** …

### 6. New Functional Requirements
Number starting from `FR-[[LAST_V1_FR_NUMBER + 1]]`. Format: `FR-NNN: [Requirement statement]`

### 7. Modified v1 Requirements *(if any)*
For each v1 FR being changed:
- **FR-NNN (original):** [original text]
- **FR-NNN (phase [[PHASE_NUMBER]] revision):** [new text]
- **Reason:** [why it changed]

### 8. New Non-Functional Requirements *(additions/changes only)*
Only requirements that differ from or extend the v1 NFRs.

### 9. Deprecated v1 Features *(if any)*
List any v1 functionality being removed or retired in this phase.

### 10. Assumptions
Flag each with `> **Assumption:**`

### 11. Open Questions
Flag each with `> **Open question:**`

### 12. Phase Timeline
Milestone breakdown for this phase only (not the full product timeline).

---

## Output Format

- Markdown with clear H2/H3 headings
- Number requirements continuing from v1 sequence
- Target length: 1000–2500 words
- Do not include a title page or table of contents
