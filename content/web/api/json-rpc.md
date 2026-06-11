---
title: JSON-RPC
description: A lightweight, transport-agnostic RPC protocol that encodes a method name, params, and id as JSON.
tags:
  - web
  - api
  - rpc
---

**JSON-RPC** is a minimal [[rpc|RPC]] protocol: a request is a [[json|JSON]] object naming a `method`, its `params`, and an `id` used to match the response. That is essentially the whole spec.

```json
{ "jsonrpc": "2.0", "method": "getUser", "params": { "id": 42 }, "id": 1 }
```

## How it works

The server replies with an object carrying the same `id` and either a `result` or a structured `error`. Because correlation rides on the `id` rather than on a connection, JSON-RPC is **transport-agnostic** — the same payloads work over [[http|HTTP]], a [[../realtime/websocket|WebSocket]], a pipe, or stdio. Sending an array of requests gives **batching**: many calls in one round trip. A request with no `id` is a *notification* the server need not answer.

## Tradeoffs

It is far lighter than [[grpc|gRPC]] — no `.proto`, no codegen, human-readable text — but it carries no schema, so types and validation are on you. Versus [[rest|REST]] it ignores resources and [[http-methods|HTTP methods]] entirely: everything is a `POST` (or a socket frame) to one endpoint, which means HTTP caching and status semantics do not apply. It suits bidirectional or socket-based APIs and language servers, where its simplicity and symmetry pay off, more than public web APIs that benefit from REST's tooling.
