# Code vs Docs Audit Playbook

Use this when you want to compare documented behavior against the actual repo.

## Goal

Decide whether a difference is:

- intentional product evolution
- stale documentation
- missing documentation
- missing implementation

## Audit Order

1. Identify the canonical docs.
2. Identify the canonical code or pack surface.
3. Build a claim matrix.
4. Verify each claim against source evidence.
5. Mark the result as match, mismatch, stale, or unverified.
6. Decide whether to revise docs, code, or both.

## Claim Matrix Fields

- claim text
- doc path
- code path
- evidence snippet
- status
- owner
- next action

## What To Compare

- install instructions
- command and agent names
- pack membership and categories
- workflow steps
- frontend/backend contracts
- deployment targets
- audit and evidence language

## Split Frontend/Backend Audit

If the product has separate frontend and backend repos, verify the chain in both directions:

```text
UI event or page load
  -> frontend handler or component
  -> API client or proxy
  -> backend route
  -> backend service or model
  -> response payload
  -> frontend state or normalizer
  -> rendered UI
```

## Evidence Rules

- Prefer source files over prose when they disagree.
- Prefer canonical paths over copied snippets.
- Record exact file paths for every decision.
- Do not treat generated docs as proof unless they are explicitly the source of truth.

## For This Repo

This repository currently contains the Open Tools pack and docs, not a product frontend/backend application.

That means the next audit should compare:

- README claims
- docs/*.md claims
- opencode/commands/*.md behavior
- opencode/agents/*.md behavior
- opencode/skills/* guidance
- opencode/open-tools-manifest.json categories

## Suggested Next Step

Create a table with one row per claim, then review the rows with a human owner to mark which differences are intended product evolution and which are actual drift.
