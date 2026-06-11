---
title: Event loop lag
description: Delay caused when the Node.js event loop cannot process work promptly.
tags:
  - node
  - performance
---

**Event loop lag** is the delay between when the [[node-js-runtime|Node.js]] event loop could run a task and when it actually runs it.

High lag usually means synchronous CPU work, blocking code, too much JSON processing, or overloaded callbacks.

It hurts latency because timers, I/O callbacks, and incoming requests wait behind the blocked event loop.

CPU-heavy work may need batching, streaming, a worker pool, or [[worker-threads|worker threads]].
