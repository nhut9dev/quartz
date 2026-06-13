---
title: Materialized view
description: A stored query result that can be refreshed and queried like a table.
tags:
  - database
  - performance
---

A **materialized view** stores the *result* of a query physically, so reads hit precomputed data instead of re-running the expensive query each time — unlike a regular view, which is just a saved query that runs anew on every access.

## How it works

You define a view from a query, and the database computes it once and persists the rows, like a cached table you can index and query directly. The result stays fixed until you **refresh** it, which re-runs the underlying query and replaces the stored data. So the read cost drops to a simple table scan/lookup, paid for by the refresh cost and by the data being only as fresh as the last refresh. It's a precompute-vs-recompute trade made concrete at the database layer.

## When to use

It fits expensive reads over data that doesn't need to be perfectly fresh: dashboard aggregations, reporting rollups, leaderboards, denormalized read projections. The sweet spot is a query that's costly to compute, read far more often than the underlying data changes, and tolerant of being minutes (or hours) stale. If the data must be live, a materialized view is the wrong tool.

## The refresh trade-off

Refresh strategy is the central decision. A **full refresh** recomputes everything — simple but expensive, and (without concurrency support) can lock the view against reads while it runs. An **incremental/concurrent refresh** updates only what changed or rebuilds without blocking reads, at more complexity. The schedule sets the staleness: refresh on a timer, on a trigger, or on demand, each trading freshness against refresh load.

## Pitfalls

The data is stale by definition between refreshes, so it shares the [[../architecture/eventual-consistency|eventual consistency]] caveats — don't use it where reads must reflect the latest write. A naive full refresh on a large view is itself a heavy query that can swamp the database or block readers if it doesn't refresh concurrently. And a materialized view is *derived* data: it must be rebuildable from the source and never the only home of a fact. It's closely related to [[../messaging/cqrs|CQRS]] read models.
