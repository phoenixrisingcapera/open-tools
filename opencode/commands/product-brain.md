---
description: Load the canonical MailTrace product brain — domain terms, architecture, key files, variables, naming, infra — so outputs are context-aware and consistent.
---

# MailTrace Product Brain

Canonical reference for MailTrace domain, architecture, variables, naming, and infrastructure. Load this when you need context before writing code, docs, or analysis. Every section is source-linked to the actual codebase.

---

## 1. Product Identity

| Attribute | Value |
|-----------|-------|
| Product | **MailTrace** — Procedural Intelligence for Email Evidence |
| Not | A generic email client, chatbot, or CRM |
| Core promise | Turn email evidence into structured timelines, issue groups, participants, and source-linked legal reports |
| Auth | Microsoft OAuth only (no email/password signup; Google OAuth stubbed but not active) |
| Target user | Legal teams, investigators, complaints handlers, safeguarding teams |
| Maturity | MVP validation (founder-led, no self-serve signup yet) |
| Domain | Evidence reconstruction, chronology-first review, procedural intelligence |
| Backend repo | `extended-mailtrace-backend-main` |
| Frontend repo | `extended-mailtrace-frontend-main` |

---

## 2. Architecture Overview

```
User's Browser
  └─ Static HTML/JS/CSS (no framework, no Svelte/React/Vue)
       └─ Nginx (serves static files via Dockerfile)
            └─ FastAPI backend (Python)
                 ├─ SQLAlchemy → PostgreSQL + pgvector
                 ├─ Microsoft Graph API (OAuth + mailbox fetch)
                 ├─ OpenAI / LLM (issue classification, semantic scoring)
                 └─ Stripe (billing, plans)
```

- **Frontend**: Static HTML pages with vanilla JS modules. No build step, no bundler, no framework. Each page is a standalone `.html` file.
- **Backend**: FastAPI with SQLAlchemy ORM, Alembic migrations, Pydantic schemas. Routes under `/api/v1/`.
- **Auth flow**: Microsoft OAuth → `/auth/microsoft/start` → user consents → `/auth/microsoft/callback` → session cookie.
- **Deployment**: Railway (auto-deploys on push to `main` from both repos).

---

## 3. Domain Dictionary

### Core Entities

| Term | Definition | Backend File | Frontend File |
|------|-----------|-------------|--------------|
| **User** | Authenticated person, signs in via Microsoft OAuth | `app/auth/` | `login.html` |
| **Mailbox** | Microsoft 365 mailbox connected via OAuth | `app/api/routes/mailbox.py` | `public/api-client.js` |
| **Target** | Email address or domain under investigation | `app/models/target.py` | `workspace.html` |
| **Case** | Investigation workspace for one target | `app/api/routes/cases.py` | `case-workspace.html` |
| **Investigation** | UI name for a case (interchangeable) | — | `workspace.html` |
| **Evidence** | Persisted mailbox material relevant to a target | `app/models/evidence.py` | `workspace-evidence.html` |
| **Candidate Evidence** | Emails fetched matching target (not yet selected) | `app/services/evidence_service.py` | — |
| **Selected Evidence** | Emails user explicitly marked relevant | `app/services/evidence_service.py` | — |
| **Excluded Evidence** | Emails user marked not relevant | `app/services/evidence_service.py` | — |
| **Timeline** | Chronological view from selected evidence | `app/timeline/` | `case-timeline-workspace.html` |
| **Event** | Structured interpretation from an email | `app/events/` | — |
| **TraceJob** | One fetch-filter-persist cycle for a case | `app/models/trace_job.py` | — |
| **Participant** | Person/org appearing in case evidence | `app/participants/` | `case-participants-workspace.html` |
| **Obligation** | Required action/deadline from evidence | `app/models/case_obligation.py` | — |
| **Signal** | Detected pattern in email content | `app/signals/` | — |
| **Issue** | Distinct problem/topic within a case | `app/issues/` | `case-issue-workspace.html` |
| **Cluster** | Group of related issues by similarity | `app/cluster_intelligence/` | `case-cluster-detail.html` |
| **Taxonomy** | Structured label system for classification | `app/taxonomy/` | `case-taxonomy-workspace.html` |
| **Chronology Chain** | Sequence of related events over time | `app/chronology/` | — |
| **Progress State** | Named state: `signed_out` → `evidence_ready` → `failed` | `app/models/progress.py` | `public/activation.js` |
| **Loader** | User-facing progress UI (not a spinner) | — | `public/loader.js` |

### Frontend Pages Map

