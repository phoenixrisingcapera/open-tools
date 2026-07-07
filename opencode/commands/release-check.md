---
description: Run a read-only release/deployment readiness preflight and return go/no-go with blockers.
agent: release-captain
---

Run a release readiness check for this repo.

Check git state, tests/build/lint signals, migration risks, docs/API contract drift, deployment status if available, and rollback/smoke test notes.

Release notes or scope:
$ARGUMENTS
