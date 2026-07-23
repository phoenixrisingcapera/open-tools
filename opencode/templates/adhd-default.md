# Default ADHD And Memory Rules

Apply these rules to every task, even when no ADHD command is used.

## Visible Root Task Ledger

1. Use `ADHD_TASKS.md` in the project root as the human-visible prompt and progress ledger.
2. At the beginning of every non-trivial prompt, create or update a dated prompt section before substantial work.
3. Convert every distinct request into its own unchecked checkbox.
4. Append related remembered requests to the active section. Put unrelated ideas in `Later Ideas` unless priority explicitly changes.
5. For prompts with three or more requests or substantial complexity, add ordered, outcome-based `Proposed Phases` before implementation.
6. If the prompt is rant-like, multi-idea, ambiguous, or overloaded, reorganize it first and ask only one clarifying question at a time. Prefer question order: goal, then scope, then impact/priority, then permission mode if needed.
7. Mark tasks complete when evidence exists. Leave partial or blocked items unchecked with the blocker or exact next action.
8. Add concise progress notes after meaningful milestones and completion evidence before the final response.
9. Use one canonical root ledger with one section per prompt, not many loose prompt files.
10. Never overwrite or silently drop unfinished requests.
11. When the assistant offers numbered next-step options and the user chooses one by number, keep that chosen option active and save the remaining meaningful options into Kanban `Next` when possible.

## Automatic Kanban

1. At the start of non-trivial work, read `ADHD_TASKS.md` and `.opencode/session-kanban.md`.
2. Put the current phase in `Now` before substantial investigation or edits.
3. Preserve unrelated tasks. Put discovered work in `Next` instead of starting it.
4. Checkpoint after meaningful implementation, test, commit, deployment, or blocker milestones.
5. Before every final response, make the board match reality.
6. Do this automatically; `/save-kanban` is a manual backup, not a requirement.
7. Do not create implementation files merely to remember ideas.
8. If GitHub or Railway work may be needed and the user did not specify a mode, ask one startup authorization question (`local`, `github`, `railway`, `all`), save the answer, and continue without repeated permission questions unless scope materially changes.

## Focus And Completion

- Treat unrelated remembered thoughts as captures unless priority clearly changes.
- Do not leave speculative, placeholder, duplicate, or half-wired files behind.
- Complete tasks through relevant verification or persist their exact remaining work.
- Keep communication short and scannable.
- Before an authorized publish run, prefer reviewing the current ledger and blockers first.

## Secret And Personal Data Safety

- Never persist secret values or sensitive personal details.
- Use neutral action labels and never repeat a secret supplied by the user.
- Recommend rotating credentials pasted into chat; redaction cannot erase provider history.
- Treat the root ledger, Kanban, inbox, logs, snapshots, and chat storage as non-secret locations.
