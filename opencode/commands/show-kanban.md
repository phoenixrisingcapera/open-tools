---
description: Show the saved Kanban handoff from the previous session and recommend the first next action.
agent: session-kanban-keeper
---

Review `.opencode/session-kanban.md` and summarize the current handoff.

Before recommending any next action:
- preserve the existing owner claims,
- do not recommend overlapping an active `IN PROGRESS` session,
- prefer one bounded next action,
- keep active/idle endpoints, latent or unmounted features, and established layouts protected by default unless the user explicitly authorized a change.

If the user later chooses one numbered option from the summary, keep that option active and save the remaining meaningful options into `Next` instead of dropping them.

Prioritize:
- Now
- Next
- Blocked
- the first recommended action

User notes:
$ARGUMENTS
