---
title: Long task
description: Main-thread work that blocks the browser for too long.
tags:
  - performance
  - javascript
---

A **long task** is JavaScript or browser work that blocks the [[event-loop|main thread]] long enough to delay input and rendering.

Long tasks make clicks, typing, animation, and scrolling feel stuck.

Break heavy work into smaller chunks, defer noncritical work, use workers for CPU-heavy tasks, and reduce expensive rendering.
