---
title: Reverse proxy
description: A server-side proxy that receives client requests and forwards them to backend services.
tags:
  - web
  - infrastructure
---

A **reverse proxy** sits in front of backend servers. Clients connect to the reverse proxy, and it forwards each request to the right internal service.

```txt
browser -> reverse proxy -> app server
```

Reverse proxies commonly handle TLS termination, compression, static file serving, load balancing, caching, request limits, and routing between services. Nginx, Caddy, Apache, Envoy, and cloud load balancers often play this role.

This is different from a [[proxy|forward proxy]], which usually represents the client. A reverse proxy represents the server side and hides the internal backend layout.

## How it works

The reverse proxy terminates the client's connection and opens its own connection(s) to one or more backend instances. A load-balancing algorithm — round robin, least connections, or consistent hashing for sticky routing — picks which backend handles each request. From the backend's perspective, every request comes from the proxy's IP on a fresh or pooled connection, not from the original client.

## When to use

Use a reverse proxy to terminate TLS in one place so individual services don't each manage certificates, to route by path or hostname to multiple services behind one domain, and to add sticky routing when a backend holds per-connection state — a [[../realtime/websocket|WebSocket]] server or an in-memory session store.

## Trade-offs

Centralizing TLS termination, routing, and rate limiting at the proxy simplifies every backend behind it, but makes the proxy itself a single point of failure and a shared bottleneck — it now has to be scaled, monitored, and kept highly available on behalf of everything it fronts.

## Pitfalls

Backend code that reads the client's IP from the raw socket sees the proxy's address, not the real client — it must read `X-Forwarded-For` instead, and validate it, since a client can set that header too if the proxy doesn't overwrite it. Long-lived connections — WebSockets, SSE, long polling — need explicit proxy configuration (timeouts, buffering disabled) or the proxy's defaults will close them prematurely. And forwarding the wrong `Host` header can break virtual-host routing or any backend logic that relies on the request's hostname.
