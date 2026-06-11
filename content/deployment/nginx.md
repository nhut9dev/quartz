---
title: Nginx
description: A web server often used as a reverse proxy, static file server, and TLS entry point.
tags:
  - deployment
  - web
---

**Nginx** is a web server commonly placed in front of application servers.

It can serve static files, terminate TLS, compress responses, route requests to backend services, and apply basic limits.

In many deployments, Nginx acts as a [[../web/reverse-proxy|reverse proxy]]: the browser talks to Nginx, and Nginx forwards the request to the app.

Application code should still handle correctness and authorization. Nginx handles delivery concerns around traffic, routing, and protocol behavior.
