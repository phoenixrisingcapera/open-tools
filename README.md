# Open Tools

Reusable opencode agents, commands, skills, and templates for AI-assisted software work.

Open Tools is a workflow pack, not a runtime framework.

## What It Covers

- Memory and handoff files for token limits.
- Preflight checks for Git, PRs, deploys, and running jobs.
- Feature delivery without drift.
- Full-stack endpoint wiring checks.
- Role-based agents for product, frontend, backend, QA, and deployment work.
- Bounded AI workflow design and structured output patterns.

## Start Here

1. Install: `docs/install.md`
2. Use: `docs/workflows.md`
3. Browse commands and agents: `docs/agent-catalog.md`
4. Legacy notes: `docs/legacy/README.md`
5. Audit code vs docs: `docs/audit-playbook.md`

## Legacy

Historical or aspirational notes live in `docs/legacy/`.

## Quick Install

From your project root:

```bash
/path/to/open-tools/scripts/install-opencode-tools.sh /path/to/your/project
```

Or install manually:

```bash
mkdir -p .opencode/agent .opencode/command .opencode/skills
cp /path/to/open-tools/opencode/agents/*.md .opencode/agent/
cp /path/to/open-tools/opencode/commands/*.md .opencode/command/
cp -R /path/to/open-tools/opencode/skills/* .opencode/skills/
cp /path/to/open-tools/opencode/templates/session-kanban.md .opencode/session-kanban.md
```

Then restart opencode and run `/toolbox`.

## Safety Model

- Review and audit agents are read-only by default.
- Memory agents only write under `.opencode/` unless asked otherwise.
- Agents must not print or store secrets, tokens, cookies, database URLs, private keys, or credentials.
- Destructive Git commands are forbidden unless explicitly requested and confirmed.

## Repo Layout

```text
opencode/
  agents/
  commands/
  skills/
  templates/
docs/
```

## References

- `docs/useful-links.md`
- `opencode/open-tools-manifest.json`

## License

MIT. See `LICENSE`.
