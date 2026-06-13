---
title: Bulkhead
description: Isolating resources so one failure does not consume the whole system.
tags:
  - architecture
---

A **bulkhead** isolates resources into separate pools so that one failing or overloaded workload can't consume the capacity the rest of the system needs — named after the watertight compartments that keep a breached ship from flooding entirely.

## How it works

The failure it prevents is **resource exhaustion through sharing**. If every request type draws from one shared pool — one thread pool, one connection pool, one queue — then one slow dependency is enough to sink everything: calls to it pile up, hold their threads waiting, and starve the pool, so unrelated requests that never touch that dependency also fail for lack of a thread.

A bulkhead partitions the pool by class of work. Calls to dependency A get pool A, calls to B get pool B. When A goes slow, pool A fills and *A's* calls degrade — but B's traffic flows on its own untouched capacity. The blast radius is contained to the part that's actually failing.

## When to use

Apply it wherever one shared, finite resource is contended by workloads with different risk profiles: separate the connection pool for a flaky third-party API from the one for your own database; give background jobs a different worker pool than user-facing requests; isolate a single noisy tenant in a [[multi-tenancy|multi-tenant]] system. It's most valuable in front of dependencies you don't control and can't trust to stay fast.

## Pitfalls

Partitioning lowers utilization — reserved capacity sits idle when its workload is quiet, so the system as a whole needs more headroom than one shared pool would. Pools sized too small become their own bottleneck even when nothing is failing. And bulkheads only contain failures; they don't stop you from *calling* a dead dependency, so they're paired with [[circuit-breaker|circuit breakers]], [[timeout|timeouts]], and a [[fallback|fallback]] so a saturated pool fails fast instead of making callers wait on it.
