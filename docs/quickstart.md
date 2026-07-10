# Quickstart

Get Open Tools running in your project in under 2 minutes.

## Prerequisites

- [opencode](https://opencode.ai) installed
- Git installed
- A project repository

## Step 1: Clone Open Tools

```bash
git clone https://github.com/phoenixrisingcapera/open-tools.git /tmp/open-tools
```

## Step 2: Install Into Your Project

From your project root:

```bash
/tmp/open-tools/scripts/install-opencode-tools.sh .
```

This copies all agents, commands, skills, and templates into your `.opencode/` directory.

### Manual Install

If the script doesn't work or you prefer manual control:

```bash
mkdir -p .opencode/agent .opencode/command .opencode/skills
cp /tmp/open-tools/opencode/agents/*.md .opencode/agent/
cp /tmp/open-tools/opencode/commands/*.md .opencode/command/
cp -R /tmp/open-tools/opencode/skills/* .opencode/skills/
cp /tmp/open-tools/opencode/templates/session-kanban.md .opencode/session-kanban.md
```

## Step 3: Restart opencode

opencode doesn't hot-reload agents. Restart it:

```bash
# If running in terminal, exit and restart
opencode
```

## Step 4: Verify Installation

Run the toolbox command:

```text
/toolbox
```

You should see a menu of available commands. If you don't, check that the files were copied correctly.

## Step 5: Try Your First Commands

### Save Your Current State

```text
/save-kanban
```

This creates `.opencode/session-kanban.md` with your current work state.

### Map Your Repository

```text
/map-repo
```

This creates `.opencode/repo-map.md` — a durable architecture guide for your repo.

### Audit Completion

```text
/audit-completion
```

This checks if your work is finished, pushed, and deployed.

## Step 6: Pick a Workflow

### Building a Feature?

```text
/fullstack-feature
```

Or if you're worried about drift:

```text
/build-feature-no-drift
```

### Before You Push?

```text
/audit-completion
/review-diff
/security-check
```

### End of Day?

```text
/save-kanban
/archive-session
```

## What's Next?

- Read [docs/concepts.md](concepts.md) to understand agents, commands, skills, and packs
- Read [docs/workflows.md](workflows.md) for detailed workflow guides
- Browse [docs/agent-catalog.md](agent-catalog.md) for the full agent list
- Read [CONTRIBUTING.md](../CONTRIBUTING.md) to add your own agents

## Troubleshooting

**Q: `/toolbox` doesn't appear**  
A: Make sure you restarted opencode after copying the files. Check that `.opencode/agent/` and `.opencode/command/` contain the files.

**Q: Agents don't seem to work**  
A: Check that the agent files have the correct YAML frontmatter. The `mode: subagent` line is required.

**Q: I want to customize an agent**  
A: Edit the file in `.opencode/agent/` directly. Your changes are local to your project.

**Q: How do I update Open Tools?**  
A: Re-run the install script. It will overwrite the files. If you've customized agents, back them up first.
