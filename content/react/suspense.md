---
title: Suspense
description: A built-in component that shows fallback UI while its children are not ready yet.
tags:
  - react
  - rendering
---

**Suspense** is a built-in component that shows fallback UI while its children are not ready yet — lazily-loaded code or data — then reveals them once they are.

```jsx
<Suspense fallback={<Spinner />}>
  <Profile />
</Suspense>
```

## How it works

A component "suspends" when something it needs during render isn't available yet (internally, by throwing a promise). React walks up to the nearest Suspense boundary and renders its `fallback` instead of the half-finished tree. When the promise resolves, React retries the subtree and swaps in the real children. You declare the loading state once at the boundary instead of threading `isLoading` flags through every component.

## When to use it

Suspense covers [[react-lazy|React.lazy]] code splits (the boundary wraps the dynamic import), data reads via `useSuspenseQuery` or `await` inside a [[server-component-boundary|server component]], and server [[streaming|streaming]], where the shell ships first and sections stream in as their data resolves.

## Pitfalls

Boundary placement is the real design work: one boundary at the top gives a whole-page spinner, one per widget gives a "popcorn" of staggered loaders — put boundaries where a coherent chunk of UI can appear together. Suspense is for data a component reads while rendering, not for imperative async like a button's save handler; use a [[use-transition|transition]] or local state there. Always pair it with an [[error-boundary|error boundary]], since suspending handles *pending* but not *failed*. And a component that only starts fetching once it renders creates waterfalls — start requests as early as possible.
