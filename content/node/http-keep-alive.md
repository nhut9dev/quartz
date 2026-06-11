---
title: HTTP keep-alive
description: Reusing TCP connections for multiple HTTP requests.
tags:
  - node
  - web
---

**HTTP keep-alive** keeps a connection open so multiple HTTP requests can reuse it.

Connection reuse avoids repeated TCP and TLS setup costs, reducing latency and load.

In Node.js services, keep-alive settings matter for both incoming server connections and outgoing HTTP clients.

Poor timeout alignment between clients, proxies, and servers can cause connection resets or uneven load.
