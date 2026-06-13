---
title: useDeferredValue
description: A React hook for deferring a value so urgent UI can update first.
tags:
  - react
  - hook
  - performance
---

`useDeferredValue` returns a deferred version of a value. React can keep the urgent UI responsive while slower parts render with the delayed value.

```jsx
function SearchResults({ query }) {
  const deferredQuery = useDeferredValue(query)

  return <Results query={deferredQuery} />
}
```

It is useful when a changing value drives expensive rendering, such as filtering a large list. For network requests, a data library like [[tanstack-query|TanStack Query]] is usually a better tool.

## How it works

On the first render, `deferredQuery` equals `query`. When `query` changes from an urgent update (typing), React first re-renders with the *old* `deferredQuery` — so anything depending only on the urgent value (the input itself) updates immediately — then, in the background, renders again with the new `deferredQuery`. It's the same underlying mechanism as [[use-transition|`useTransition`]], but applied to a *value* you receive rather than a `setState` call you make — useful when the state update itself happens elsewhere (a parent component, or props you don't control).

## When to use

Reach for `useDeferredValue` when you receive a value (often via props) that drives expensive rendering, and you don't own the `setState` call that changes it — if you did own it, `useTransition` would be the more direct tool. The canonical case is a search input owned by a parent, with a results list that's expensive to re-render on every keystroke.

## Trade-offs

`useDeferredValue` requires no changes to where the state lives — it works purely on the consuming side. But it only helps if the component receiving the deferred value is wrapped in [[react-memo|`React.memo`]]: without that, the component re-renders on *both* the urgent pass (with the stale deferred value) and the background pass (with the new one), which is strictly more renders than not using it at all, with the "deferred" value providing no benefit.

## Pitfalls

The combination people miss is `useDeferredValue` + `React.memo` — used alone, `useDeferredValue` adds an extra render rather than skipping one. Like `useTransition`, it's also not a debounce: on a fast render path, the deferred value can catch up to the real value almost immediately, so it shouldn't be relied on to coalesce a burst of updates into one.
