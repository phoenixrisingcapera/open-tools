---
name: evidence-auditability
description: Use when designing workflows that require source traceability, audit logs, review decisions, compliance evidence, or non-destructive case building.
---

# Evidence And Auditability

Use this skill for regulated, compliance-heavy, legal-adjacent, healthcare, HR, safeguarding, public-sector, or case-building workflows.

## Principles

- Preserve source traceability from every summary, finding, or report item back to original evidence.
- Separate facts from interpretations.
- Avoid legal, medical, or compliance conclusions unless the user explicitly asks and the system is designed for that role.
- Track model/rule version, timestamp, and reason for classification where AI is used.
- Keep human review decisions auditable: who/when/what changed/why.
- Prefer non-destructive corrections over overwriting source records.
- Make uncertainty visible.

## Useful Fields

- source ID
- source URL/path
- checksum/hash
- extracted text status
- model or rule version
- confidence or evidence score
- evidence role labels
- reviewer decision
- review timestamp
- reason for assignment

## Review Questions

- Can every generated claim be traced to source evidence?
- Is source evidence preserved separately from user annotations?
- Can a user undo or revise classifications without losing history?
- Are sensitive details kept out of logs and URLs?
- Are AI outputs framed as assistance, not final determinations?
