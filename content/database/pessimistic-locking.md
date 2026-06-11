---
title: Pessimistic locking
description: Locking data before editing it to prevent conflicting writes.
tags:
  - database
---

**Pessimistic locking** assumes conflicts are likely and blocks other writers before the current operation finishes.

In SQL databases this is often done with row locks inside a [[transaction|transaction]].

It can protect critical flows like inventory reservation or balance updates, but it also increases the chance of waits and [[deadlock|deadlocks]].

Use it when correctness needs immediate exclusion and the locked section is short.
