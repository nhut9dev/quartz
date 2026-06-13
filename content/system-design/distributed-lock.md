---
title: Distributed lock
description: A coordination mechanism that lets only one process perform a critical action at a time.
tags:
  - system-design
  - reliability
---

A **distributed lock** coordinates work across multiple processes or machines so that only one actor performs a critical action at a time — the cross-machine equivalent of a [[../concurrency/mutex|mutex]], but without shared memory to rely on.

It's used for scheduled jobs that must run once, singleton workers, cache rebuilds, migrations, and protecting scarce shared resources.

## How it works

The basic primitive is an atomic "set if absent with an expiry." A process tries to create a lock key only if it doesn't exist; success means it holds the lock. A **TTL** auto-expires the lock so a holder that crashes doesn't block everyone forever. A unique **owner token** lets only the true holder release it, so a process can't accidentally delete a lock that's since been reacquired by someone else.

```js
// acquire only if absent (NX), auto-expire after a TTL (PX)
// token identifies the owner so only it can safely release
await redis.set("lock:job", token, "NX", "PX", 30000);
```

## Why it's hard

A local mutex lives in one process's memory and is reliable. A distributed lock has to survive networks that drop messages, clocks that drift, and processes that pause (a GC stall or VM suspend can freeze a holder for seconds). The killer scenario: process A holds the lock, pauses for longer than the TTL, the lock expires, B acquires it — and then A wakes up still *believing* it holds the lock. Now two processes act on the protected resource at once, which is exactly what the lock was supposed to prevent.

## Fencing

The standard defense is a **fencing token**: the lock service hands out a monotonically increasing number with each grant. The protected resource (database, storage) rejects any operation carrying a token lower than the highest it has seen. So when paused-then-resumed A finally writes with its stale token, the resource refuses it — B's higher token has already moved the world forward. Fencing turns a correctness bug into a rejected request.

## Pitfalls

A TTL that's too short expires the lock mid-work (the scenario above); too long and a real crash blocks everyone for the full duration — and no single TTL is right when work duration varies. Treating a distributed lock as a *correctness* guarantee without fencing is the classic mistake; without it, the lock is at best an optimization that reduces contention, not a hard guarantee. The most robust designs also make the protected work [[../messaging/idempotent-consumer|idempotent]], so a lock failure degrades to harmless repetition rather than corruption.
