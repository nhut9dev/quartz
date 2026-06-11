---
title: Semaphore
description: A counter that limits how many threads can hold a resource at once.
tags:
  - concurrency
  - synchronization
---

A **semaphore** maintains a count of *permits*; a thread must acquire a permit to proceed and releases it when done, blocking once permits run out.

## How it works

A counting semaphore is initialized with N permits. Each `acquire()` decrements the count; each `release()` increments it. When the count hits zero, further acquirers wait. This caps concurrency at N regardless of how many tasks arrive.

```js
const sem = new Semaphore(5); // at most 5 in flight
await sem.acquire();
try {
  await callExternalApi();
} finally {
  sem.release();
}
```

## When to use

Use a semaphore to **bound concurrency** against something with finite capacity: limit concurrent outbound HTTP calls to a flaky third party, cap in-flight queries so you don't exhaust DB connections, or throttle how many files you process at once. It is the in-process cousin of a [[../architecture/bulkhead|Bulkhead]], isolating one workload's resource use.

## Tradeoffs

A [[mutex|Mutex]] is effectively a binary semaphore (one permit) — but a mutex also carries ownership semantics (only the locker unlocks), while a semaphore's permits are anonymous and can be released by anyone. Pick the permit count to match the real downstream limit; this is closely related to [[connection-pool-tuning|Connection pool tuning]], where the pool size *is* the permit count.
