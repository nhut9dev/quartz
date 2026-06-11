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

The tradeoffs follow from that simplicity: SSE is text-only and strictly one-directional, so the client still uses a normal request to send data back. It pairs naturally with [[streaming|streaming]], delivering chunks of data to the page as they become ready rather than all at once.
