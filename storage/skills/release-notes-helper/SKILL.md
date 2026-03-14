---
name: release-notes-helper
description: Draft clear release notes from code changes, fixes, and operational updates.
version: 0.9.0
metadata:
  openclaw:
    emoji: "🚀"
    skillKey: release-notes
---

# Release Notes Helper

Use this skill to turn engineering changes into short release notes.

## Inputs

- Change summary
- Affected commands or deployment steps
- User-visible behavior changes

## Rules

- Group by outcome, not by file.
- Call out breaking changes explicitly.
- Keep internal refactors out of the summary unless they affect operators.
- Prefer concrete wording over marketing language.
