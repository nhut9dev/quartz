---
title: Effect cleanup
description: A function returned from useEffect to undo the previous effect.
tags:
  - react
  - hook
  - effect
---

An **effect cleanup** is a function returned from [[use-effect|useEffect]]. React calls it before running the effect again and when the component unmounts.

```jsx
useEffect(() => {
  const id = setInterval(() => {
    console.log("tick")
  }, 1000)

  return () => clearInterval(id)
}, [])
```

Cleanups prevent old subscriptions, timers, listeners, or requests from staying alive after the UI no longer needs them.

If an effect creates or subscribes to something, it probably needs cleanup. If it only calculates data for render, it probably should not be an effect in the first place.

## How it works

The function an effect returns is stored and called at two times: right before React runs the *next* invocation of that effect (when a dependency changes), and when the component unmounts. This means every effect with a dependency array that can change is really a "setup → teardown → setup → teardown..." cycle, not "setup once" — each run's cleanup tears down exactly what that run's setup created, so the next run starts clean rather than stacking subscriptions.

## When to use

Return a cleanup whenever the effect's setup creates something that outlives a single render and isn't automatically discarded: `setInterval`/`setTimeout` (clear them), `addEventListener` (remove it), subscriptions to external stores or sockets (unsubscribe), and in-flight requests you want to ignore if the component moves on before they resolve.

## Trade-offs

Cleanup makes effects safe to run repeatedly — which [[strict-mode|Strict Mode]] relies on, deliberately mounting, unmounting, and remounting components in development to verify cleanups actually undo their setups. The cost is that every effect with a side effect now has two halves to keep in sync; an effect that's easy to write correctly once (subscribe) becomes a place where forgetting the symmetric teardown silently leaks.

## Pitfalls

The classic race condition: an effect kicks off an async fetch, the component unmounts (or deps change) before it resolves, and the `.then()` callback calls `setState` on a component that's gone — React warns about this, and the deeper problem is that the resolved data may now be stale and overwrite newer state. The fix is a cleanup that sets a `cancelled` flag (or an [[../dom/abort-controller|AbortController]]) checked before the `setState` call, not just "ignore the warning." A second pitfall is asymmetric cleanup — subscribing to one event but only unsubscribing from another, or clearing the wrong interval id when an effect re-runs quickly — which tends to surface only under [[strict-mode|Strict Mode]]'s double-invoke or after many remounts, not in casual manual testing.
