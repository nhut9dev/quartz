---
title: DataLoader
description: A batching and per-request caching utility that collapses resolver fan-out into single loads.
tags:
  - web
  - api
  - graphql
---

A **DataLoader** batches many individual key-based loads into one bulk fetch and caches results per request, fixing the resolver [[../database/n-plus-one-problem|N+1 problem]] on a [[graphql-server|GraphQL server]].

## How it works

Instead of fetching one record at a time, resolvers call `load(key)`, which returns a promise but doesn't fetch yet. DataLoader collects every key requested within a single tick of the event loop — the **batching window** — then calls your batch function once with the whole array. The batch function must return results in the same order as the keys it received.

```js
const userLoader = new DataLoader(async (ids) => {
  const rows = await db.users.findMany({ where: { id: ids } })
  return ids.map((id) => rows.find((r) => r.id === id)) // align order
})
// resolver: () => userLoader.load(parent.userId)  // N calls → 1 query
```

## Pitfalls

The cache is **per request, not global**. You construct a fresh DataLoader for every incoming request so stale data and cross-user leakage are impossible — a long-lived shared instance would serve one user another's data. The trade is that nothing is reused across requests; DataLoader solves intra-request fan-out, not application-wide caching, which still belongs in a separate layer.
