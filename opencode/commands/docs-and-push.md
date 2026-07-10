---
description: Generate or update project documentation, commit, and push to main. Saves unfinished work to kanban if interrupted.
agent: docs-and-push
---

Generate or update project documentation, then commit and push to `main`.

Scope of documentation work:
- README, CHANGELOG, API docs, architecture notes, setup guides, or any `.md`/`.rst`/`.txt` files.
- Do not edit application source code.

If the task is interrupted or cannot be completed, write all remaining documentation tasks into `.opencode/session-kanban.md` so work can resume next session.

Additional instructions:
$ARGUMENTS
