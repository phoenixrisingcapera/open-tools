---
name: no-architecture-drift
description: Use when building features in existing codebases to avoid duplicate routes, duplicate services, endpoint drift, data contract drift, frontend wiring gaps, and orphaned files.
---

# No Architecture Drift

Use this skill when adding or changing a feature in an existing product.

## Core Rule

Do not create a new path until you know the current canonical path.

Architecture drift happens when a feature is implemented in a new file, route, service, page, or schema while an older/current implementation already exists elsewhere.

## Required Sequence

1. Search for existing feature names, route names, model names, component names, and similar language.
2. Identify current endpoint(s), frontend page(s), API client/proxy, service layer, schema, model, migration, and tests.
3. Decide the canonical files before editing.
4. Implement the smallest correct change in canonical files.
5. Verify backend/frontend contract alignment.
6. Verify frontend is wired to the endpoint actually changed.
7. Review duplicate/same-purpose files.
8. Mark duplicates as canonical, absorbed, legacy, duplicate, or unknown.
9. Run targeted checks.

## Contract Checklist

- route path
- HTTP method
- auth/ownership behavior
- request fields
- response fields
- error shape
- status values/enums
- nullable fields
- date/time formats
- frontend parser/normalizer
- loading/error/empty states

## Duplicate File Checklist

For files with similar names/functions, answer:

- Which one is used at runtime?
- Which one is imported/referenced?
- Which one has tests?
- Which one is documented?
- Is one legacy or generated?
- Can logic be absorbed into the canonical file?
- Is deletion safe, or does it need a separate cleanup PR?

## Final Report

Always include:

- canonical files changed
- endpoints verified
- data contracts verified
- frontend wiring verified
- duplicate/pruning notes
- checks run and checks not run