| URL | Purpose |
|-----|---------|
| `index.html` | Home page (features content, Microsoft sign-in CTA) |
| `features.html` | Feature detail page |
| `pricing.html` | Pricing plans |
| `login.html` | Sign-in page with Microsoft OAuth button |
| `contact.html` | Contact form (inline request-access forms) |
| `support.html` | Support center |
| `admin.html` | Admin diagnostics + sitemap (login gate: admin/mailtrace) |
| `documentation.html` | Documentation hub (admin-only via sitemap) |
| `workspace.html` | Main workspace |
| `workspace-evidence.html` | Evidence workspace |
| `workspace-search.html` | Search workspace |
| `workspace-reports.html` | Reports workspace |
| `workspace-investigations.html` | Investigations workspace |
| `case-workspace.html` | Case detail |
| `case-evidence-workspace.html` | Case evidence |
| `case-timeline-workspace.html` | Case timeline |
| `case-intelligence-workspace.html` | Case intelligence |
| `case-issue-workspace.html` | Issue workspace |
| `case-participants-workspace.html` | Case participants |
| `case-settings-workspace.html` | Case settings |
| `case-taxonomy-workspace.html` | Taxonomy (admin surface) |
| `auth/callback.html` | Microsoft OAuth callback handler |
| `mobile/` | Mobile-optimized views |

---

## 4. Key File Map

### Backend (`extended-mailtrace-backend-main/app/`)

| Path | Purpose |
|------|---------|
| `main.py` | FastAPI app factory, router mounting, middleware |
| `core/config.py` | Settings via pydantic-settings (env vars, defaults) |
| `core/security.py` | Auth dependencies, session validation |
| `db/` | SQLAlchemy models, session, migrations |
| `api/routes/` | All route handlers (public, auth, cases, evidence, etc.) |
| `api/schemas/` | Pydantic request/response models |
| `services/` | Business logic (evidence, timeline, participants, etc.) |
| `events/` | Event ontology and extraction |
| `signals/` | Email content signal detection |
| `issues/` | Issue classification and management |
| `timeline/` | Timeline construction |
| `participants/` | Participant extraction |
| `chronology/` | Chronology chain logic |
| `cluster_intelligence/` | Issue clustering |
| `taxonomy/` | Label taxonomy |
| `obligations/` | Deadline/obligation tracking |
| `ml/` | LLM integration for semantic scoring |
| `billing/` | Stripe integration, plan gating |

### Frontend (`extended-mailtrace-frontend-main/`)

| Path | Purpose |
|------|---------|
| `*.html` | One file per page (static, no framework) |
| `config.js` | ES module: `PUBLIC_BACKEND_URL`, `API_BASE`, `PUBLIC_APP_URL` |
| `public/config.js` | IIFE: sets `window.MAILTRACE_API_BASE_URL` etc. |
| `public/marketing.css` | Marketing pages CSS |
| `public/workspace.css` | Workspace pages CSS |
| `public/request-access.js` | Early-access form modal (Individual + Org tabs) |
| `public/api-client.js` | Fetch wrapper, base URL, error handling |
| `public/auth-guard.js` | Session check, auth wall injection |
| `auth.js` | Auth helpers: `startMicrosoftSignIn()`, `logout()`, etc. |
| `public/utility-bar.js` | Shared nav bar component |
| `public/theme.js` | Color theme / dark mode |
| `Dockerfile` | Nginx static file server |

---

## 5. Core Variables & Config

### Environment Variables (Backend)

| Variable | Default | Purpose |
|----------|---------|---------|
| `DATABASE_URL` | — | PostgreSQL connection string |
| `MICROSOFT_CLIENT_ID` | — | Azure AD app registration |
| `MICROSOFT_CLIENT_SECRET` | — | Azure AD client secret |
| `MICROSOFT_TENANT_ID` | `consumers` | Azure AD tenant |
| `MICROSOFT_REDIRECT_URI` | `http://127.0.0.1:8010/api/v1/auth/microsoft/callback` | OAuth redirect |
| `OPENAI_API_KEY` | — | LLM scoring |
| `STRIPE_SECRET_KEY` | — | Billing |
| `STRIPE_WEBHOOK_SECRET` | — | Billing events |
| `ENVIRONMENT` | `development` | `production` / `development` |
| `CORS_ORIGINS` | `http://127.0.0.1:5500` | Allowed frontend origins |

### Frontend Config (config.js)

| Export | Derivation | Purpose |
|--------|-----------|---------|
| `PUBLIC_APP_URL` | `window.location.origin` | Frontend base URL |
| `PUBLIC_BACKEND_URL` | Env-aware: production → `https://api.mailtrace.tech/api/v1`, local → `http://127.0.0.1:8010/api/v1` | API base |
| `API_BASE` | Alias for `PUBLIC_BACKEND_URL` | API base alias |
| `API_BASE` (IIFE) | `window.MAILTRACE_API_BASE_URL` → same logic | Window global |

### API Routes (Backend)

