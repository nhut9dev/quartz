---
title: WebSocket
description: A persistent full-duplex connection for real-time, two-way messaging between client and server.
tags:
  - web
  - api
  - realtime
---

**WebSocket** is a protocol that keeps a single, persistent, full-duplex connection open so client and server can push messages to each other at any time. Once connected, neither side has to ask first — a natural fit for chat, live dashboards, collaborative editing, and multiplayer games.

```txt
GET /chat → Upgrade: websocket → open socket ↔ messages both ways
```

## How the connection works

A WebSocket starts as an ordinary [[http|HTTP]] request with an `Upgrade: websocket` header. If the server agrees (`101 Switching Protocols`), the same TCP connection is repurposed for ongoing two-way frames instead of one request and one response. From then on it's stateful and long-lived, not request/response.

## vs SSE vs polling

Pick by direction and need. True bidirectional realtime → WebSocket. Server-to-client only (notifications, feeds) → [[server-sent-events|SSE]], which runs over plain HTTP and reconnects automatically. Infrequent or simple updates → ordinary polling, which is cheapest to operate.

## Pitfalls

Scaling is the hard part: connections are stateful and pinned to one server, so multiple instances need a shared pub/sub backplane (Redis, a message broker) to deliver a message to a user connected elsewhere, plus sticky routing through a [[reverse-proxy|reverse proxy]]. Reconnection, heartbeats, and exponential backoff are yours to implement — the connection *will* drop. Authenticate at the handshake, since frames carry no per-message auth. And a slow consumer needs backpressure handling or the server buffers without bound.
