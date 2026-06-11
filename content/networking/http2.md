---
title: HTTP/2
description: Multiplexed streams and header compression over a single connection.
tags:
  - networking
---

**HTTP/2** improves web performance by carrying many requests and responses as multiplexed streams over one TCP connection, instead of one request per connection.

Earlier [[../web/http-versions|HTTP versions]] forced browsers to open many connections or queue requests, which was slow.

HTTP/2 adds header compression and lets the server push resources, cutting overhead for pages with many assets.

It matters because it reduces latency and connection cost without changing how developers write requests.

The key tradeoff is head-of-line blocking at the transport layer: because all streams share one TCP connection, a single lost packet can stall every stream, which [[http3-quic|HTTP/3 over QUIC]] was designed to fix.
