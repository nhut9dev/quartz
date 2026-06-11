---
title: Garbage collection
description: Go's concurrent, low-latency garbage collector that reclaims unused memory.
tags:
  - go
  - performance
---

Go's **garbage collector** automatically frees memory no longer reachable, using a concurrent design tuned for low pause times rather than raw throughput.

## How it works

It is a **concurrent tri-color mark-sweep** collector. Objects are conceptually white (unreached), grey (reached, children not yet scanned), or black (fully scanned); marking runs *alongside* your program instead of pausing it. The short **stop-the-world** phases — only to start and finish a cycle — are kept to well under a millisecond, so latency stays predictable even under heavy allocation.

The `GOGC` knob controls the tradeoff: it sets how much the heap may grow before the next cycle (default 100, meaning collect when the live heap doubles). Lower values collect more often using less memory; higher values use more memory for less CPU overhead.

## vs V8

V8 (the [[../node/node-js-runtime|Node.js]] engine) uses a generational collector optimized for many short-lived objects, with occasional longer pauses. Go's collector instead optimizes for consistently short pauses across the whole heap, fitting latency-sensitive servers.

## Pitfalls

The GC reclaims unreachable memory, but a lingering reference — a global cache, an unbounded slice, a leaked goroutine holding state — keeps memory live and produces a [[../frontend-performance/memory-leak|memory leak]] the collector cannot help with. Excessive short-lived allocations also raise GC pressure; reuse buffers (e.g. `sync.Pool`) on hot paths.
