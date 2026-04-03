# Figma Visual QA Playbook

Use this playbook after building a frontend screen to verify it matches the Figma design.
Requires the **Figma MCP server** and **Playwright MCP** (or equivalent browser access).

> **Skip this playbook** if the task's `Skip design check` is set to `Yes`.
> Check the task file or `docs/02_outputs/05_design_registry.md` before proceeding.

---

## Prerequisites

- Figma MCP server configured and connected
- Dev server running locally (e.g. `npm run dev`)
- Playwright MCP or browser DevTools MCP connected (see `verify/mcp-playbook.md`)
- The Figma frame URL for the screen you just built (from the task file or design registry)

---

## QA Steps

### Step 1 — Load the Figma Frame

Using the Figma MCP server, load the specific frame for this screen:

```
Load Figma frame: [[FIGMA_FRAME_URL]]
```

Describe what you see:
- Layout structure (columns, rows, sidebar, header, etc.)
- Key UI elements present (buttons, inputs, cards, tables, modals, etc.)
- Typography and color usage
- Empty states, error states, loading states visible in the design

### Step 2 — Screenshot the Built Screen

Using Playwright MCP, navigate to the built screen and take a screenshot:

```
Navigate to: http://localhost:[[APP_PORT]]/[[ROUTE]]
Viewport: match the Figma frame's artboard size (check Figma for width)
Take screenshot
```

### Step 3 — Structural Comparison

Compare the screenshot against the Figma description from Step 1. Check:

| Check | Pass / Fail | Notes |
|-------|------------|-------|
| Overall layout matches (columns, rows, hierarchy) | | |
| All major UI elements present | | |
| Heading and body text styles match design | | |
| Primary brand colors applied correctly | | |
| Spacing appears consistent with design | | |
| Interactive states visible (hover, focus) are styled | | |
| Empty state handled (if applicable) | | |
| Error state handled (if applicable) | | |
| Responsive behavior (if design shows mobile) | | |

### Step 4 — Log Findings

Add a `## Visual QA` section to the task's scratch file with:

```markdown
## Visual QA

**Figma frame:** [[FIGMA_FRAME_URL]]
**Screenshot taken:** yes
**Overall match:** close / partial / significant drift

### Passing checks
- ...

### Deviations found
- [MINOR] description — acceptable, log and move on
- [MAJOR] description — fix before marking task done
- [BLOCKER] description — requires designer input before implementing
```

---

## Severity Guide

| Level | Meaning | Action |
|-------|---------|--------|
| **MINOR** | Small spacing diff, slight color shade, non-critical element missing | Log it, move on |
| **MAJOR** | Wrong layout, missing key element, wrong component used | Fix before done |
| **BLOCKER** | Cannot implement as designed (technical constraint, ambiguous design) | Flag to designer/PM |

---

## Completing the Task

Only mark the task as done when:
- All `[MAJOR]` deviations are resolved
- All `[BLOCKER]` items are resolved or explicitly deferred with a note
- `[MINOR]` items are logged in the scratch file (they do not block completion)

---

## Running from Claude Code

With both Figma MCP and Playwright MCP configured:

> "Load the Figma frame at [URL], then navigate to localhost:3000/[route] and take a screenshot.
> Compare the two and list any structural deviations. Log findings in the task scratch file
> under Visual QA."
