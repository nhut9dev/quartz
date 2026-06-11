---
title: GraphQL subscription
description: A GraphQL operation that streams real-time updates to the client over a persistent transport.
tags:
  - web
  - api
  - graphql
---

**A GraphQL subscription** is the third [[graphql|GraphQL]] operation type: instead of resolving once, it keeps an open channel and pushes a new result to the client every time a backing event fires.

```graphql
subscription { messageAdded(roomId: 42) { id text } }
```

## How it works

Subscriptions need a persistent transport, almost always a [[../realtime/websocket|WebSocket]] running a protocol like `graphql-ws`. The client sends the subscription document once; the server runs the resolver against a stream rather than a single value. That stream is fed by **pub/sub**: mutations or background jobs publish events to a topic, and the subscription resolver subscribes to that topic and emits a result per event, filtered and shaped by the query.

## Pitfalls

The hard part is scaling **fan-out**. Each connection is a long-lived stateful socket pinned to one server, so an in-memory pub/sub does not survive multiple instances — you need an external broker (Redis, NATS) so an event published on one node reaches subscribers on another. Watch connection count, authenticate at connect time, and clean up subscriptions on disconnect to avoid leaks.

## Tradeoffs

Subscriptions give typed, query-shaped realtime data on the same schema as the rest of your API. But they are heavier than the alternatives: for one-way server-to-client streams, [[../realtime/server-sent-events|server-sent events]] over plain HTTP are simpler and reconnect for free, and for low-frequency updates ordinary polling avoids persistent connections entirely. Reach for subscriptions when you need bidirectional, high-frequency, schema-typed streams.
