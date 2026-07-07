# Agent Catalog

## github-completion-auditor

Read-only audit for working tree cleanliness, pushed state, deployment status, and local running jobs.

Command: `/audit-completion`

## session-kanban-keeper

Maintains `.opencode/session-kanban.md` so unfinished work survives token limits.

Commands: `/show-kanban`, `/save-kanban`

## repo-cartographer

Creates `.opencode/repo-map.md` for durable repo understanding.

Command: `/map-repo`

## pr-reviewer

Reviews diffs or PRs for bugs, regressions, missing tests, and risks.

Command: `/review-diff`

## release-captain

Runs release readiness preflight and returns go/no-go.

Command: `/release-check`

## security-privacy-sentinel

Checks for secrets, PII leaks, auth/session issues, unsafe logs, and privacy regressions.

Command: `/security-check`

## session-archivist

Writes dated session summaries under `.opencode/session-log/`.

Command: `/archive-session`

## decision-journalist

Writes lightweight ADRs under `.opencode/decisions/`.

Command: `/adr`
