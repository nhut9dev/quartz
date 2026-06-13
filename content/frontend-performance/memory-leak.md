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

## How it works

JavaScript's garbage collector frees an object only when it's **unreachable** from any root (the global object, active call stacks, or live closures) — a "leak" in JS isn't unfreed memory like in C, it's an object that's still reachable through some reference chain the app no longer cares about. The classic chain: an event listener or `setInterval` callback is a closure, closures keep their entire enclosing scope alive, and if that scope references a large object (component state, a DOM subtree), the listener alone is enough to keep all of it alive — even after the component that created it is gone.

## When to use

Use heap snapshots (DevTools Memory tab) when investigating: take a snapshot, perform an action repeatedly (open/close a modal, navigate between two routes), take another snapshot, and compare. Memory that grows with each repetition and never returns to baseline indicates something from that action is being retained — the snapshot diff shows exactly which objects.

## Trade-offs

Thorough cleanup — removing every listener, clearing every timer, unsubscribing every observer on unmount — adds boilerplate to every component that sets one up (see [[../react/effect-cleanup|effect cleanup]]). For a page that's reloaded often, a small leak per interaction might never accumulate enough to matter. For long-lived SPAs — dashboards left open for a shift, editors with hours-long sessions — the same small leak compounds until the tab visibly degrades or crashes, so the cost of cleanup discipline scales with how long the app stays open.

## Pitfalls

A **detached DOM node** — removed from the document but still referenced by a JS variable, a `Map`, or a closure — is retained in full, along with its entire subtree; this commonly happens when code caches references to elements (`elementCache.set(id, el)`) and the cache is never pruned when those elements are removed. The other recurring pattern is an unbounded in-memory cache or memoization map — it "looks like" a performance optimization, but if keys are never evicted (e.g. keyed by every search query a user has ever typed), it grows for the lifetime of the session. Both are invisible in normal testing because they only matter after extended use, which is exactly when users notice the app has become sluggish.
