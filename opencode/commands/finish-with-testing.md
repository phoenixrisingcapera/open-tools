---
description: Finish one bounded task end to end with explicit local testing and shell-use authorization, then publish when the invocation includes github or all.
agent: adhd-finisher
---

Load the `adhd-workflow` skill and finish this task end to end:

$ARGUMENTS

Execution requirements:

- Treat local shell commands, local tests, local builds, local browser verification, and other local non-destructive verification steps as explicitly authorized for this command.
- Do not stop at a plan or proposal. Inspect, implement, test, verify, and finish the bounded task.
- Claim one bounded `IN PROGRESS` session before substantial work and avoid overlapping an existing owner.
- Preserve active/idle endpoints, latent or unmounted features, and established layouts by default unless the user explicitly authorizes a bounded change.
- Persist checkpoints in `ADHD_TASKS.md` and `.opencode/session-kanban.md` after meaningful milestones and before the final response.

Authorization modes:

- `local`: finish and verify locally only.
- `github`: finish locally, run relevant verification, then commit/push/open a PR automatically.
- `railway`: finish locally and perform only the requested Railway verification or deployment work.
- `all`: finish locally, publish to GitHub automatically, and complete any requested Railway work.

Use `local` unless the arguments explicitly include `github`, `railway`, or `all`.

Examples:

- `/finish-with-testing local fix the mounted sign-up submit bug and prove the real request path`
- `/finish-with-testing github finish the current open-tools command slice, run checks, and open a PR`
- `/finish-with-testing all complete the release blocker, verify locally, publish, and verify deployment`

If blocked, save the exact blocker and next command in `.opencode/session-kanban.md` before responding.
