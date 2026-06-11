---
title: GraphQL federation
description: Composing one supergraph from multiple independently owned subgraph services.
tags:
  - web
  - api
  - graphql
---

**GraphQL federation** composes a single [[graphql|GraphQL]] supergraph from many independently owned *subgraph* services, so clients query one endpoint while each team owns its slice of the schema.

## How it works

Each subgraph declares the types it owns and marks shared types as *entities* with a `@key` — the field(s) that identify an instance, like `User` keyed by `id`. A subgraph can then extend an entity it does not own, adding fields. A **gateway** ingests every subgraph schema, builds the combined supergraph, and does *query planning*: it splits an incoming query into per-subgraph fetches, resolves each entity by its `@key`, and stitches the pieces back into one response.

```graphql
type User @key(fields: "id") { id: ID! }
```

## vs schema stitching

Older *schema stitching* merged schemas at the gateway, which held all the cross-service knowledge and stayed brittle as schemas changed. Federation inverts this: ownership lives in the subgraphs via directives, and the gateway is generated, so teams ship schema changes without editing a central file.

## Tradeoffs

Federation maps cleanly onto org boundaries and pairs naturally with a [[../../architecture/service-mesh|service mesh]], letting each team run its own [[graphql-server|GraphQL server]]. The cost is operational: a gateway is a critical extra hop, cross-subgraph queries fan out into multiple network calls, and shared entity keys become a coordination contract between teams. Reserve it for genuinely multi-team graphs — a single team is better served by one plain GraphQL server.
