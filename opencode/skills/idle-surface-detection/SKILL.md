---
name: idle-surface-detection
description: Use when searching for unused endpoints, idle components, orphaned routes, stale API clients, mocks, duplicate files, or prune candidates without deleting them.
---

# Idle Surface Detection

Use this skill to find code that may no longer be wired into the product.

## Rule

Detection is not deletion. Report candidates with evidence and confidence. Pruning should be a separate explicit task.

## Endpoint Checks

- Is the route registered in the app/router?
- Is the endpoint called by frontend code?
- Is it referenced by tests?
- Is it documented as public/external?
- Does another endpoint do the same thing?
- Is it behind dynamic routing or a catch-all?

## Frontend Checks

- Is the component imported anywhere?
- Is the page linked from navigation or routes?
- Is it referenced by tests/storybook/docs?
- Is there a newer component with the same purpose?
- Does it call real APIs or stale mocks/fallbacks?

## API Client Checks

- Does the client/proxy path match a current backend route?
- Is the client imported by pages/components?
- Does the response normalizer match backend fields?
- Are there duplicate clients for the same route?

## Confidence Levels

- High: no references found and not public/exported.
- Medium: likely legacy but dynamic/runtime check needed.
- Low: insufficient evidence or possible external/public use.

## Report Categories

- idle endpoint candidates
- idle component/page candidates
- idle API client/proxy candidates
- mocks/fallbacks hiding drift
- duplicate/overlapping surfaces
- safe-to-review prune list
- do-not-prune-yet list
