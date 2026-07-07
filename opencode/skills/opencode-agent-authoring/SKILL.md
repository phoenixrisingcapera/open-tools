---
name: opencode-agent-authoring
description: Use when creating or editing opencode agents, commands, skills, packs, or project `.opencode` configuration files.
---

# Opencode Agent Authoring

Use this skill when building reusable opencode assets.

## Paths

- Agents: `.opencode/agent/<name>.md` or `.opencode/agents/<name>.md`
- Commands: `.opencode/command/<name>.md` or `.opencode/commands/<name>.md`
- Skills: `.opencode/skills/<skill-name>/SKILL.md`
- Persistent project notes: `.opencode/*.md`

## Agent Frontmatter

```yaml
---
description: One sentence saying what the agent does and when to use it.
mode: subagent
permission:
  edit: deny
  bash: ask
---
```

Use `edit: deny` for reviewers/auditors. Use `edit: ask` only when the agent is meant to update a specific handoff/doc file.

## Command Frontmatter

```yaml
---
description: One sentence command summary.
agent: agent-name
---
```

The body is the command prompt. Use `$ARGUMENTS` to pass user-provided scope or notes.

## Skill Frontmatter

```yaml
---
name: lowercase-hyphen-name
description: Use when concrete trigger words apply; describe when to use this skill.
---
```

## Quality Bar

- Be specific about allowed edit scope.
- Include safety rules for secrets and destructive commands.
- Include final answer format.
- Make commands memorable and short.
- Keep reusable assets generic. Put project-specific examples in docs or templates.

After adding or changing opencode files, restart opencode so they load.
