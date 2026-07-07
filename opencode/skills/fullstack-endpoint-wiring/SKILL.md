---
name: fullstack-endpoint-wiring
description: Use when a feature needs backend endpoint work plus frontend wiring; verifies route, schema, API client/proxy, UI state, and end-to-end data contract alignment.
---

# Full-Stack Endpoint Wiring

Use this skill whenever backend and frontend must change together.

## Principle

A full-stack feature is not done until the frontend calls the backend endpoint that was changed and correctly handles the response contract.

## Pre-Edit Checklist

- Existing backend route path and method.
- Backend route file.
- Backend service/function.
- Request schema/body/query params.
- Response schema/serializer.
- Auth/ownership/permission checks.
- Existing tests.
- Frontend API client/proxy/fetch wrapper.
- Frontend page/component that renders or mutates the data.
- Existing mock/fallback data that may hide wiring failure.

## Contract Checklist

- HTTP method and path.
- Request fields and query params.
- Response fields.
- Status/enums.
- Error shape.
- Date format.
- Nullable fields.
- Pagination/filter/sort behavior.
- Auth/session behavior.
- Empty state.

## Wiring Trace

Document this chain:

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

## Drift Traps

- Frontend calls `/api/foo` while backend changed `/api/v1/foo`.
- Page uses cached/mock data instead of the real client.
- Backend returns `snake_case` but frontend expects `camelCase` with no normalizer.
- Similar route exists in another router and the wrong one is edited.
- Old component remains linked from navigation.
- Test covers service but not route/client wiring.

## Completion Report

Always include:

- endpoint verified
- backend files changed
- frontend files changed
- data contract confirmed
- end-to-end trace
- duplicate/drift notes
- checks run
