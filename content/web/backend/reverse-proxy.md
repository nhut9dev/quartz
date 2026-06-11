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
