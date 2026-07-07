# Open Tools

Reusable tools, agents, and workflow templates for AI-assisted software work.

## Included

- `opencode/agents/github-completion-auditor.md` - read-only audit agent for checking whether local Git/GitHub work is clean, pushed, and deployed.
- `opencode/agents/session-kanban-keeper.md` - persistent Kanban handoff agent for saving unfinished work across token limits and work sessions.
- `opencode/commands/audit-completion.md` - slash command for invoking the completion auditor.
- `opencode/commands/save-kanban.md` - slash command for saving a session handoff.
- `opencode/commands/show-kanban.md` - slash command for reviewing saved handoff state.
- `opencode/templates/session-kanban.md` - starter Kanban board.

## Install In A Project

From your project root:

```bash
mkdir -p .opencode/agent .opencode/command
cp /path/to/open-tools/opencode/agents/*.md .opencode/agent/
cp /path/to/open-tools/opencode/commands/*.md .opencode/command/
cp /path/to/open-tools/opencode/templates/session-kanban.md .opencode/session-kanban.md
```

Then restart opencode. opencode loads agent and command files at startup.

## Commands

```text
/audit-completion
/show-kanban
/save-kanban
```

You can pass notes after a command:

```text
/save-kanban backend tests blocked by missing pgvector, frontend deployed successfully
```

## Safety

- The completion auditor is read-only by design.
- The Kanban keeper should only edit `.opencode/session-kanban.md` unless you explicitly ask otherwise.
- Do not store secrets, tokens, cookies, database URLs, private keys, or environment values in Kanban notes.

## License

MIT. See `LICENSE`.
