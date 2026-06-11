---
title: GraphQL
description: A query language and runtime for APIs where the client requests exactly the fields it needs.
tags:
  - web
  - api
---

**GraphQL** is a query language and runtime for APIs that exposes a single endpoint. The client sends a query describing exactly which fields it wants, and the server returns just that shape — avoiding the over-fetching and under-fetching common with fixed [[rest|REST]] responses.

```graphql
query { user(id: 42) { name orders { id } } }
```

## Schema and operations

A GraphQL API is built around a strongly typed schema. Operations come in three kinds: **queries** read, **mutations** write, and **subscriptions** stream ongoing updates. Each field is backed by a *resolver* — a function that fetches that piece of data — and the runtime assembles the response by walking the query against the schema. Requests are [[json|JSON]] over [[http|HTTP]], typically a `POST`.

## vs REST

The client, not the server, decides the response shape, which kills round trips and lets many screens share one endpoint. The cost is server-side setup: you define and resolve the schema yourself.

## Pitfalls

Naive resolvers cause the [[../database/n-plus-one-problem|N+1 problem]] — one query per item — so batching with a DataLoader is essential. Caching is harder than REST: a single `POST` endpoint has no per-resource URL for HTTP caches to key on. A public schema invites expensive deep or wide queries, so add depth and cost limits. And GraphQL returns `200` with an `errors` array even on failure, so clients must inspect the body, not just the status.
