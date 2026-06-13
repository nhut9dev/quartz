---
title: Soft delete
description: Marking a record as deleted without physically removing it immediately.
tags:
  - database
---

**Soft delete** marks a row as deleted — typically with a `deleted_at` timestamp or `is_deleted` flag — instead of physically removing it, so the data stays recoverable.

## How it works

A delete becomes an update: set `deleted_at = now()` rather than issuing `DELETE`. The row remains in the table, but every read that should show only live data must filter it out (`WHERE deleted_at IS NULL`). "Deleted" is now an application-level state, not a database fact — the database still sees a perfectly real row.

## When to use

It fits when deletion needs to be reversible or auditable: undo/restore flows, trash bins, recovering from accidental deletes, keeping history for compliance, or deferring expensive cascade cleanup to a background job. If a record genuinely just needs to be gone and never referenced again, a hard delete is simpler and avoids every pitfall below.

## Pitfalls

- **Every query must remember the filter.** The moment one query forgets `WHERE deleted_at IS NULL`, deleted records leak back into the UI or counts. This is the defining hazard — enforce it centrally (a base query scope, an ORM global filter, or a view), not by hoping each query remembers.
- **Unique constraints break.** A real unique index on `email` blocks a user from re-registering an email that belongs to a *soft-deleted* row. You need partial indexes (`UNIQUE ... WHERE deleted_at IS NULL`) or to include the deleted state in the constraint.
- **Foreign keys and joins surface ghosts.** Related queries can pull in soft-deleted parents/children unless the filter propagates through every join — a child can appear "alive" under a deleted parent.
- **It's not real deletion.** For GDPR / "right to be forgotten," a flagged-but-present row is still personal data retained — soft delete doesn't satisfy a true erasure requirement, so pair it with a hard-delete retention policy.

Soft delete works best with a clear [[schema|schema]] convention, partial indexes for active rows, and an eventual hard-delete job when retention allows.
