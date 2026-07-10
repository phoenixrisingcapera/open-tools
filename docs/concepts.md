# Concepts

Open Tools is built on four primitives: **agents**, **commands**, **skills**, and **packs**. This document explains what each one is and how they work together.

---

## Agents

An agent is a specialized AI persona with a defined purpose, rules, and permissions.

Agents are markdown files with YAML frontmatter that define:

- **description** — One sentence explaining what the agent does
- **mode** — Always `subagent` for Open Tools
- **permission** — What the agent can and cannot do

### Example Agent

```yaml
---
description: Maintains a persistent session Kanban so unfinished work survives token limits.
mode: subagent
permission:
  edit: ask
  bash: ask
---

You are a session Kanban keeper.

Purpose:
- Preserve unfinished work across AI sessions.
- Keep a concise board at `.opencode/session-kanban.md`.

Rules:
- You may edit only `.opencode/session-kanban.md`.
- Do not edit application code.
- Do not commit, push, or delete anything.
```

### Permission Levels

- **edit: deny** — The agent cannot edit files (read-only auditors)
- **edit: ask** — The agent must ask before editing
- **bash: deny** — The agent cannot run shell commands
- **bash: ask** — The agent must ask before running commands

### Where Agents Live

```text
opencode/agents/          # Source in Open Tools repo
.opencode/agent/          # Installed in your project
```

---

## Commands

A command is a slash command that invokes an agent with a specific prompt.

Commands are markdown files that reference an agent and define the user-facing command name.

### Example Command

```yaml
---
description: Save the current session state into a persistent Kanban handoff.
agent: session-kanban-keeper
---

Save a session handoff into `.opencode/session-kanban.md`.

Include:
- what was completed today
- what is still in progress
- what should be done next
- blockers or unknowns

User notes:
$ARGUMENTS
```

The `$ARGUMENTS` placeholder is replaced with whatever the user types after the command.

### Command Naming

The filename becomes the command name:

- `save-kanban.md` → `/save-kanban`
- `review-diff.md` → `/review-diff`

### Where Commands Live

```text
opencode/commands/        # Source in Open Tools repo
.opencode/command/        # Installed in your project
```

---

## Skills

A skill is a reusable instruction set that any agent can load.

Skills enforce best practices and workflows without duplicating logic across agents.

### Example Skill

```yaml
---
name: safe-git-workflow
description: Use when committing, pushing, or auditing Git state.
---

# Safe Git Workflow

## Rules

- Never use `git reset --hard`, `git checkout --`, or `git clean`.
- Before committing, inspect `git status`, `git diff`, and `git log`.
- Stage only intended files.
- Do not commit secrets or credentials.
```

### When to Use Skills

Skills are useful when:

- Multiple agents need the same instructions
- You want to enforce a workflow (e.g., git safety)
- You want to separate concerns (e.g., git rules vs agent logic)

### Where Skills Live

```text
opencode/skills/          # Source in Open Tools repo
.opencode/skills/         # Installed in your project
```

Each skill is a directory with a `SKILL.md` file:

```text
opencode/skills/
├── safe-git-workflow/
│   └── SKILL.md
├── verify-before-build/
│   └── SKILL.md
```

---

## Packs

A pack is a curated group of commands for a specific workflow.

Packs are defined in `open-tools-manifest.json`:

```json
{
  "packs": {
    "memory": ["show-kanban", "save-kanban", "archive-session", "adr", "map-repo"],
    "preflight": ["audit-completion", "review-diff", "security-check", "release-check"],
    "feature-delivery": ["fullstack-feature", "build-feature-no-drift", "find-idle-surfaces"]
  }
}
```

### Available Packs

| Pack | Purpose |
|------|---------|
| **memory** | Preserve context across sessions |
| **preflight** | Audit before committing or deploying |
| **feature-delivery** | Build features without drift |
| **software-company** | Run a project end-to-end |
| **ai-product-design** | Design AI-powered features |

---

## Templates

Templates are starter files that agents create on demand.

### Session Kanban Template

The kanban template is installed as `.opencode/session-kanban.md` and maintained by `/save-kanban` and `/show-kanban`.

```markdown
# Session Kanban

Last updated: YYYY-MM-DD HH:MM TZ

## Now
- [ ] One active item only when possible.

## Next
- [ ] Ordered pending work.

## Blocked
- [ ] Blocked item - blocker: reason.

## Done Today
- [x] Completed item.

## Decisions
- Short durable decisions.
```

### Other Templates

- `adr.md` — Architecture Decision Record template
- `repo-map.md` — Repository architecture guide template
- `session-log.md` — Daily session summary template

---

## How It All Fits Together

```text
User runs /save-kanban
  ↓
Command (save-kanban.md) references agent (session-kanban-keeper)
  ↓
Agent loads skill (safe-git-workflow) if needed
  ↓
Agent reads/writes template (session-kanban.md)
  ↓
Agent follows rules from frontmatter (edit: ask, bash: ask)
  ↓
Work is preserved for next session
```

---

## Manifest

The manifest (`open-tools-manifest.json`) is the source of truth for:

- Pack membership
- Agent list
- Version
- Entry command

```json
{
  "name": "open-tools",
  "version": "0.4.0",
  "entry_command": "/toolbox",
  "packs": { ... },
  "agents": [ ... ]
}
```

---

## Next Steps

- [Quickstart](quickstart.md) — Get Open Tools running in 2 minutes
- [Workflows](workflows.md) — Detailed workflow guides
- [Agent catalog](agent-catalog.md) — Full agent reference
- [Contributing](../CONTRIBUTING.md) — Add your own agents
