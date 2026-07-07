# Open Tools

Reusable opencode agents, commands, skills, and templates for keeping AI-assisted software work organized, safe, and finishable.

Open Tools is a lightweight workflow pack for developers who use AI coding agents and need better memory, safer Git habits, clearer release checks, and reusable review agents.

## Why Use This

- Keep todos alive across token limits with a persistent Kanban board.
- Start a day with saved context instead of reconstructing yesterday from memory.
- Audit whether work is clean, pushed, deployed, and free of obvious running jobs.
- Review diffs for bugs, missing tests, security/privacy risks, and release blockers.
- Maintain repo maps, daily logs, and decision records for future humans and agents.

## Quick Install

From your project root:

```bash
mkdir -p .opencode/agent .opencode/command .opencode/skills
cp /path/to/open-tools/opencode/agents/*.md .opencode/agent/
cp /path/to/open-tools/opencode/commands/*.md .opencode/command/
cp -R /path/to/open-tools/opencode/skills/* .opencode/skills/
cp /path/to/open-tools/opencode/templates/session-kanban.md .opencode/session-kanban.md
```

Then restart opencode. opencode loads agents, commands, and skills at startup.

More detail: `docs/install.md`.

## Core Commands

```text
/show-kanban
/save-kanban
/audit-completion
/map-repo
/review-diff
/release-check
/security-check
/archive-session
/adr
/founder-memo
/product-decisions
/copy-review
/seo-review
/ux-review
/frontend-task
/backend-task
/qa-launch
/railway-check
/design-agent-workflow
/design-structured-output
/design-extraction
/design-classifier
```

Examples:

```text
/save-kanban backend tests blocked by missing pgvector, frontend deployed successfully
/audit-completion check backend and frontend repos plus Railway deployments
/review-diff focus on auth/session changes
/adr use Railway for frontend deployment instead of Vercel
```

## Agents

- `github-completion-auditor` - read-only audit for clean working trees, pushed commits, deployments, and local jobs.
- `session-kanban-keeper` - persistent `.opencode/session-kanban.md` board for unfinished work.
- `repo-cartographer` - creates `.opencode/repo-map.md` for fast repo understanding.
- `pr-reviewer` - reviews diffs/PRs for bugs, regressions, missing tests, and risk.
- `release-captain` - release readiness preflight with go/no-go output.
- `security-privacy-sentinel` - checks secrets, auth/session risks, PII/logging issues, and privacy regressions.
- `session-archivist` - writes daily logs under `.opencode/session-log/`.
- `decision-journalist` - writes lightweight ADRs under `.opencode/decisions/`.
- `founder-strategist` - creates founder-level decision memos, priorities, non-goals, and success criteria.
- `product-manager` - converts strategy into scope, product decisions, launch priorities, and acceptance criteria.
- `conversion-copywriter` - writes conversion-focused copy without inventing proof.
- `seo-llm-discovery` - reviews SEO, metadata, schema, FAQ, internal links, and LLM-answerability.
- `ux-conversion-reviewer` - reviews UX hierarchy, trust, accessibility, responsive behavior, and conversion friction.
- `senior-frontend` - frontend implementation/review with accessibility, responsive behavior, and verification focus.
- `senior-backend` - backend implementation/review with API, data, migrations, auth, jobs, and reliability focus.
- `qa-launch-verifier` - repeatable QA launch checks for routes, forms, builds, and smoke tests.
- `railway-maintenance` - Railway deployment/configuration audit without exposing secrets.
- `bounded-agent-architect` - designs reviewable AI workflows with strict contracts, validation, persistence, and audit trails.
- `structured-output-designer` - designs strict JSON schemas, prompt rules, validation, persistence, and tests.
- `document-extraction-agent` - designs exact-text extraction workflows for PDFs, slides, emails, and documents.
- `domain-classifier` - designs controlled-label classification agents with evidence status, confidence, and reasons.

## Skills

- `safe-git-workflow` - status/diff/log discipline before commit/push/PR.
- `opencode-agent-authoring` - guidance for writing valid opencode agents, commands, and skills.
- `public-repo-polish` - README/install/license/safety guidance for open-source repos.
- `evidence-auditability` - source traceability, review decisions, audit logs, and non-destructive workflows.

## Templates

- `session-kanban.md`
- `repo-map.md`
- `session-log.md`
- `adr.md`

## Suggested Workflow

Start the day:

```text
/show-kanban
/audit-completion
```

Before a commit or PR:

```text
/review-diff
/security-check
```

Before a deploy:

```text
/release-check
```

End the day or before token limits:

```text
/save-kanban
/archive-session
```

## Safety Model

- Review/audit agents are read-only by default.
- Memory agents only write under `.opencode/` unless you explicitly ask otherwise.
- Agents are instructed not to print or store secrets, tokens, cookies, database URLs, private keys, or credentials.
- Destructive Git commands are forbidden unless a user explicitly asks and confirms.

## Repo Layout

```text
opencode/
  agents/
  commands/
  skills/
  templates/
docs/
```

## Useful Links

- opencode docs: https://opencode.ai/docs
- opencode config schema: https://opencode.ai/config.json
- NVIDIA NeMo Guardrails: https://github.com/NVIDIA/NeMo-Guardrails
- NVIDIA NeMo Guardrails docs: https://docs.nvidia.com/nemo/guardrails/latest/
- OpenAI Agents SDK: https://github.com/openai/openai-agents-python
- LangGraph: https://github.com/langchain-ai/langgraph
- Microsoft AutoGen: https://github.com/microsoft/autogen
- CrewAI: https://github.com/crewAIInc/crewAI
- Repomix codebase packer: https://github.com/yamadashy/repomix
- Gitingest codebase-to-prompt: https://github.com/cyclotruc/gitingest
- Sourcegraph Cody: https://sourcegraph.com/cody

See `docs/useful-links.md` for why these are included.

## License

MIT. See `LICENSE`.
