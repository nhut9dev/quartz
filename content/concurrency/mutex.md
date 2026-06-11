---
title: Mutex
description: A lock that lets only one thread enter a critical section at a time.
tags:
  - concurrency
  - synchronization
---

A **mutex** (mutual exclusion lock) ensures that only one thread executes a *critical section* — the code touching shared state — at a time.

## How it works

A thread calls `lock()` before entering the critical section and `unlock()` when done. While one thread holds the lock, others block until it is released. This serializes access so updates can't interleave and corrupt shared data.

```js
await mutex.lock();
try {
  balance += amount; // critical section
} finally {
  mutex.unlock();
}
```

Always release in a `finally` so an exception can't leave the lock held forever.

## Pitfalls

**Deadlock** is the main hazard: two threads each hold a lock the other needs and both wait forever. Always acquire multiple locks in a consistent global order, or use timeouts. See [[../database/deadlock|Deadlock]] for the database analogue.

**Lock granularity** is a tradeoff. One coarse lock is simple but serializes everything, killing parallelism. Many fine-grained locks allow concurrency but raise complexity and deadlock risk.

A plain mutex is **non-reentrant**: the same thread re-acquiring it deadlocks against itself. Use a reentrant lock if a locked path may call back into itself.

## Tradeoffs

A mutex is a binary gate (one holder). When you instead want to allow *N* concurrent holders, reach for a [[semaphore|Semaphore]]. The problem a mutex prevents is the [[race-condition|Race condition]].
