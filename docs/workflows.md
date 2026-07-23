# Workflows

## AI Memory Stack

Use these together to avoid losing context across token limits:

- `/adhd-add <thought>` - park an interruption without changing the active task.
- `/adhd-focus` - resume the one active task.
- `/clear-thinking <topic>` - save each idea safely and ask one important question at a time to finish the thought.
- `/adhd-review-publish` - review completion and publish readiness before a remote finish run.
- `/adhd-finish local|github|railway|all <task>` - finish with explicit remote authorization.
- `/finish-with-testing local|github|railway|all <task>` - finish end to end with explicit local shell/testing/build/browser verification.
- `/explain-me <question>` - stay read-only while understanding code, architecture, or decisions.
- `/show-kanban` - start from current unfinished work.
- `/save-kanban` - preserve current todos before stopping.
- `/archive-session` - save a dated historical summary.
- `/map-repo` - create durable repo context.
- `/adr` - save decisions that should not be rediscovered later.

When installed with the privacy-first config, `adhd-finisher` is the default agent and updates the Kanban automatically. `/save-kanban` remains a manual backup rather than something the user must remember. Public conversation sharing is disabled by default in that generated config.

### Root Prompt Ledger

`ADHD_TASKS.md` is the visible source of task progress. For every non-trivial prompt, the agent:

1. Creates a dated prompt section.
2. Records each request as a separate checkbox.
3. Adds proposed phases for three or more requests or substantial work.
4. Marks tasks and phases complete as evidence is produced.
5. Appends related remembered requests without replacing active work.
6. Parks unrelated ideas in `Later Ideas` and resumes the active phase.
7. Records blockers and exact resume actions before stopping.

Within explicitly authorized remote modes, the ADHD workflow also prefers completion over leaving work behind:

- `github` or `all` creates a PR automatically after successful local verification.
- If Railway verification is in scope, the PR is merged automatically only after Railway success and required GitHub checks pass.
- Authorized publish runs include PR documentation by default.
- Authorized merge runs create annotated completion tags by default.
- Failures, protections, or missing auth are saved as exact blockers instead of silently stopping.

The single ledger prevents a directory full of disconnected task files while still giving every prompt a durable section.

### Secret-Local Rule

Across these workflows, secrets should stay local:

- do not paste passwords, tokens, cookies, private keys, DB URLs, or secret env values into chat
- do not persist them into `ADHD_TASKS.md`, `.opencode/session-kanban.md`, `.opencode/adhd-inbox.md`, docs, fixtures, or Git
- capture only redacted action labels when a reminder is needed
- prefer direct browser entry or local env configuration when a command needs authentication

## Completion Audit

Use `/audit-completion` before commits, PRs, or deploys.

It checks operational readiness: working tree, branch state, pushed commits, GitHub or PR status, deploy state, and local jobs.

## Preflight Suite

Use these with `/audit-completion` when you need a deeper release check:

- `/review-diff` - are there bugs or missing tests?
- `/security-check` - did secrets, PII, or auth/session risk slip in?
- `/release-check` - is this safe to release?

## Feature Delivery

Use `/fullstack-feature` when the feature touches backend and frontend and you need endpoint wiring proven end to end.

Use `/build-feature-no-drift` when the main risk is duplicate architecture, unclear canonical files, or old implementations that might need pruning.

Use `/find-idle-surfaces` before cleanup or refactors to discover likely unused endpoints, components, clients, mocks, tests, and duplicate surfaces.

The workflow is:

1. Inspect current architecture before editing.
2. Verify existing endpoints, routes, services, pages, and components.
3. Identify canonical files and duplicate/same-purpose files.
4. Implement in the canonical path only.
5. Verify request/response data contracts.
6. Verify frontend API/client/page wiring.
7. Explain whether duplicate files were absorbed, are legacy, or need a separate prune.
8. Run targeted checks/tests.

This is useful for long-lived repos where repeated AI sessions can accidentally create parallel implementations.

## Code Vs Docs Audit

Use `docs/audit-playbook.md` when you need to compare documentation to actual code or pack behavior.

That audit should answer one question for each claim: is it matched, stale, missing, or intentionally evolved?

## Full-Stack Endpoint Wiring

Use `/fullstack-feature` for endpoint-backed UI work.

The agent must prove this trace:

```text
UI event/page load
  -> frontend handler/component
  -> API client/proxy/fetch wrapper
  -> backend route path + method
  -> backend service/model
  -> response payload
  -> frontend normalizer/state
  -> rendered UI
```

This catches the common failure where the backend feature exists but the frontend still calls an old endpoint, mock, fallback, or differently shaped contract.

## Idle Surface Detection

Use `/find-idle-surfaces` as a read-only cleanup scout.

It should never delete files. It reports candidates with confidence:

- High: no references/imports/routes/tests/docs found and not exported as public API.
- Medium: likely legacy but dynamic/runtime check needed.
- Low: insufficient evidence or possible external/public use.

Use it before pruning old components, stale API clients, duplicate routes, or mocks that may hide broken wiring.

## Public Repo Polish

Use the `public-repo-polish` skill when preparing a public project. Strong public repos explain:

- what the tool does
- why someone should use it
- how to install it quickly
- examples
- safety model
- license
- how to contribute or extend

## Evidence And Auditability

Use the `evidence-auditability` skill for workflows where source traceability matters:

- legal-adjacent tools
- healthcare or HR tools
- case-building workflows
- compliance workflows
- audit logs and review decisions

Core idea: every generated claim should trace back to source evidence.

## Deployment

The current pack is Railway-specific for deployment checks. Use `/railway-check` for deployment readiness instead of assuming a generic deploy flow.

## Full Codebase Testing

Use `/test-codebase` when a package-level test or launch smoke test is not
enough. The command discovers the active stack and runs every applicable safe
layer: repository integrity, static checks, unit tests, integration and
database tests, API/provider contracts, runtime and browser journeys, security,
reliability, performance smoke, builds, and authorized deployment checks.

```text
/test-codebase full
/test-codebase exhaustive time-budget=45m browsers=chromium containers=allowed
/test-codebase full fix report=FULL_CODEBASE_TEST_REPORT.md
```

Default mode is verification-only. Use explicit `fix` scope only when you want
the agent to diagnose, edit, add regression tests, and rerun affected suites.

## Software Company Role Pack

These agents are adapted from repeated real-world work running projects like a small software company:

- `/founder-memo` - direction, priorities, non-goals, success criteria.
- `/product-decisions` - product scope and launch decisions.
- `/copy-review` - conversion copy.
- `/seo-review` - search and LLM discoverability.
- `/ux-review` - clarity, trust, accessibility, and conversion friction.
- `/frontend-task` - frontend execution/review.
- `/backend-task` - backend execution/review.
- `/qa-launch` - launch verification.
- `/railway-check` - deployment readiness for Railway.

## Bounded AI Product Design

These agents help design production AI workflows without over-broad autonomy:

- `/design-agent-workflow` - bounded AI workflow design.
- `/design-structured-output` - strict JSON/schema contracts.
- `/design-extraction` - source-preserving document extraction.
- `/design-classifier` - controlled-label classifiers.

Use this shape for production AI features:

```text
user action
  -> validate request and ownership
  -> build structured context
  -> call model/tool with strict contract
  -> validate and normalize output
  -> persist run/artifact/audit metadata
  -> show reviewable result
  -> human accepts/rejects/applies
```
