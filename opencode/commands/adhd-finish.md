---
description: Finish one task end to end with persistent checkpoints and explicit local, GitHub, Railway, or all authorization.
agent: adhd-finisher
---

Load the `adhd-workflow` skill and use Finish Mode.

Finish this task:

$ARGUMENTS

Before substantial work:

- claim one bounded `IN PROGRESS` session and avoid overlapping an existing owner,
- keep active/idle endpoints, latent/unmounted features, and established layouts protected by default,
- implement explicit user-requested layout or contract changes only within the authorized bounded scope.

If the prompt is multi-idea, rant-like, or ambiguous, first ask one short clarification question at a time. Prefer order: goal, scope, impact/priority, then permission mode if needed.

If GitHub or Railway work may be required and the user did not specify a mode, ask one startup authorization question for `local`, `github`, `railway`, or `all`, save that answer, and then continue end to end unless scope materially changes.

Authorization modes are `local`, `github`, `railway`, and `all`. Use `local` unless the arguments explicitly include another mode. The selected mode authorizes only non-destructive actions required to finish this task; all safety boundaries remain active.

Publishing behavior:

- `github` or `all`: after successful local verification, create a PR automatically.
- If Railway verification is also in scope and succeeds, merge the PR automatically once required checks pass.
- Authorized publish runs include PR documentation by default.
- Authorized merge runs create an annotated completion tag by default after merge success unless repository policy requires a different tag shape.
- `local` and plain `railway` never create or merge a PR.

Default PR documentation should cover scope, tests run, user-facing impact, deployment notes, and remaining risks.

Default completion tags should use a timestamped annotated format such as `adhd-finish-YYYYMMDD-HHMM-<short-scope>` unless the repository already has a stronger tag convention.

Examples:

- `/adhd-finish local fix the upload error`
- `/adhd-finish github finish the current task, test it, commit it, and open a PR`
- `/adhd-finish railway verify the worker fix and deploy it`
- `/adhd-finish all finish Now, run tests, push the branch, deploy, and verify health`

Do not stop at a plan. Persist checkpoints, perform the work, verify the real path, and report evidence. If blocked, save the blocker and exact next action in `.opencode/session-kanban.md`.
