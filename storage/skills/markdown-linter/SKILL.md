---
name: markdown-linter
description: Review Markdown files for broken structure, uneven headings, and unclear sections.
version: 1.1.0
metadata:
  openclaw:
    requires:
      bins:
        - rg
    emoji: "📝"
    os:
      - linux
      - macos
---

# Markdown Linter

Use this skill when reviewing docs, changelogs, or agent instructions before publishing.

## Checklist

- Keep heading levels ordered.
- Remove duplicated sections.
- Prefer short paragraphs over dense blocks.
- Verify fenced code blocks use an info string when possible.
- Keep examples aligned with the actual command names in the repo.

## Output Style

Return findings first, then show a corrected snippet if needed.
