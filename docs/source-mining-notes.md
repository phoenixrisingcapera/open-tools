# Source Mining Notes

Open Tools includes generalized patterns adapted from prior project work across Codex, opencode, product agents, deck-generation agents, and guardrail-heavy AI systems.

## Patterns Extracted

- Persistent Kanban and session archive files for surviving token limits.
- Read-only completion audits for Git/GitHub/deployment state.
- Software-company role agents: founder, product, copy, SEO, UX, frontend, backend, QA, deployment.
- Bounded AI workflow design: validate, build context, call model/tool, validate output, persist artifact, review before applying.
- Strict structured-output design for AI tasks consumed by code.
- Source-preserving extraction and controlled-label classification workflows.
- Evidence and auditability rules for sensitive workflows.

## What Was Not Copied

- Private project paths.
- Product-specific names and secrets.
- Deployment IDs, database URLs, tokens, or credentials.
- Large project-specific architecture docs that would not generalize.

## Public-Safe Principle

When importing more old work, adapt the reusable pattern instead of copying private implementation details verbatim.
