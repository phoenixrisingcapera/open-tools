# Workflows

## AI Memory Stack

Use these together to avoid losing context across token limits:

- `/show-kanban` - start from current unfinished work.
- `/save-kanban` - preserve current todos before stopping.
- `/archive-session` - save a dated historical summary.
- `/map-repo` - create durable repo context.
- `/adr` - save decisions that should not be rediscovered later.

## Preflight Suite

Use these before commits, PRs, or deploys:

- `/audit-completion` - is local/GitHub/deployment state clean?
- `/review-diff` - are there bugs or missing tests?
- `/security-check` - did secrets, PII, or auth/session risk slip in?
- `/release-check` - is this safe to release?

## No-Drift Feature Delivery

Use `/fullstack-feature` when the feature touches both backend and frontend.

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
