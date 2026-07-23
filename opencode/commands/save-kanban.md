---
description: Save the current session state, unfinished todos, blockers, and next commands into a persistent Kanban handoff.
agent: session-kanban-keeper
---

Save a session handoff into `.opencode/session-kanban.md`.

When saving:
- preserve existing owner/session claims unless reality changed,
- keep exactly one bounded active `IN PROGRESS` task when work remains,
- record exact blockers and resume commands instead of vague notes,
- preserve protected product-surface/layout constraints when they affect remaining work.

Include:
- what was completed today
- what is still in progress
- what should be done next
- blockers or unknowns
- recent commits, deployments, tests, and useful commands if known
- any user notes below

User notes:
$ARGUMENTS
