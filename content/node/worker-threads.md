---
title: Worker threads
description: Node.js threads for running CPU-heavy JavaScript without blocking the main event loop.
tags:
  - node
---

**Worker threads** run JavaScript in separate threads inside one Node.js process, so CPU-heavy work — parsing, compression, image processing, expensive calculations — doesn't block the main thread's [[../javascript/event-loop|event loop]].

## How it works

Each worker is its own V8 isolate with its own event loop and memory, not shared mutable state. Threads communicate by passing messages (`postMessage`), which are copied via structured clone, or by sharing a `SharedArrayBuffer` for true shared memory. Spinning up a worker has real startup and memory cost, so they're not free.

## vs cluster vs child_process

These solve different problems. **worker_threads**: CPU-bound work, in-process, can share memory. **cluster**: forks multiple *processes* that share one server port, so an I/O-bound server uses all CPU cores for request concurrency. **child_process**: launches a separate program (a script, a binary) and talks to it over stdio. Reach for cluster to scale request throughput, workers to offload computation.

## Pitfalls

Workers do **not** make async I/O faster — Node already does I/O without blocking, so wrapping a database call in a worker only adds overhead. Large messages are expensive because of the clone cost; share a buffer instead. Spawning a worker per task thrashes; use a fixed pool. And you can't pass ordinary objects with methods or closures across the boundary — only cloneable data.
