---
title: HTTP versions
description: How HTTP/1.1, HTTP/2, and HTTP/3 differ in how they move requests over the network.
tags:
  - web
  - http
---

The **HTTP versions** share the same [[http|HTTP]] semantics, methods, headers, and status codes, but differ in how they move requests over the wire. HTTP/1.1 sends one request at a time per connection, so browsers open several connections in parallel and still suffer head-of-line blocking.

HTTP/2 multiplexes many requests as concurrent streams over a single connection and compresses headers, removing much of that overhead and making request bundling tricks unnecessary. It still rides on TCP, so a single lost packet stalls every stream.

HTTP/3 moves to QUIC, a protocol built on UDP that handles streams independently, so packet loss on one stream no longer blocks the others. It also folds the [[tls|TLS]] handshake into the connection setup for faster starts. The version is negotiated automatically; you mostly benefit by serving over a modern server and CDN.
