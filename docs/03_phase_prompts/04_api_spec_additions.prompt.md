# Prompt: Generate API Spec Additions for Phase [[PHASE_NUMBER]]

> **How to use:**
> 1. Complete prompts 01–03 first — this prompt builds on those outputs
> 2. Fill every `[[PLACEHOLDER]]` from `docs/00_intake/phase_intake_questionnaire.md`
> 3. Paste this entire file into your AI tool
> 4. Save the output to `docs/02_outputs/phase[[PHASE_NUMBER]]/04_api_spec_additions.yaml`

---

## Instructions to AI

You are a senior API designer. Generate an **OpenAPI 3.1 YAML fragment** containing only the new and changed API paths and components introduced by Phase [[PHASE_NUMBER]].

**Critical rules:**
- Do NOT output a complete OpenAPI spec — only the additions/changes
- The output must be a valid YAML fragment that can be merged into the v1 spec at `docs/02_outputs/04_api_spec.yaml`
- Do not duplicate paths or schemas that already exist in the v1 spec
- If a v1 path is being modified, show only the changed operation(s) and note which v1 path it updates

If you have file access, read these now:
- `docs/02_outputs/04_api_spec.yaml` (v1 API spec — do not duplicate anything from here)
- `docs/02_outputs/phase[[PHASE_NUMBER]]/01_prd_delta.md`
- `docs/02_outputs/phase[[PHASE_NUMBER]]/02_functional_spec_delta.md`
- `docs/02_outputs/phase[[PHASE_NUMBER]]/03_tech_architecture_delta.md`

---

## v1 Context

**Project name:** [[PROJECT_NAME]]
**v1 API spec:** `docs/02_outputs/04_api_spec.yaml`
**Base URL:** `[[BASE_URL]]` (e.g. `https://api.example.com`)
**Auth scheme in v1:** [[AUTH_STRATEGY]] *(do not redefine unless changed)*

**API versioning decision for this phase:**
[[Choose one and fill in: "All new endpoints use /v1/ path prefix (same as v1)" OR "New endpoints use /v2/ path prefix" OR "New endpoints are additive under /v1/ with no version bump"]]

---

## Phase [[PHASE_NUMBER]] Input

**Phase name:** [[PHASE_NAME]]
**New functional requirements:** *(from PRD delta — list FR numbers and their requirement text)*
[[Fill from docs/02_outputs/phase[[PHASE_NUMBER]]/01_prd_delta.md — new FR list]]

**New user roles (if any):** [[Fill from phase intake section 4.3]]

**External feature documents:**
[[PHASE_ATTACHMENTS]]
*(AI with file access: read all files in `docs/00_intake/phase[[PHASE_NUMBER]]_attachments/`)*

---

## Required Output Format

Output a YAML document with this structure:

```yaml
# Phase [[PHASE_NUMBER]] API Spec Additions
# Merge this fragment into docs/02_outputs/04_api_spec.yaml
# Generated: [[PHASE_START_DATE]]
#
# HOW TO MERGE:
#   - Add entries under `paths:` to the v1 spec paths block
#   - Add entries under `components/schemas:` to the v1 schemas block
#   - Add entries under `components/parameters:` if new reusable params are introduced
#   - If a v1 path is modified, the comment above each path will indicate which operation changes

paths:
  /new-resource:
    get:
      summary: ...
      tags: [TagName]
      security:
        - bearerAuth: []
      parameters: [...]
      responses:
        '200':
          description: ...
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/NewResourceResponse'
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'

components:
  schemas:
    NewResourceResponse:
      type: object
      properties:
        id:
          type: string
          format: uuid
        # ... all properties
      required:
        - id

  # Add new reusable parameters here if introduced
  parameters: {}
```

### Conventions to follow (same as v1 spec)
- All request/response bodies use `application/json`
- Pagination via `?page=` and `?per_page=` query params where applicable
- Error shape: `{ "error": { "code": "SCREAMING_SNAKE", "message": "..." } }`
- Use `$ref` for any schema used in more than one place
- Tag each path with a logical grouping name
- Include `401 Unauthorized` and `403 Forbidden` on all authenticated endpoints
- Use `format: uuid` for ID fields, `format: date-time` for timestamps

### For v1 paths being modified
Add a comment above the path:
```yaml
# MODIFIES v1 path: PUT /existing-resource
# Change: adds optional `new_field` to request body
/existing-resource:
  put:
    # ... show full modified operation
```

---

## Output Format

- Valid YAML only — no prose outside YAML comments
- Comments (`#`) are encouraged to explain non-obvious design choices
- Flag any design decisions that need an ADR as: `# ADR CANDIDATE: [decision description]`
