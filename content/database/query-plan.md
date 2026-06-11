---
title: Query plan
description: The database execution strategy chosen for a query.
tags:
  - database
  - performance
---

A **query plan** is the database execution strategy chosen for a query.

It describes how the database will scan tables, use indexes, join data, sort rows, and estimate costs.

Developers inspect query plans with tools like `EXPLAIN` when a query is slow or when an index is not being used as expected.

Query plans are the practical bridge between [[query-optimization|query optimization]], [[database-index|database indexes]], and real production performance.
