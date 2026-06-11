---
title: Thread pool
description: A fixed set of reusable workers that pull tasks from a queue.
tags:
  - concurrency
  - performance
---

A **thread pool** is a bounded set of long-lived workers that pull tasks off a shared queue, instead of spawning a new thread per task.

## How it works

Tasks are submitted to a queue; a fixed number of workers loop, each taking the next task, running it, and returning for more. Workers are reused, so you pay thread startup cost once rather than per task. In Node this maps onto a pool of [[../node/worker-threads|worker threads]] for CPU work, or [[../node/cluster|Cluster]] processes for request concurrency.

## When to use

Bound the pool because unbounded concurrency is the real danger: spawning a worker per task exhausts memory, thrashes the CPU with context switches, and can stampede downstream services. A fixed pool turns load into a queue you can observe and control.

**Sizing** depends on the workload. CPU-bound tasks gain nothing past the core count, so size roughly to the number of cores. I/O-bound tasks spend most time waiting, so a larger pool keeps the CPU busy while others block.

## Pitfalls

Under **saturation** — work arriving faster than it drains — the queue grows and latency climbs. Decide a *rejection policy*: cap the queue and reject (or shed) excess rather than letting an unbounded queue blow up memory and hide the overload. The same sizing logic applies to [[connection-pool-tuning|Connection pool tuning]].