| Method | Path | Purpose |
|--------|------|---------|
| GET | `/api/v1/auth/session` | Session check |
| GET | `/api/v1/auth/microsoft/start` | Initiate OAuth (params: `return_to`) |
| GET | `/api/v1/auth/microsoft/callback` | OAuth callback handler |
| POST | `/api/v1/auth/logout` | End session |
| GET | `/api/v1/public/pricing` | Public pricing data |
| POST | `/api/v1/public/early-access` | Contact/access request → `early_access_requests` table |
| GET | `/api/v1/cases` | List user cases |
| POST | `/api/v1/cases` | Create case |
| GET | `/api/v1/cases/{id}` | Case detail |
| POST | `/api/v1/cases/{id}/activate` | Start investigation |
| GET | `/api/v1/cases/{id}/evidence` | Case evidence |
| GET | `/api/v1/cases/{id}/timeline` | Case timeline |
| GET | `/api/v1/cases/{id}/participants` | Case participants |
| GET | `/api/v1/cases/{id}/issues` | Case issues |
| GET | `/api/v1/cases/{id}/intelligence` | Case intelligence |
| GET | `/api/v1/cases/{id}/intelligence/issue-feedback` | Issue feedback |
| DELETE | `/api/v1/cases/{id}/intelligence/issue-feedback/{fid}` | Delete feedback |
| GET | `/api/v1/admin/health` | Admin health check |
| GET | `/api/v1/admin/stats` | Admin statistics |
| POST | `/api/v1/admin/billing/assign-plan` | Admin plan assignment |
| GET | `/api/v1/plans` | Billing plans |
| POST | `/api/v1/billing/create-checkout` | Create Stripe checkout |
| POST | `/api/v1/billing/webhook` | Stripe webhook |

---

## 6. Naming Conventions

| Layer | Convention | Example |
|-------|-----------|---------|
| Backend routes | `/api/v1/{resource}` plural, kebab-case | `/api/v1/cases/{id}/evidence` |
| Backend models | PascalCase singular | `class Case(Base):` |
| Backend schemas | PascalCase with Request/Response suffix | `EarlyAccessRequestCreate`, `CaseResponse` |
| Backend services | snake_case | `evidence_service.py`, `timeline_service.py` |
| Frontend HTML | kebab-case with `.html` | `workspace-evidence.html`, `case-timeline-workspace.html` |
| Frontend JS | camelCase exports, kebab-case files | `fetchCases()`, `api-client.js` |
| Frontend CSS | kebab-case BEM-lite | `.request-access-overlay`, `.hero-primary` |
| Frontend data attrs | `data-kebab-case` | `data-request-access-trigger`, `data-source-page` |
| DB tables | snake_case plural | `early_access_requests`, `cases`, `evidence` |
| Enums | UPPER_SNAKE_CASE | `EventType.COMPLAINT`, `ProgressState.EVIDENCE_READY` |
| Alembic revisions | `YYYYMMDD_NN_descriptive_name` | `20260526_01_early_access_requests` |

### Frontend Page Data Attribute

Every page identifies itself via `<body data-source-page="...">`. Used by CSS and JS for page-specific behavior.

| Page | `data-source-page` |
|------|-------------------|
| index.html | `home` |
| features.html | `features` |
| pricing.html | `pricing` |
| contact.html | `contact` |
| support.html | `support` |
| admin.html | `admin` |
| login.html | *(none, standalone auth page)* |

---

## 7. Infrastructure & Deployment

- **Host**: Railway (railway.app)
- **Backend**: FastAPI with Gunicorn + Uvicorn workers
- **Frontend**: Nginx serving static files (Dockerfile copies HTML/JS/CSS into `/usr/share/nginx/html`)
- **Database**: PostgreSQL 15 with `pgvector` extension
- **Auto-deploy**: Push to `main` on either repo triggers Railway deployment
- **Custom domain**: `mailtrace.tech` (frontend), `api.mailtrace.tech` (backend)
- **Health check**: `GET /api/v1/admin/health` (backend), Railway TCP health on frontend

---

## 8. Decision Log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-07 | Static HTML/JS/CSS frontend, no framework | MVP speed, no build step, easy deploys |
| 2026-07 | Microsoft-only OAuth | Target users are enterprise/M365 shops |
| 2026-07 | svelte referenced in conversation but absent from codebase | User mentioned Svelte sign-in card; audit confirmed zero Svelte files |
| 2026-07 | Admin page login gate (admin/mailtrace) | Client-side protection for diagnostics, sessionStorage-based |
| 2026-07 | Documentation page moved to admin-only | User requested admin-only access for documentation |

---

*Load this brain before writing any code, docs, or analysis so outputs are context-aware and consistent with MailTrace's actual architecture and naming conventions.*
