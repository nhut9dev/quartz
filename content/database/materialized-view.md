---
title: Materialized view
description: A stored query result that can be refreshed and queried like a table.
tags:
  - database
  - performance
---

A **materialized view** stores the result of a query so it can be read faster later.

It is useful for expensive aggregations, reporting queries, search-like projections, and read models that do not need to be perfectly fresh.

The tradeoff is staleness and refresh cost. The system must decide when and how the materialized result updates.

Materialized views are related to [[query-optimization|query optimization]], [[../messaging/cqrs|CQRS]], and [[../architecture/eventual-consistency|eventual consistency]].
