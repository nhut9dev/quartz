---
title: Destructive action design
description: Designing delete, reset, revoke, and irreversible actions to prevent accidental harm.
tags:
  - product-engineering
  - ux
  - safety
---

**Destructive action design** protects users from accidental damage.

Use stronger friction when the action is hard to undo, affects other users, or deletes valuable data. Confirmation should name the object and consequence, not just ask "Are you sure?"

Prefer undo, soft delete, or recovery windows when possible. See [[../database/soft-delete|Soft delete]] for the backend side of recoverable deletion.
