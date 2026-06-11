---
title: WebSocket protocol
description: A persistent full-duplex connection upgraded from an HTTP request.
tags:
  - networking
---

**The WebSocket protocol** provides a persistent, full-duplex channel between client and server, so either side can send messages at any time.

A connection starts as an ordinary HTTP request carrying an upgrade header, then switches to the WebSocket protocol over the same TCP connection.

After the upgrade, both sides exchange lightweight message frames without the overhead of a new request per message.

It matters for real-time features like chat, live dashboards, and collaborative editing, where polling would be wasteful.

The tradeoff is that a long-lived connection needs its own handling for reconnects, scaling across servers, and backpressure. See [[../web/websocket|WebSocket]] for usage details.
