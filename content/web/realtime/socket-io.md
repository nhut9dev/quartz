---
title: Socket.IO
description: A library on top of WebSocket adding reconnection, fallbacks, rooms, and an event-based API.
tags:
  - web
  - realtime
  - library
---

**Socket.IO** is a library that wraps [[websocket|WebSocket]] with the production conveniences raw sockets leave you to build yourself: automatic reconnection with backoff, heartbeats, transparent fallback to [[long-polling|long polling]] when a WebSocket can't be established, and an event-based API where you `emit` named events with payloads instead of pushing opaque frames.

```js
socket.on("message", (data) => { /* ... */ });
socket.emit("message", { text: "hi" });
```

## How it works

Crucially, Socket.IO is **not** raw WebSocket — it layers its own protocol on top (framing, packet types, acknowledgements), so a Socket.IO client must talk to a Socket.IO server; you can't point it at a plain `ws://` endpoint. *Namespaces* split logical channels over one connection, and *rooms* let the server broadcast to arbitrary subsets of clients — `io.to("room").emit(...)` — without you tracking socket lists.

## When to use

Reach for it when you want WebSocket's two-way realtime but don't want to hand-roll reconnection, transport fallback, and room/broadcast bookkeeping. If you need full protocol control, interoperability with non-JS clients, or the leanest possible wire format, raw WebSocket is the better fit.

## Scaling

Like any WebSocket app, connections are pinned to one server, so multiple instances can't see each other's clients by default. The **Redis adapter** fixes this: it routes room broadcasts and emits through [[../../caching/redis|Redis]] pub/sub so a message to a room reaches clients no matter which node they're connected to. You still need sticky sessions at the load balancer so a client's polling and upgrade requests land on the same instance.
