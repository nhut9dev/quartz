---
title: Worker process
description: A separate process that pulls jobs from a queue and executes them.
tags:
  - background-jobs
  - architecture
---

A **worker process** is a standalone process (or dyno/container) that pulls jobs from a [[job-queue|job queue]] and runs their handlers, separate from the web process that serves requests.

## How it works

The worker loops: fetch the next job, run its handler, acknowledge success or report failure for retry. Running it apart from the web tier means CPU-heavy or slow jobs do not steal capacity from request handling, and the two tiers scale independently — add workers when the queue backs up without touching web instances. Concurrency is tuned per worker (how many jobs it runs at once) and often modeled as a [[../concurrency/thread-pool|thread pool]] sizing problem.

## When to use

Use a dedicated worker whenever background work is non-trivial: it isolates failures, gives you a clean place to set concurrency and resource limits, and lets you autoscale on queue depth rather than HTTP traffic.

## Pitfalls

The hard part is shutdown. When a deploy or scale-down sends `SIGTERM`, the worker must stop accepting new jobs, finish or safely abandon the in-flight one, and exit before the kill timeout — see [[../node/graceful-shutdown|graceful shutdown]]. A job killed mid-run will be retried, so handlers must be idempotent. Watch for one slow job type starving others; isolating queues or capping per-type concurrency helps.
