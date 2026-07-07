---
description: Build a feature while preventing architecture drift, endpoint drift, data-contract drift, frontend wiring gaps, and duplicate implementation paths.
agent: no-drift-feature-builder
---

Build this feature with no architecture drift.

Required workflow:
- inspect current architecture before editing
- verify existing endpoints/routes/services/pages/components
- identify canonical files and duplicate/same-purpose files
- implement in the canonical path only
- verify request/response data contracts
- verify frontend API/client/page wiring
- verify old duplicate files are either absorbed, documented as legacy, or left untouched with a reason
- run targeted checks/tests where available

Feature:
$ARGUMENTS
