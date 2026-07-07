# Workflows

## AI Memory Stack

Use these together to avoid losing context across token limits:

- `/show-kanban` - start from current unfinished work.
- `/save-kanban` - preserve current todos before stopping.
- `/archive-session` - save a dated historical summary.
- `/map-repo` - create durable repo context.
- `/adr` - save decisions that should not be rediscovered later.

## Preflight Suite

Use these before commits, PRs, or deploys:

- `/audit-completion` - is local/GitHub/deployment state clean?
- `/review-diff` - are there bugs or missing tests?
- `/security-check` - did secrets, PII, or auth/session risk slip in?
- `/release-check` - is this safe to release?

## Public Repo Polish

Use the `public-repo-polish` skill when preparing a public project. Strong public repos explain:

- what the tool does
- why someone should use it
- how to install it quickly
- examples
- safety model
- license
- how to contribute or extend

## Evidence And Auditability

Use the `evidence-auditability` skill for workflows where source traceability matters:

- legal-adjacent tools
- healthcare or HR tools
- case-building workflows
- compliance workflows
- audit logs and review decisions

Core idea: every generated claim should trace back to source evidence.
