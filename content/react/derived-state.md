---
title: Derived state
description: A value computed from existing props or state during render rather than stored separately.
tags:
  - react
  - state
---

**Derived state** is a value computed from existing [[props|props]] or [[state|state]] during render, instead of being stored as its own [[use-state|state]] that you must keep in sync.

```jsx
const fullName = `${first} ${last}`
```

If `first` or `last` changes, `fullName` is simply recomputed on the next render — it can never drift out of date. Storing it as separate state would mean updating it in every place the inputs change, and forgetting one spot gives you stale data.

Computing in render avoids that whole class of bugs. When the calculation is genuinely expensive, wrap it in [[use-memo|useMemo]] so it only reruns when its inputs change — but the value still lives in render, not in stored state.

Rule of thumb: if you can calculate it from what you already have, derive it; do not store it.

## How it works

Every render already re-runs the component function from top to bottom, so any expression computed from the current props/state is automatically recomputed with the latest values — there's no separate step needed to "update" it. Storing the same value as its own `useState` creates a *second* source of truth that only changes when something explicitly calls its setter; the two values (the stored one and what it "should" be) can now diverge any time you add a new code path that changes the inputs but forgets to also update the stored copy.

## When to use

Derive by default. Reach for [[use-memo|`useMemo`]] only when the derivation is measurably expensive (sorting/filtering large arrays, heavy formatting) or when the *reference* of the derived value needs to stay stable across renders (e.g. it's passed to a [[react-memo|memoized]] child or used as an effect dependency) — `useMemo` doesn't change the "derive, don't store" rule, it just caches the derivation.

## Trade-offs

Deriving in render means the value is always correct by construction — there's nothing to keep "in sync." The trade-off is that without memoization, the calculation runs on every render of that component, including renders triggered by unrelated state changes — usually fine for cheap expressions, and exactly what `useMemo` is for when it isn't.

## Pitfalls

The most common anti-pattern is "syncing" derived state with `useEffect`: storing a value in `useState` and writing a `useEffect` that recomputes it whenever its inputs change, then calls `setState`. This adds an extra render (the effect runs *after* the render that changed the input, then triggers another render with the derived value), can produce a visible flash of stale derived data, and if the effect's dependencies aren't carefully scoped, can loop. If a value can be computed during render, compute it during render — `useEffect` should be reserved for synchronizing with something *outside* React (see [[side-effect|side effects]]), not for keeping React state in sync with other React state.
