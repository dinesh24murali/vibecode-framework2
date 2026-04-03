# Prompt: Extract Design Tokens from Figma

> **When to run:** Once, during Phase 1, after `07_design_system.prompt.md` has been completed.
> Requires the **Figma MCP server** to be configured and connected.
>
> **Output:** Append extracted tokens to `docs/02_outputs/07_design_system.md` under a
> new section `## Extracted from Figma`. Also update the design registry if new component
> types are discovered.

---

## Instructions to AI

You have access to the Figma MCP server. Using the Figma file URL below, load the project's
design file and extract the design tokens and component inventory.

**Figma file URL:** [[FIGMA_FILE_URL]]

---

## What to Extract

### 1. Color Tokens

- All named color styles in the Figma file (name + hex value)
- Group by category if the designer has named them (e.g. `primary/500`, `neutral/100`)
- Flag any colors in use on screens that are **not** defined as named styles (one-off colors)
- Cross-check against `docs/02_outputs/07_design_system.md` — flag any mismatches with the generated palette

### 2. Typography Tokens

- All named text styles (name, font family, size, weight, line height, letter spacing)
- Note any fonts used in screens that are not in the named text styles

### 3. Spacing & Sizing

- If the Figma file uses a spacing scale (e.g. 4px base grid), document it
- Note the most common padding/gap values used across components

### 4. Component Inventory

List every distinct UI component visible in the Figma file:
- Component name (as named in Figma, if available)
- Variants (e.g. Button: primary, secondary, ghost, destructive)
- States (e.g. default, hover, disabled, loading)
- Whether the component exists in `[[UI_LIBRARY]]` or needs to be built custom

---

## Output Format

Structure your output as follows (to be appended to `docs/02_outputs/07_design_system.md`):

```markdown
## Extracted from Figma

> Auto-extracted on [[DATE]] from [[FIGMA_FILE_URL]]
> Extraction is approximate for partially-structured Figma files — verify named styles with the designer.

### Figma Color Styles
| Token name | Hex | Notes |
|------------|-----|-------|

### Figma Text Styles
| Style name | Font | Size | Weight | Line height | Usage |
|------------|------|------|--------|-------------|-------|

### Spacing Observations
<!-- Document the apparent grid/spacing scale -->

### Component Inventory
| Component | Variants | States | Source |
|-----------|----------|--------|--------|
| | | | `[[UI_LIBRARY]]` / Custom |

### Mismatches with Generated Design System
<!-- List any colors or fonts in Figma that differ from docs/02_outputs/07_design_system.md -->
```

---

## Notes

- If the Figma file is **partially structured** (some components, some flat screens), do your best and
  note which sections have low confidence
- Do not invent tokens — only document what is explicitly present in the Figma file
- If a section cannot be extracted (e.g. no named color styles), state that explicitly rather than leaving it blank
