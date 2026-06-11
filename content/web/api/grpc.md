---
title: gRPC
description: A high-performance RPC framework over HTTP/2 using compact binary Protocol Buffers.
tags:
  - web
  - api
---

**gRPC** is a high-performance remote procedure call (RPC) framework. Instead of modeling data as resources, you call methods on a remote service as if they were local functions. It runs over HTTP/2 and serializes messages with Protocol Buffers — a compact binary format — rather than [[json|JSON]] text.

You define services and message types in a `.proto` file, which generates strongly typed client and server code. That contract plus HTTP/2's multiplexing gives built-in streaming and low overhead, making gRPC popular for service-to-service communication inside a backend.

```txt
service UserService {
  rpc GetUser (UserId) returns (User);
}
```

The cost is readability and reach: binary messages are not human-readable, and browsers can't call gRPC natively the way they call a [[rest|REST]] endpoint over plain [[http|HTTP]]. For browser-facing realtime, a [[websocket|WebSocket]] is often the simpler fit.
