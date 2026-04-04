# Prompt: Generate Functional Specification Delta for Phase [[PHASE_NUMBER]]

> **How to use:**
> 1. Complete `01_prd_delta.prompt.md` first — this prompt builds on that output
> 2. Fill every `[[PLACEHOLDER]]` from `docs/00_intake/phase_intake_questionnaire.md`
> 3. Paste this entire file into your AI tool
> 4. Save the output to `docs/02_outputs/phase[[PHASE_NUMBER]]/02_functional_spec_delta.md`

---

## Instructions to AI

You are a senior software engineer writing a **Functional Specification Delta** for Phase [[PHASE_NUMBER]]. This bridges the PRD delta to implementation — defining the exact user flows, screens, and feature behaviors for new functionality only.

**Critical rule:** Do NOT rewrite the v1 functional spec. Only cover what is new or changed in this phase.

If you have file access, read these now:
- `docs/02_outputs/02_functional_spec.md` (v1 functional spec)
- `docs/02_outputs/phase[[PHASE_NUMBER]]/01_prd_delta.md` (phase PRD delta — generated in previous step)

---

## v1 Context

**Project name:** [[PROJECT_NAME]]
**v1 functional spec location:** `docs/02_outputs/02_functional_spec.md`
**Last v1 spec numbers:**
- Last user flow: `UF-[[LAST_V1_UF_NUMBER]]`
- Last feature spec: `FS-[[LAST_V1_FS_NUMBER]]`

**Summary of v1 flows already covered (do not re-document):**
[[SUMMARIZE_V1_FLOWS_IN_2_TO_3_SENTENCES]]

---

## Phase [[PHASE_NUMBER]] Input

**Phase name:** [[PHASE_NAME]]
**Phase PRD delta:** `docs/02_outputs/phase[[PHASE_NUMBER]]/01_prd_delta.md`

**New features:**
[[Fill from phase intake section 1.1]]

**External feature documents:**
[[PHASE_ATTACHMENTS]]
*(AI with file access: read all files in `docs/00_intake/phase[[PHASE_NUMBER]]_attachments/`)*

**New user roles introduced:**
[[Fill from phase intake section 4.3, or "none"]]

---

## Required Output Sections

### 1. New User Flows
Number starting from `UF-[[LAST_V1_UF_NUMBER + 1]]`.

For each new user flow:
```
UF-NNN: [Flow name]
Actor: [user role]
Preconditions: [what must be true before this flow starts]
Steps:
  1. [step]
  2. [step]
Postconditions: [what is true after the flow completes]
Error paths: [what happens when something goes wrong]
```

### 2. New Screen / Page Inventory
List each new page or modal introduced in this phase.

| Screen | Route / location | Description | New or Modified |
|--------|-----------------|-------------|-----------------|
| | | | |

### 3. Modified v1 Screens *(if any)*
For each existing screen being changed, describe only the delta — what is being added, removed, or changed. Do not redocument unchanged parts.

### 4. New Feature Specifications
Number starting from `FS-[[LAST_V1_FS_NUMBER + 1]]`.

For each new feature:
```
FS-NNN: [Feature name]
FR refs: FR-NNN, FR-NNN (from phase PRD delta)
Description: [what the feature does]
Behavior:
  - [rule 1]
  - [rule 2]
Edge cases:
  - [edge case and expected behavior]
Out of scope: [explicitly what this feature does NOT do]
```

### 5. Permissions Matrix Delta
Only new roles or changed permissions — do not repeat the v1 matrix.

| Action | [New Role] | [Existing Role — if changed] |
|--------|------------|------------------------------|
| | | |

### 6. New Notifications or Emails *(if any)*
List any new system-generated messages introduced in this phase.

### 7. State Diagram Updates *(if applicable)*
If any existing state machines change, show only the delta using Mermaid:

```mermaid
stateDiagram-v2
  %% Only new states and transitions — reference v1 diagram for full picture
```

---

## Output Format

- Markdown with clear H2/H3 headings
- Number flows and specs continuing from v1 sequence
- Target length: 1500–3500 words
- Include Mermaid diagrams where flow is non-obvious
