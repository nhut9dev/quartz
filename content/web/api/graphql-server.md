---
title: GraphQL server
description: The server side of a GraphQL API, where schema design and resolvers turn queries into data.
tags:
  - web
  - api
  - graphql
---

A **GraphQL server** owns the schema and the resolvers that fetch each field, assembling a response that matches the exact shape a client's [[graphql|GraphQL]] query asks for.

## How it works

You declare a typed schema, then attach a *resolver* to each field. The runtime walks the query tree top-down: it resolves `user`, then for each user resolves `orders`, then for each order resolves its fields. This is the **resolver chain** — a parent's return value becomes the next resolver's input. Because resolution is per-field and per-item, the same field resolver can run hundreds of times for one query.

```graphql
type Query { user(id: ID!): User }
type User { id: ID!, name: String!, orders: [Order!]! }
```

## Pitfalls

The chain makes the [[../database/n-plus-one-problem|N+1 problem]] the default failure: resolving `orders` for 100 users fires 100 separate queries. Batch with a [[dataloader|DataLoader]] so the loads collapse into one. A second risk is unbounded queries — deeply nested or wide selections can be cheap to write but ruinous to serve. Add **depth limiting** (reject queries past N levels) and **query complexity** scoring (assign a cost per field and cap the total) on public schemas.

## Design choices

Design the schema around the client's view of the domain, not your tables — expose `Order.customer`, not raw foreign keys. To lock down a public API and shrink payloads, use **persisted queries**: clients send a hash of a pre-registered query instead of the text, so the server only runs queries it has vetted. Unlike fixed [[rest|REST]] endpoints, the server returns exactly the requested fields, which removes over-fetching at the cost of doing field-level resolution yourself.
