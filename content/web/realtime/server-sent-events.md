---
title: Server-Sent Events
description: A one-way channel where the server streams events to the client over a long-lived HTTP connection.
tags:
  - web
  - api
  - realtime
---

**Server-Sent Events (SSE)** is a one-way channel where the server streams a sequence of events to the client over a single, long-lived [[http|HTTP]] connection. The browser opens the connection once and the server keeps sending updates as they happen, with automatic reconnection if the link drops.

SSE is simpler than a [[websocket|WebSocket]] when you only need server→client updates: notifications, progress bars, live feeds, or status changes. There's no upgrade handshake and no custom protocol — just an HTTP response that stays open and emits text events.

```txt
event: progress
data: 60%
```

The tradeoffs follow from that simplicity: SSE is text-only and strictly one-directional, so the client still uses a normal request to send data back. It pairs naturally with [[../rendering/streaming|streaming]], delivering chunks of data to the page as they become ready rather than all at once.

## How it works

The response uses `Content-Type: text/event-stream` and stays open. Each event is a plain-text block — `data:`, `event:`, and `id:` fields, ending with a blank line — and the browser's `EventSource` API parses these automatically. If the connection drops, `EventSource` reconnects on its own and sends the last received `id` as `Last-Event-ID`, so the server can resume from where it left off.

## When to use

Reach for SSE whenever you need server-to-client streaming over plain HTTP and want reconnection handled for you — notification streams, progress updates, log tails. It's the simplest option when the client never needs to push data over the same channel.

## Trade-offs

SSE rides on the same connection model as the HTTP version in use: under HTTP/1.1, each open SSE stream occupies one of the browser's small per-origin connection budget, so several SSE streams plus ordinary page requests can exhaust it. HTTP/2's multiplexing removes this limit, since streams share one connection.

## Pitfalls

Many proxies and load balancers buffer responses by default, holding chunks until a buffer fills — this silently breaks SSE's "send as it happens" behavior unless buffering is explicitly disabled for that route. `EventSource` also has no way to set custom request headers, so token-based auth can't use an `Authorization` header — it typically falls back to a cookie or a token embedded in the URL, each with its own exposure trade-offs.
