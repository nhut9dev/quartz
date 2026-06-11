---
title: Optimistic locking
description: Detecting conflicting writes without locking the row for the whole edit window.
tags:
  - database
---

**Optimistic locking** assumes conflicts are rare and checks for them when saving.

A row usually has a version number or updated timestamp. The update succeeds only if that value still matches what the client originally read.

If another writer changed the row first, the update affects no rows and the application can retry, merge, or show a conflict.

This is useful for web apps where a user may edit data for longer than a [[transaction|database transaction]] should stay open.
