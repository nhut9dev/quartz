---
title: Optimistic locking
description: Detecting conflicting writes without locking the row for the whole edit window.
tags:
  - database
---

**Optimistic locking** assumes write conflicts are rare and checks for one only *at save time*, rather than locking the row for the whole edit — so it holds no database lock while a user is thinking.

## How it works

The row carries a version marker — a `version` integer or an `updated_at` timestamp — that the client reads along with the data. On save, the update is conditional on that marker still matching:

```sql
UPDATE documents SET content = ?, version = version + 1
WHERE id = ? AND version = ?;   -- the version the client originally read
```

If nobody else changed the row, `version` still matches, one row is updated, and the version bumps. If another writer got there first, the version no longer matches, **zero rows are updated**, and the application detects the conflict — then retries, merges, or shows the user a "someone else edited this" message. There's no lock held between read and save; the conflict check *is* the concurrency control.

## When to use it

Optimistic locking fits when the edit window is long or unpredictable — a user editing a form for minutes, a wiki page, an API where read and write are separate requests. Holding a [[pessimistic-locking|pessimistic]] database lock across that window is impossible (a [[transaction|transaction]] shouldn't stay open for human think-time), so optimistic is the natural choice. It also suits high read concurrency where real conflicts are genuinely rare, since the happy path costs nothing.

## Pitfalls

It only *detects* conflicts; it doesn't prevent the wasted work, so under high contention on the same row the retry rate climbs and throughput collapses — that's the signal to switch to pessimistic locking. The conflict must actually be surfaced and handled: silently ignoring the zero-rows-updated result means the user's save vanishes with no error, the worst outcome. And the check is only sound if every writer respects the version — a path that updates the row without the `WHERE version = ?` guard bypasses the whole scheme.
