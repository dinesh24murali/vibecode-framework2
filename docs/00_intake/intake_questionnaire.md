# Intake Questionnaire

> Fill this out before using any prompt in `docs/01_prompts/`.
> Your answers replace the `[[PLACEHOLDER]]` tokens in each prompt.

---

## 1. Project Basics

**1.1 Project name:**
`[[PROJECT_NAME]]`

**1.2 One-sentence description:**
`[[PROJECT_DESCRIPTION]]`

**1.3 Team / company name:**
`[[TEAM_NAME]]`

**1.4 Target launch date (or "no fixed date"):**


---

## 2. Users & Problem

**2.1 Who are the primary users?**
(e.g. "Small business owners who need to track invoices")


**2.2 What problem does this solve?**


**2.3 What does success look like in 6 months?**
(Key metrics, user counts, revenue, etc.)


---

## 3. Core Features

**3.1 List the 3–5 must-have features for v1:**
1.
2.
3.
4.
5.

**3.2 List features explicitly OUT of scope for v1:**


**3.3 Are there any existing systems this must integrate with?**
(APIs, databases, legacy services)


---

## 4. Tech Stack

**4.1 Backend language:**
`[[BACKEND_LANG]]`  (e.g. Go, Python, Node.js, Ruby)

**4.2 Backend framework:**
`[[BACKEND_FRAMEWORK]]`  (e.g. Gin, FastAPI, Express, Rails)

**4.3 Frontend framework:**
`[[FRONTEND_FRAMEWORK]]`  (e.g. React, Vue, SvelteKit, Next.js)

**4.4 Database:**
`[[DATABASE]]`  (e.g. PostgreSQL, MySQL, SQLite, MongoDB)

**4.5 Cache / queue (if any):**
(e.g. Redis, RabbitMQ, none)

**4.6 Any preferred UI component library?**
(e.g. shadcn/ui, Tailwind, Material UI, none)

---

## 5. Design & Branding

**5.1 Primary brand color:**
`[[BRAND_COLOR_PRIMARY]]`  (e.g. `#2563EB`, "a warm coral", "open to suggestion")

**5.2 Secondary / accent color:**
`[[BRAND_COLOR_SECONDARY]]`  (e.g. `#F59E0B`, "muted teal", "none")

**5.3 Desired visual aesthetic:**
`[[DESIGN_AESTHETIC]]`  (e.g. minimal, bold, playful, corporate, luxury, brutalist)

**5.4 Heading font preference:**
`[[FONT_HEADING]]`  (e.g. Inter, Playfair Display, "geometric sans", "open to suggestion")

**5.5 Body font preference:**
`[[FONT_BODY]]`  (e.g. Inter, Lato, "readable serif", "same as heading")

**5.6 Monospace font preference:**
`[[FONT_MONO]]`  (e.g. JetBrains Mono, Fira Code, "any", "none needed")

**5.7 Font source:**
`[[FONT_SOURCE]]`  (Google Fonts | Adobe Fonts | self-hosted | system stack)

**5.8 Dark mode requirement:**
`[[DARK_MODE]]`  (yes — required | no | optional — user toggle)

---

## 6. Authentication & Authorization

**6.1 Auth strategy:**
`[[AUTH_STRATEGY]]`  (e.g. JWT, OAuth2 + JWT, Session cookies, Passkeys)

**6.2 OAuth providers (if any):**
(e.g. Google, GitHub, none)

**6.3 Authorization model:**
(e.g. RBAC with roles: admin/user, simple owner-based, none)

---

## 7. Deployment & Infrastructure

**7.1 Deployment target:**
`[[DEPLOYMENT_TARGET]]`  (e.g. AWS ECS, GCP Cloud Run, Fly.io, Vercel + Railway)

**7.2 Containerized?**
(Yes — Docker / Docker Compose / Kubernetes | No)

**7.3 CI/CD preference:**
(e.g. GitHub Actions, GitLab CI, CircleCI, none)

**7.4 Environments needed:**
(e.g. dev, staging, prod)

---

## 8. Scale & Non-Functional Requirements

**8.1 Expected users at launch:**


**8.2 Expected peak requests/second:**


**8.3 Data sensitivity:**
(e.g. PII, financial data, public data only)

**8.4 Compliance requirements:**
(e.g. GDPR, HIPAA, SOC2, none)

**8.5 Uptime target:**
(e.g. 99.9%, best-effort)

---

## 9. Testing Expectations

**9.1 Minimum unit test coverage target:**
(e.g. 80%, none for now)

**9.2 E2e test tool preference:**
(e.g. Playwright, Cypress, none)

**9.3 Contract testing:**
(Yes — generate from OpenAPI spec | No)

---

## 10. Open Questions

List any unknowns or decisions not yet made:

1.
2.
3.
