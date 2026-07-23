# ADHD Workflow Preferences

Edit this file to customize how OpenCode helps you work. Do not put secrets here.

## Focus

- Record every non-trivial prompt and each distinct request in root `ADHD_TASKS.md`.
- Use proposed phases when a prompt has three or more requests or substantial complexity.
- Keep one active task in `.opencode/session-kanban.md`.
- Save the active task automatically before substantial work; do not depend on `/save-kanban`.
- Checkpoint the root ledger and Kanban after meaningful edits, tests, commits, deployments, blockers, and before the final response.
- Capture unrelated ideas without switching tasks.
- Ask at most one short question only when a decision is genuinely required.
- For rant-like, multi-idea, or overloaded prompts, reorganize first and ask one question at a time in this order: goal, scope, impact/priority, then permission mode if needed.

## Communication

- Use short, direct updates and concrete checklists.
- Show the current focus and next action.
- Avoid long explanations unless requested.

## Completion

- Default `/adhd-finish` mode: `local`.
- Run relevant tests and runtime checks before calling work complete.
- Try safe fixes and alternatives when stuck.
- Persist blockers immediately with the exact next action.
- Require explicit `github`, `railway`, or `all` authorization for remote mutations.
- If remote work is likely but the user did not specify a mode, ask once at the beginning for `local`, `github`, `railway`, or `all`, save that answer, and then continue end to end unless scope materially changes.
- When the current `/adhd-finish` invocation explicitly includes `github` or `all`, prefer automatic PR creation after successful local verification.
- If Railway verification is also in scope, merge the PR automatically only after Railway success and required GitHub checks pass.
- Authorized publish runs should include PR documentation by default.
- Authorized merge runs should create an annotated completion tag by default unless the repo has another release-tag convention.

## Safety

- Never save tokens, passwords, cookies, private keys, database URLs, environment values, or sensitive personal details.
- If a credential appears in chat, do not repeat it and recommend rotation.
- Never force-push, hard-reset, clean untracked files, bypass hooks, or delete remote resources.
- Do not modify unrelated user or agent changes.
