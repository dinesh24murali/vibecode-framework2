# Phase 2 Attachments

Drop external feature documents here before running the phase prompts in `docs/03_phase_prompts/`.

Any file format is acceptable: Markdown, PDF, plain text, HTML, Word exports, etc.

---

## How These Files Feed Into the Prompts

Every prompt in `docs/03_phase_prompts/` contains a `[[PHASE_ATTACHMENTS]]` token.
When filling a prompt before pasting it into your AI tool, replace that token using one of the two modes below.

### Mode A — AI tools with file access (Claude Code, Cursor)

Replace `[[PHASE_ATTACHMENTS]]` with:

```
See all files in docs/00_intake/phase2_attachments/ — read them directly and use their
contents as the primary source for new feature requirements.
```

The AI tool will read the files from this folder.

### Mode B — Web-based AI tools (Claude.ai, Gemini, ChatGPT)

Replace `[[PHASE_ATTACHMENTS]]` with the full pasted content of each file, separated by `---`:

```
--- filename: my-feature-spec.md ---
[paste file content here]

--- filename: requirements-v2.pdf (extracted text) ---
[paste extracted text here]
```

---

## Files in This Folder

*(List filenames here as you add them so the README stays current)*

-
