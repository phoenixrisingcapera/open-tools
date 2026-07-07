# Install Open Tools

## Project Install

Recommended installer:

```bash
/path/to/open-tools/scripts/install-opencode-tools.sh /path/to/your/project
```

Then restart opencode and run:

```text
/toolbox
```

Manual install from a project root:

```bash
mkdir -p .opencode/agent .opencode/command .opencode/skills
cp /path/to/open-tools/opencode/agents/*.md .opencode/agent/
cp /path/to/open-tools/opencode/commands/*.md .opencode/command/
cp -R /path/to/open-tools/opencode/skills/* .opencode/skills/
cp /path/to/open-tools/opencode/templates/session-kanban.md .opencode/session-kanban.md
```

Restart opencode after copying. opencode does not hot-reload agents, commands, or skills.

## Minimal Install

If you only want durable todos:

```bash
mkdir -p .opencode/agent .opencode/command
cp /path/to/open-tools/opencode/agents/session-kanban-keeper.md .opencode/agent/
cp /path/to/open-tools/opencode/commands/save-kanban.md .opencode/command/
cp /path/to/open-tools/opencode/commands/show-kanban.md .opencode/command/
cp /path/to/open-tools/opencode/templates/session-kanban.md .opencode/session-kanban.md
```

## Global Install

You can also copy agents and commands into your global opencode config directory:

```bash
mkdir -p ~/.config/opencode/agent ~/.config/opencode/command ~/.config/opencode/skills
cp /path/to/open-tools/opencode/agents/*.md ~/.config/opencode/agent/
cp /path/to/open-tools/opencode/commands/*.md ~/.config/opencode/command/
cp -R /path/to/open-tools/opencode/skills/* ~/.config/opencode/skills/
```

Use project install when you want `.opencode/session-kanban.md`, `.opencode/repo-map.md`, logs, and ADRs stored with the project.

## Verify

After restart, try:

```text
/toolbox
/show-kanban
/audit-completion
```
