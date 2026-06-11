---
title: Deadlock
description: A database concurrency problem where transactions wait on each other forever.
tags:
  - database
---

A **deadlock** happens when two or more transactions each hold locks the others need.

Databases usually detect deadlocks and abort one transaction so the others can continue.

Applications should be ready to retry safe transactions after deadlock errors.

Consistent lock ordering, shorter transactions, and smaller write scopes reduce deadlock risk.
