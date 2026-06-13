---
title: useMemo
description: A React hook for memoizing an expensive calculated value.
tags:
  - react
  - hook
  - performance
---

`useMemo` memoizes a calculated value between renders. React recalculates the value only when one of its dependencies changes.

```jsx
const visibleUsers = useMemo(() => {
  return users.filter(user => user.active)
}, [users])
```

Use it for expensive calculations or for keeping object and array references stable when that stability matters.

Do not wrap every calculation in `useMemo`. Most calculations are cheap, and unnecessary memoization makes code harder to read. Start with clear rendering logic, then optimize measured bottlenecks.

## How it works

On each render, React compares the new dependency array to the one from last render using `Object.is` on each entry. If all entries match, React skips calling the function and returns the cached value from last time; if any entry differs, it calls the function again and caches the new result with the new deps. React documents this cache as an optimization, not a guarantee — it *may* discard a memoized value (e.g. to free memory) and recompute it on a later render even if the deps haven't changed, so `useMemo` must never be the only thing making a computation correct, only faster.

## When to use

Two distinct uses: (1) avoiding redoing a genuinely expensive computation (filtering/sorting a large array, complex derived calculations) on every render, and (2) preserving *referential* stability of an object or array — so a [[react-memo|memoized]] child receiving it as a prop, or an effect depending on it, doesn't see "a new object" every render even though its contents are the same.

## Trade-offs

`useMemo` trades a small fixed cost (storing deps + cached value, running the comparison every render) for skipping a potentially larger recomputation. For cheap calculations — formatting a string, a simple filter on a handful of items — the fixed cost of `useMemo` itself can be larger than just doing the work, so blanket memoization makes code slower and harder to read for no benefit. It's a tool for measured hot paths, not a default wrapper.

## Pitfalls

Because React may discard the cache, `useMemo` must not be used to run code with side effects (mutating external state, logging, starting a subscription) — if React recomputes "for free" on a render where you didn't expect it, those side effects fire again unexpectedly; side effects belong in [[use-effect|`useEffect`]] or event handlers, never in a `useMemo` callback. The other common miss is memoizing a value whose dependency array contains something recreated every render (an inline object or array) — the memo then recomputes every time anyway, giving none of the referential-stability benefit while still paying the comparison cost.
