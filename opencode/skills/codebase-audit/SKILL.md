---
name: codebase-audit
description: Use when auditing a codebase for duplicate endpoints, duplicate services, frontend-backend contract drift, idle/orphaned code, auth/security gaps, billing fallback gaps, N+1 query patterns, and error-handling gaps.
---

# Codebase Audit

Use this skill for comprehensive parallel audits of a multi-repo codebase (frontend + backend). Run the audit agents in parallel, then compile findings into a single report.

## Rule

Audit is detection, not fixing. Report candidates with evidence, location, and severity. Leave remediation as a separate task.

## Audit Dimensions (run in parallel)

### 1. Duplicate Endpoints
- Search backend route files for overlapping URL patterns (e.g., `/cases/{id}` vs `/case/{id}`).
- Check if two different route files register the same HTTP method + path.
- Look for routes with different names but identical query/response logic.
- Verify if a deprecated route still has frontend callers.

### 2. Duplicate Services/Classes
- Search for classes with similar names across different files (e.g., `TierPolicy`, `TierManager`, `TierService`).
- Check if the same SQLAlchemy model has multiple repository/service wrappers.
- Look for Pydantic schemas that duplicate model fields without adding constraints.

### 3. Frontend-Backend Contract Drift
- For every frontend API client call, verify the backend route exists with matching method.
- For every backend response, verify the frontend normalizer/state matches the field names.
- Check if the frontend sends fields the backend no longer expects.
- Check if the backend returns fields the frontend no longer reads.

### 4. Idle/Orphaned Code
- Search for frontend pages not linked from any nav, route config, or sitemap.
- Search for backend routes with no frontend callers and no test references.
- Search for JS/CSS files not imported by any page.
- Check for mock data or stub components that were never replaced.

### 5. Auth/Security Gaps
- Verify every protected route has a dependency injection guard (e.g., `CurrentUser`, `Session`).
- Check that admin routes require an explicit `is_admin` or role check, not just presence of any user.
- Look for CSRF nonce/token usage on OAuth initiation endpoints.
- Check that API keys are validated from header, not query param.
- Look for secrets/logging exposure (e.g., printing tokens, logging request bodies with passwords).

### 6. Billing Fallback
- Trace the billing gating path: frontend feature check → API client → backend route → service → Stripe/DB.
- Verify what happens when Stripe is unreachable (does it fail open or fail closed?).
- Check if the frontend gracefully handles missing/malformed billing data.
- Check if plan upgrade/downgrade routes validate ownership before mutating.

### 7. N+1 Query Patterns
- Search for SQLAlchemy relationships accessed inside Python `for` loops after a base query.
- Look for missing `joinedload()` / `selectinload()` on relationship-heavy endpoints.
- Check if paginated list endpoints eagerly load related counts without extra queries.
- Search for serializer/schema `.dict()` or nested field access that triggers lazy loads.

### 8. Error Handling / Silent Failures
- Search for bare `except:` blocks that swallow exceptions.
- Search for `return None` in service methods without logging.
- Check if LLM/ML service calls have timeout handling and fallback responses.
- Verify that API route handlers return structured error responses, not raw 500s.

## Severity Levels

- **Critical**: Security vulnerability, data loss, or auth bypass.
- **High**: Functional bug, race condition, silent failure, or N+1 on a hot path.
- **Medium**: Code debt, unused import, minor inconsistency, or missing documentation.
- **Low**: Style, naming, or cosmetic inconsistency.

## Report Format

Compile findings grouped by dimension, each with:
- Title, file path + line number, severity, evidence, and recommended action.

## Output

Write the compiled report to `docs/PROBLEMATIC_OVERLAPS_AND_ISSUES.md` in the project root.
