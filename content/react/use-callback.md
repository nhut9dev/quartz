---
title: useCallback
description: A React hook for memoizing a function reference.
tags:
  - react
  - hook
  - performance
---

`useCallback` memoizes a function reference between renders. It is similar to [[use-memo|useMemo]], but specifically for functions.

```jsx
const handleSelect = useCallback(id => {
  setSelectedId(id)
}, [])
```

Use it when a stable function reference matters: passing callbacks to a [[react-memo|memoized]] child, subscribing and unsubscribing in an effect, or avoiding unnecessary recalculation in another hook.

It does not make the function itself faster. It only helps preserve identity across renders when dependencies have not changed.

## How it works

`useCallback(fn, deps)` is essentially `useMemo(() => fn, deps)` — React stores the function and the dependency array from the last render, and on each render compares the new `deps` to the stored ones with `Object.is`. If they're all equal, it hands back the *same function reference* from before instead of the newly-created one; if any dependency changed, it stores and returns the new function. The function is created either way on every render — `useCallback` only decides which one your code keeps a reference to.

## When to use

It matters only when something downstream cares about reference identity: passing a callback to a [[react-memo|`React.memo`]]'d child (so the child's prop comparison sees "same function" and skips re-rendering), or using the function as a dependency of another `useEffect`/`useMemo`/`useCallback` (so *that* hook doesn't re-run every render just because this function is "new"). If neither applies, `useCallback` changes nothing observable.

## Trade-offs

`useCallback` itself isn't free — it stores the previous deps array and function and runs a comparison every render, which is overhead. For a plain `<button onClick={handleClick}>` with no memoized child, that overhead buys nothing: the comparison cost can exceed the cost of just creating a new closure, which is normally cheap. The benefit only materializes when it actually prevents a more expensive re-render or effect re-run further down the tree.

## Pitfalls

Wrapping every handler in `useCallback` "for performance" without memoizing the children that receive them is pure overhead with no payoff — `React.memo` is the half of the pair that actually matters. The other common miss is a dependency array that itself contains a value recreated every render (an inline object, or a non-memoized callback from a parent) — `useCallback` then returns a new function every time anyway, since one of its deps is never `Object.is`-equal to the previous render's, silently defeating the memoization while looking like it's working.
