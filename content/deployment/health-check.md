---
title: Health check
description: An endpoint or command that reports whether a service is ready or healthy.
tags:
  - deployment
  - backend
---

A **health check** reports whether a service is running, ready, or able to handle traffic.

```http
GET /health
```

Health checks help load balancers, orchestrators, and monitoring systems decide when to route traffic, restart a process, or alert an operator.

A simple liveness check can return success if the process is running. A readiness check may also verify dependencies such as the database or cache.
