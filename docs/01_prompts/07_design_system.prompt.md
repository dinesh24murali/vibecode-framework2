# Prompt: Generate Design System Document

> **How to use:** Fill in every `[[PLACEHOLDER]]` from your intake questionnaire (section 5 — Design & Branding), then paste this entire file into your AI tool. Save the output to `docs/02_outputs/07_design_system.md`.

---

## Instructions to AI

You are a senior design systems engineer and UI designer. Generate a comprehensive **Design System Document** for the project below.

This document will be the single source of truth for all visual design decisions in the codebase. Every color, font, and spacing token defined here must be code-ready — frontend engineers should be able to copy the output directly into their project. Be specific and opinionated; do not leave ambiguous sections. Where input is vague, make reasonable assumptions, note them explicitly, and justify your choices.

---

## Project Input

**Project name:** [[PROJECT_NAME]]
**Description:** [[PROJECT_DESCRIPTION]]
**Frontend framework:** [[FRONTEND_FRAMEWORK]]
**UI component library:** [[UI_LIBRARY]]

**Primary brand color:** [[BRAND_COLOR_PRIMARY]]
**Secondary / accent color:** [[BRAND_COLOR_SECONDARY]]
**Desired visual aesthetic:** [[DESIGN_AESTHETIC]]

**Heading font preference:** [[FONT_HEADING]]
**Body font preference:** [[FONT_BODY]]
**Monospace font preference:** [[FONT_MONO]]
**Font source:** [[FONT_SOURCE]]

**Dark mode requirement:** [[DARK_MODE]]

---

## Required Sections

Generate the design system document with all of the following sections:

### 1. Color Palette

- **Brand colors** — primary, secondary, accent; include hex values and intended usage
- **Neutral scale** — 11-stop gray scale from 50 (near-white) to 950 (near-black) with hex values
- **Semantic colors** — success, warning, error, info; provide a background tint and a foreground/text variant for each
- **Dark mode variants** — if `[[DARK_MODE]]` is `yes` or `optional`, provide a parallel token set for dark backgrounds
- For every color, note its WCAG 2.1 contrast ratio against white and black so engineers can choose accessible text colors

### 2. Typography Scale

Provide a complete type scale in a table. For each style include:

| Style | Font family | Size (rem) | Weight | Line height | Letter spacing | Usage |
|-------|-------------|------------|--------|-------------|----------------|-------|

Cover all of: H1, H2, H3, H4, H5, H6, Body (large), Body (default), Body (small), Caption, Label, Code/Mono.

### 3. Font Faces & Loading

- **Final font choices** with rationale (why this font suits `[[DESIGN_AESTHETIC]]`)
- **Fallback stacks** for heading, body, and mono (system-safe fallbacks in case web font fails to load)
- **Loading strategy** — `font-display` value (swap / optional / fallback) with rationale
- **Source** — how to load `[[FONT_SOURCE]]` (CDN `<link>` tag, `@font-face` block, or npm package)
- **Self-hosting trade-offs** — note performance, privacy, and caching implications

### 4. Design Tokens

Provide two code blocks:

**4a. CSS Custom Properties** — all tokens as `--token-name: value;` variables inside `:root { }`. Include color, typography, and any spacing/radius tokens derived from the design decisions above. If dark mode is required, add a `[data-theme="dark"] { }` block with overrides.

**4b. Tailwind `theme.extend` config** — a JSON-compatible `theme.extend` object that maps all the same tokens into Tailwind's config format, so engineers can use utility classes like `text-primary` and `font-heading`.

---

## Output Format

- Use Markdown with clear `##` and `###` headings
- All color values in hex (e.g. `#2563EB`); also provide HSL equivalents for design tool compatibility
- All font sizes in `rem` with a `px` equivalent in a comment
- Code blocks: use `css` and `js` fences
- Flag assumptions with `> **Assumption:**`
- Target length: 1000–2000 words (excluding code blocks)
