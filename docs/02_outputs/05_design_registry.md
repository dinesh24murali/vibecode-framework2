# Design Registry

> This file maps features/flows to their Figma designs. It is the single source of truth for
> where to find designs during frontend implementation.
>
> **AI tools:** Check this file before starting any frontend task. If `Skip Design?` is `Yes`,
> implement from task requirements only — skip Figma review and visual QA.

---

## How to Use

1. Add one row per feature or user flow when designs are received from the designer
2. Set **Skip Design?** to `Yes` for features with no design, purely functional screens, or where requirements alone are sufficient
3. Frame names must match exactly what appears in Figma (for MCP lookup)
4. Link directly to the specific Figma frame, not just the top-level file

---

## Registry

| Feature / Flow | Figma URL | Frame Names | Skip Design? | Notes |
|----------------|-----------|-------------|--------------|-------|
| [[FEATURE_NAME]] | [[FIGMA_URL]] | [[FRAME_NAMES]] | No | [[NOTES]] |
| [[FEATURE_NAME]] | N/A | N/A | Yes — implement from requirements | [[REASON]] |

---

## Skip Design? — When to Use Each Value

| Value | When to use |
|-------|-------------|
| `No` | A Figma frame exists and should be used as the implementation reference |
| `Yes — implement from requirements` | No Figma design exists, screen is internal/admin, or designer confirmed requirements are sufficient |
| `Yes — design TBD` | Design is expected but not yet delivered; implement a placeholder from requirements and revisit |

---

## Example (delete this section after filling in real entries)

| Feature / Flow | Figma URL | Frame Names | Skip Design? | Notes |
|----------------|-----------|-------------|--------------|-------|
| User login | https://figma.com/file/abc123/Project?node-id=1%3A2 | Login Screen, Login Error State | No | Includes email/password + Google OAuth button |
| Admin dashboard | N/A | N/A | Yes — implement from requirements | Internal tool, no visual design needed |
| Forgot password | https://figma.com/file/abc123/Project?node-id=1%3A5 | Forgot Password, Reset Email Sent | No | Email input only, no social options |
| Settings page | N/A | N/A | Yes — design TBD | Designer will deliver after v1 launch |
