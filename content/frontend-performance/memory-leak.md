---
title: Memory leak
description: A runtime problem where memory is kept alive after it is no longer needed.
tags:
  - performance
  - javascript
---

A **memory leak** happens when objects remain reachable even though the application no longer needs them.

Common frontend causes include forgotten event listeners, timers, subscriptions, cached data, detached DOM nodes, and long-lived [[closure|closures]].

Leaks can make an app slow over time, especially dashboards, editors, and [[spa|single-page applications]] that stay open for hours.
