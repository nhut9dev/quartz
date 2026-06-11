---
title: Graceful shutdown
description: Stopping a Node.js service without dropping in-flight work unnecessarily.
tags:
  - node
  - deployment
---

**Graceful shutdown** lets a service stop accepting new work, finish what's in flight, and close resources before exiting, instead of dying mid-request.

## How it works

The process listens for termination signals (`SIGTERM` from an orchestrator, `SIGINT` from Ctrl-C). On signal it stops taking new work — `server.close()` stops accepting connections — waits for active requests to finish, then closes database, queue, and other connections and exits with code 0. A safety timeout force-exits if draining hangs.

```js
process.on("SIGTERM", async () => {
  server.close()
  await closeDatabase()
  process.exit(0)
})
```

## Why it matters

Deploys, autoscaling, restarts, and [[../deployment/rollback|rollbacks]] all send `SIGTERM`. The orchestrator also needs a beat to deregister the instance from the load balancer, so the app should keep serving in-flight requests during that window rather than dropping them.

## Pitfalls

Not handling signals means the platform hard-kills the process and every in-flight request fails. `server.close()` waits for existing connections to end, so [[http-keep-alive|keep-alive]] sockets can stall it indefinitely — track and close idle sockets, and always set a timeout. `SIGKILL` (`kill -9`) cannot be caught, so it's the last resort, not the normal path.
