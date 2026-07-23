---
description: Build a full-stack feature by verifying the current endpoint, implementing backend/frontend changes, validating contracts, and proving frontend wiring.
agent: fullstack-endpoint-builder
---

Build this full-stack feature.

Required workflow:
- claim one bounded `IN PROGRESS` session before substantial work and avoid overlapping an existing owner
- verify the current endpoint first
- identify backend route/service/schema/model source of truth
- identify frontend page/component/API client/proxy source of truth
- state the data contract before editing
- implement backend and frontend in canonical files
- verify the frontend is wired to the endpoint changed
- verify request/response fields and status/error handling
- search for duplicate endpoints/clients/mocks and report drift/pruning notes
- run targeted backend and frontend checks

Preservation defaults:
- treat active/idle endpoints and latent/unmounted features as protected unless the user explicitly authorizes a contract change
- preserve established layouts and mounted route ownership unless the task explicitly requires a bounded UI/layout change

Feature:
$ARGUMENTS
