---
title: Proxy
description: An intermediary that forwards requests between clients and servers.
tags:
  - web
  - networking
---

A **proxy** is an intermediary that forwards requests between a client and another server. The client talks to the proxy, and the proxy talks onward.

Forward proxies usually sit near the client and are used for filtering, privacy, corporate network rules, or routing traffic through another location.

```txt
client -> proxy -> internet
```

A proxy can hide the client's direct connection from the destination, but it also becomes a trusted middle point. For server-side architecture, the more common term is [[reverse-proxy|reverse proxy]].
