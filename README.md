# Open Tools

**Reusable opencode agents, commands, and skills for AI-assisted software development.**

Open Tools is a workflow pack — not a runtime framework. Copy the agents into your project and start using them immediately with [opencode](https://opencode.ai).

Free and open source. MIT licensed. Fork it, extend it, ship it.

---

## What It Does

Open Tools gives you a team of specialized AI agents that handle the full software lifecycle:

- **Memory & handoff** — Never lose context across token limits or sessions
- **Preflight checks** — Audit git state, security, and deployment readiness before shipping
- **Feature delivery** — Build features without architecture drift or duplicate implementations
- **Role-based execution** — Dedicated agents for product, frontend, backend, QA, and deployment
- **AI workflow design** — Bounded, reviewable AI workflows with strict contracts and audit trails

---

## Quick Install

From your project root:

```bash
git clone https://github.com/phoenixrisingcapera/open-tools.git /tmp/open-tools
/tmp/open-tools/scripts/install-opencode-tools.sh .
```

Or install manually:

```bash
mkdir -p .opencode/agent .opencode/command .opencode/skills
cp /path/to/open-tools/opencode/agents/*.md .opencode/agent/
cp /path/to/open-tools/opencode/commands/*.md .opencode/command/
cp -R /path/to/open-tools/opencode/skills/* .opencode/skills/
cp /path/to/open-tools/opencode/templates/session-kanban.md .opencode/session-kanban.md
```

Then restart opencode and run:

```text
/toolbox
```

See [docs/install.md](docs/install.md) for global install, minimal install, and verification steps.

---

## How It Works

Open Tools is built on four primitives:

| Primitive | What It Is | Example |
|-----------|------------|---------|
| **Agent** | A specialized AI persona with rules, permissions, and a purpose | `session-kanban-keeper` maintains your todo list across sessions |
| **Command** | A slash command that invokes an agent with a specific prompt | `/save-kanban` saves your current work state |
| **Skill** | Reusable instructions that any agent can load | `safe-git-workflow` enforces git best practices |
| **Pack** | A curated group of commands for a workflow | `memory` pack: kanban, archiving, ADRs, repo maps |

Agents are defined as markdown files with YAML frontmatter. Commands are markdown files that reference an agent. Skills are instruction sets. Packs are groupings in the manifest.

See [docs/concepts.md](docs/concepts.md) for a deeper explanation.

---

## Agents & Commands

| Agent | Command | What It Does |
|-------|---------|--------------|
| **toolbox-navigator** | `/toolbox` | Shows a menu and recommends the right agent/command for your task |
| **session-kanban-keeper** | `/show-kanban` `/save-kanban` | Maintains a persistent kanban so unfinished work survives token limits |
| **session-archivist** | `/archive-session` | Writes daily session summaries, decisions, blockers, and commits to `session-log/` |
| **decision-journalist** | `/adr` | Captures decisions as lightweight ADRs with context, options, and revisit triggers |
| **repo-cartographer** | `/map-repo` | Maps a repo into a durable architecture guide covering entry points, data flow, and risks |
| **github-completion-auditor** | `/audit-completion` | Audits git state, pushed commits, deployments, and local jobs — read-only |
| **pr-reviewer** | `/review-diff` | Reviews diffs/PRs for bugs, regressions, missing tests, security risks, and blockers |
| **release-captain** | `/release-check` | Runs release readiness preflight — git, tests, migrations, docs, deploy, rollback |
| **security-privacy-sentinel** | `/security-check` | Audits for secret leaks, unsafe auth, PII exposure, logging risks, and privacy regressions |
| **no-drift-feature-builder** | `/build-feature-no-drift` | Builds features without architecture, endpoint, or data-contract drift |
| **fullstack-endpoint-builder** | `/fullstack-feature` | Builds full-stack features with backend, frontend, contract validation, and wiring proof |
| **idle-surface-detector** | `/find-idle-surfaces` | Finds orphaned endpoints, components, routes, mocks, tests, and duplicate surfaces |
| **founder-strategist** | `/founder-memo` | Sets founder-level product direction — outcomes, non-goals, launch criteria, tradeoffs |
| **product-manager** | `/product-decisions` | Converts strategy into concrete product decisions, scope, and acceptance criteria |
| **senior-backend** | `/backend-task` | Implements/reviews backend work — API contracts, data safety, migrations, auth, jobs |
| **senior-frontend** | `/frontend-task` | Implements/reviews frontend work — UI correctness, responsiveness, accessibility, API handling |
| **qa-launch-verifier** | `/qa-launch` | Runs QA checks for routes, forms, desktop/mobile behavior, builds, and smoke tests |
| **railway-maintenance** | `/railway-check` | Audits Railway deployments, service roots, health checks, env assumptions, and blockers |
| **conversion-copywriter** | `/copy-review` | Writes conversion-focused copy for pages, CTAs, emails, docs — without inventing proof |
| **seo-llm-discovery** | `/seo-review` | Reviews pages for SEO, metadata, schema, internal links, and LLM discoverability |
| **ux-conversion-reviewer** | `/ux-review` | Reviews UX hierarchy, trust, accessibility, responsive behavior, and conversion friction |
| **bounded-agent-architect** | `/design-agent-workflow` | Designs bounded AI workflows with strict contracts, validation, persistence, and audit trails |
| **structured-output-designer** | `/design-structured-output` | Designs strict JSON schemas, prompt rules, validation, retries, and tests for AI output |
| **document-extraction-agent** | `/design-extraction` | Designs exact-text extraction workflows preserving source order, blocks, and uncertainty |
| **domain-classifier** | `/design-classifier` | Designs classification agents with controlled labels, confidence, reasons, and JSON output |
| **docs-and-push** | `/docs-and-push` | Generates/updates documentation, commits, and pushes to main — saves to kanban if interrupted |

---

## Packs

Packs group commands by workflow. Use the manifest to see which commands belong to which pack.

| Pack | Commands | Use When |
|------|----------|----------|
| **memory** | `/show-kanban` `/save-kanban` `/archive-session` `/adr` `/map-repo` `/docs-and-push` | You need to preserve context across sessions |
| **preflight** | `/audit-completion` `/review-diff` `/security-check` `/release-check` | You're about to commit, push, or deploy |
| **feature-delivery** | `/fullstack-feature` `/build-feature-no-drift` `/find-idle-surfaces` `/map-repo` `/review-diff` `/security-check` | You're building a new feature |
| **software-company** | `/founder-memo` `/product-decisions` `/copy-review` `/seo-review` `/ux-review` `/frontend-task` `/backend-task` `/qa-launch` `/railway-check` | You're running a project end-to-end |
| **ai-product-design** | `/design-agent-workflow` `/design-structured-output` `/design-extraction` `/design-classifier` | You're designing AI-powered features |

---

## Skills

Skills are reusable instruction sets that agents can load. They enforce best practices and workflows.

| Skill | Purpose |
|-------|---------|
| `safe-git-workflow` | Enforces git best practices — no destructive commands, stage review, commit hygiene |
| `verify-before-build` | Always load before any task — read existing docs, confirm what exists, prevent drift |
| `no-architecture-drift` | Prevents duplicate routes, services, and endpoints when building features |
| `fullstack-endpoint-wiring` | Verifies route, schema, API client, UI state, and data contract alignment |
| `idle-surface-detection` | Finds unused endpoints, components, routes, and mocks without deleting anything |
| `codebase-audit` | Audits for duplicate endpoints, contract drift, N+1 queries, and error-handling gaps |
| `evidence-auditability` | Ensures source traceability for legal, compliance, and case-building workflows |
| `public-repo-polish` | Prepares repos for public use — installation clarity, examples, licensing |
| `opencode-agent-authoring` | Guidelines for creating agents, commands, and skills |

---

## Common Workflows

### Start of Day

```text
/show-kanban
```

Review what was left unfinished from the previous session. Pick up where you left off.

### Build a Feature

```text
/fullstack-feature
```

Or if drift is the main risk:

```text
/build-feature-no-drift
```

### Before You Push

```text
/audit-completion
/review-diff
/security-check
```

### End of Day

```text
/save-kanban
/archive-session
```

Preserve your work state for the next session.

See [docs/workflows.md](docs/workflows.md) for detailed workflow guides.

---

## Safety Model

- **Review and audit agents are read-only by default.** They cannot edit files.
- **Memory agents only write under `.opencode/`** unless explicitly asked otherwise.
- **Agents must not print or store secrets**, tokens, cookies, database URLs, private keys, or credentials.
- **Destructive git commands are forbidden** unless explicitly requested and confirmed.
- **Agents follow `safe-git-workflow`** — no `git reset --hard`, no force-push, no `git clean`.

---

## Repo Layout

```text
open-tools/
├── opencode/
│   ├── agents/          # Agent definitions (markdown + YAML frontmatter)
│   ├── commands/        # Command definitions (reference an agent)
│   ├── skills/          # Reusable instruction sets
│   ├── templates/       # Kanban, ADR, repo-map, session-log templates
│   └── open-tools-manifest.json
├── docs/
│   ├── install.md
│   ├── quickstart.md
│   ├── concepts.md
│   ├── workflows.md
│   ├── agent-catalog.md
│   ├── audit-playbook.md
│   ├── useful-links.md
│   └── legacy/
├── scripts/
│   └── install-opencode-tools.sh
├── README.md
├── CONTRIBUTING.md
├── LICENSE
└── .gitignore
```

---

## Requirements

- [opencode](https://opencode.ai) — the AI coding tool this pack is built for
- Git (for version control workflows)
- A project repo to install into

---

## FAQ

**Q: Is this a framework or runtime?**  
A: No. Open Tools is a collection of markdown files that opencode reads. There's no runtime, no dependencies, no build step.

**Q: Can I use this with other AI tools?**  
A: The agents are written for opencode's agent system. Other tools may need adaptation.

**Q: Can I modify the agents?**  
A: Yes. That's the point. Copy them into your project and customize them for your workflow.

**Q: How do I add my own agents?**  
A: See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on creating agents, commands, and skills.

**Q: Is this free?**  
A: Yes. MIT licensed. Use it however you want.

**Q: Why not just use Copilot/Cursor?**  
A: Open Tools gives you specialized, bounded agents with explicit permissions, memory across sessions, and workflow enforcement. General-purpose AI assistants don't enforce git safety, prevent architecture drift, or maintain persistent kanban boards.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding agents, commands, skills, and documentation.

---

## License

MIT. See [LICENSE](LICENSE).

Copyright (c) 2026 Andrea Capera

---

## Links

- [opencode docs](https://opencode.ai/docs)
- [Installation guide](docs/install.md)
- [Quickstart](docs/quickstart.md)
- [Concepts](docs/concepts.md)
- [Workflows](docs/workflows.md)
- [Agent catalog](docs/agent-catalog.md)
