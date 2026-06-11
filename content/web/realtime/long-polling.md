---
title: Long polling
description: The client holds an open request until the server has data or it times out, then immediately reconnects.
tags:
  - web
  - api
  - realtime
---

**Long polling** is a technique where the client sends a request and the server holds it open — not answering — until it has new data or a timeout fires. The moment a response arrives, the client fires another request, so there's almost always a request waiting. This simulates server push over plain [[http|HTTP]] with no special protocol.

```txt
request → (server waits) → response when data ready → request again ...
```

## How it works

Contrast with *short polling*, where the client asks on a fixed interval ("anything new?") and usually gets back an empty answer. Long polling flips that: the server simply doesn't reply until there's something worth sending. Latency drops to near-zero because the response goes out the instant data exists, and wasted empty round-trips disappear. The cost is that each delivered message still ends one HTTP cycle and starts a fresh one.

## When to use

It's the pragmatic fallback when you need server→client pushiness but can't rely on [[server-sent-events|SSE]] or [[websocket|WebSocket]] — old browsers, restrictive proxies, or environments that mangle long-lived connections. Many realtime libraries keep it as a transport of last resort precisely because it works almost everywhere.

## Tradeoffs

For a steady stream of frequent updates, the constant reconnect overhead makes it heavier than SSE (one connection, many events) or a WebSocket (one connection, both directions). Long polling shines for *occasional* events — notifications, status changes — where idle waiting dominates and the reconnect cost is rare. Each held request also ties up a server connection slot, so a lot of idle clients can exhaust the connection pool.
