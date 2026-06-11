---
title: Distributed lock
description: A coordination mechanism that lets only one process perform a critical action at a time.
tags:
  - system-design
  - reliability
---

A **distributed lock** coordinates work across multiple processes or machines so only one actor performs a critical action at a time.

Distributed locks are used for scheduled jobs, singleton workers, cache rebuilds, migrations, and protecting scarce shared resources.

They are harder than local locks because networks fail, clocks drift, processes pause, and lock holders can die mid-operation.

Good designs use timeouts, ownership tokens, fencing, and idempotent work so a lock failure does not corrupt state.

```js
// acquire only if absent (NX), auto-expire after a TTL (PX)
// token identifies the owner so only it can safely release
await redis.set("lock:job", token, "NX", "PX", 30000);
```
