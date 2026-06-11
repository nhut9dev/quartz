---
title: Concurrent rendering
description: React's ability to interrupt, pause, and prioritize rendering work.
tags:
  - react
  - rendering
  - performance
---

**Concurrent rendering** lets React prepare a new UI in the background, pause that work to handle something more urgent, and resume or throw it away — instead of rendering in one uninterruptible pass.

Before concurrent features, a [[re-render|render]] was synchronous: once it started, the main thread was blocked until it finished, so a large update could make typing or clicking feel frozen. Concurrent rendering, built on the Fiber architecture, breaks work into units React can interrupt.

## How it works

React assigns updates a priority. Urgent updates — typing, clicking, hovering — are processed immediately. Updates marked as non-urgent are rendered in the background; if an urgent update arrives mid-render, React pauses the background work, ships the urgent change, then restarts the lower-priority work from where it makes sense. Work that is never committed is simply discarded.

## Marking work as non-urgent

You opt in with [[use-transition|useTransition]] / `startTransition` (for state updates) and [[hooks/use-deferred-value|useDeferredValue]] (for a value). A classic case is a search box: the input stays responsive while the expensive filtered results render as a transition.

```jsx
const [isPending, startTransition] = useTransition()
startTransition(() => setQuery(input)) // results update without blocking typing
```

## Tearing and external state

Because React can yield in the middle of a render, reading a mutable store directly during render risks **tearing** — different parts of the UI showing different values of the same data. Subscribing through [[hooks/use-sync-external-store|useSyncExternalStore]] keeps the snapshot consistent, which is why Redux and Zustand use it internally.

## Pitfalls

Transitions reprioritize work; they do not make a slow render fast — a genuinely expensive component still needs [[react-memo|memoization]] or [[list-virtualization|virtualization]]. Don't rely on render order or count for side effects: under concurrency (and [[react/strict-mode|Strict Mode]]) a component may render more than once before committing, so keep render [[purity|pure]] and put effects in the right place.
