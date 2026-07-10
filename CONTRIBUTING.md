# Contributing to Open Tools

Thanks for your interest in contributing! Open Tools is free and open source, and we welcome contributions of all kinds.

---

## Ways to Contribute

- **Add new agents** — Specialized personas for specific workflows
- **Add new commands** — Slash commands that invoke agents
- **Add new skills** — Reusable instruction sets
- **Improve documentation** — Fix typos, clarify concepts, add examples
- **Report bugs** — Open an issue if something doesn't work
- **Suggest features** — Open an issue to discuss new ideas

---

## Adding a New Agent

Agents live in `opencode/agents/`. Each agent is a markdown file with YAML frontmatter.

### Step 1: Create the Agent File

```bash
touch opencode/agents/my-new-agent.md
```

### Step 2: Add Frontmatter

```yaml
---
description: One sentence explaining what the agent does.
mode: subagent
permission:
  edit: ask
  bash: ask
---
```

**Permission levels:**

- `edit: deny` — Read-only (for auditors and reviewers)
- `edit: ask` — Must ask before editing (default for most agents)
- `bash: deny` — Cannot run shell commands
- `bash: ask` — Must ask before running commands (default)

### Step 3: Write the Agent Instructions

```markdown
You are a [role].

Purpose:
- What the agent does
- Why it exists

Rules:
- What the agent must not do
- Safety constraints
- Scope limitations

## Workflow

1. Step one
2. Step two
3. Step three

## Final Answer Format

- `Field one`: value
- `Field two`: value
```

### Step 4: Test the Agent

Install it into a project and run it:

```bash
cp opencode/agents/my-new-agent.md /path/to/project/.opencode/agent/
```

Restart opencode and verify the agent works as expected.

---

## Adding a New Command

Commands live in `opencode/commands/`. Each command is a markdown file that references an agent.

### Step 1: Create the Command File

```bash
touch opencode/commands/my-command.md
```

### Step 2: Add Frontmatter

```yaml
---
description: One sentence explaining what the command does.
agent: my-new-agent
---
```

The `agent` field must match the agent filename (without `.md`).

### Step 3: Write the Command Prompt

```markdown
Do the thing that this command is supposed to do.

Include:
- What to check
- What to report
- What to save

Additional instructions:
$ARGUMENTS
```

The `$ARGUMENTS` placeholder is replaced with user input.

### Step 4: Test the Command

```bash
cp opencode/commands/my-command.md /path/to/project/.opencode/command/
```

Restart opencode and run `/my-command`.

---

## Adding a New Skill

Skills live in `opencode/skills/`. Each skill is a directory with a `SKILL.md` file.

### Step 1: Create the Skill Directory

```bash
mkdir -p opencode/skills/my-new-skill
```

### Step 2: Create SKILL.md

```bash
touch opencode/skills/my-new-skill/SKILL.md
```

### Step 3: Add Frontmatter

```yaml
---
name: my-new-skill
description: Use when [trigger condition]; describes what the skill does.
---
```

### Step 4: Write the Skill Instructions

```markdown
# My New Skill

Use this skill when [condition].

## Rules

- Rule one
- Rule two

## Workflow

1. Step one
2. Step two
```

---

## Updating the Manifest

If you add an agent, update `opencode/open-tools-manifest.json`:

```json
{
  "agents": [
    ...
    "my-new-agent"
  ]
}
```

If the agent belongs to a pack, add it to the appropriate pack:

```json
{
  "packs": {
    "memory": [..., "my-new-command"]
  }
}
```

---

## Updating Documentation

If you add an agent or command, update:

1. **README.md** — Add to the agents table
2. **docs/agent-catalog.md** — Add a catalog entry
3. **docs/workflows.md** — Add to relevant workflows if applicable

---

## Style Guide

### Agent Names

- Use lowercase with hyphens: `session-kanban-keeper`
- Be descriptive but concise
- Match the filename

### Command Names

- Use lowercase with hyphens: `save-kanban`
- Start with a verb when possible: `review-diff`, `build-feature`
- Match the filename

### Descriptions

- One sentence
- Start with a verb: "Maintains", "Audits", "Builds"
- Explain what it does, not how

### Agent Instructions

- Use second person: "You are a..."
- Be specific about permissions and rules
- Include a final answer format
- Keep it concise but complete

---

## Pull Request Process

1. Fork the repo
2. Create a feature branch: `git checkout -b feat/my-new-agent`
3. Add your agent, command, or skill
4. Update the manifest and documentation
5. Test locally
6. Commit with a clear message: `feat: add my-new-agent`
7. Push and open a PR

---

## Code of Conduct

Be respectful. Be constructive. Assume good intentions.

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

## Questions?

Open an issue or reach out to the maintainers.
