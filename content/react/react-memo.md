---
title: React.memo
description: A helper that skips re-rendering a component when its props are unchanged.
tags:
  - react
  - performance
---

`React.memo` wraps a component and lets React skip rendering it when its [[props|props]] are the same as the previous render.

```jsx
const UserRow = React.memo(function UserRow({ user }) {
  return <li>{user.name}</li>
})
```

## How it works

By default a component [[re-render|re-renders]] whenever its parent does. `React.memo` adds a gate: before re-rendering, React shallowly compares each prop with its previous value using `Object.is`. If they all match, it skips both this component's render and its subtree's. It changes *when* a component renders, nothing about the output.

## When it's worth it

It pays off for a component that is genuinely expensive to render, receives the same props most of the time, and re-renders often because of an unrelated parent. A cheap leaf component gains nothing — the comparison can cost as much as just rendering it.

## Pitfalls

Shallow comparison means a new object, array, or function prop created inline in the parent looks different every render, so the memo never skips — stabilize those with [[use-memo|useMemo]] or [[use-callback|useCallback]] first, or the wrapper is dead weight. A `children` prop is a fresh element each render and defeats it too. Most of all, don't memo by reflex: it adds comparison cost and clutter. [[react-profiler|Measure]] first, and remember that [[context-performance|splitting a context]] or moving state down often beats memoization.
