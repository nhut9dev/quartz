---
title: Composite index
description: A database index built from more than one column.
tags:
  - database
  - performance
---

A **composite index** is an index built from more than one column.

It is useful when queries filter, sort, or join by the same column combination repeatedly.

Column order matters. An index on `(tenant_id, created_at)` is different from an index on `(created_at, tenant_id)` because the database can use prefixes of the index differently.

Composite indexes should be designed from real query patterns and checked with a [[query-plan|query plan]].
