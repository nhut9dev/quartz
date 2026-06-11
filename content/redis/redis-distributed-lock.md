---
title: Redis distributed lock
description: A lock stored in Redis so multiple processes can coordinate exclusive work.
tags:
  - redis
  - distributed-systems
---

**Redis distributed lock** is a lock stored in Redis so multiple processes can coordinate exclusive work.

### How it works

A process creates a key with a unique token and short [[redis-ttl|TTL]] using an atomic "set if not exists" operation. It releases the lock only if the token still matches, which avoids deleting another process's lock after expiry and reacquisition.

The TTL prevents deadlock if the holder crashes. The token prevents unsafe unlocks. The work must still tolerate retries because locks can expire, clients can pause, and networks can partition.

### When to use

Use Redis locks for coarse coordination around idempotent jobs, cron de-duplication, and short critical sections where occasional retry is acceptable.

### Trade-offs

Redis locks are simple and fast, but they are not a substitute for database constraints, [[../database/transaction|transactions]], or consensus systems when correctness is strict.

### Pitfalls

Avoid long locks, missing TTLs, unlocking without token checks, and using a lock as the only protection for irreversible side effects.
