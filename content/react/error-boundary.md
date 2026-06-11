---
title: Error boundary
description: A component that catches render errors in its subtree and shows fallback UI instead of crashing.
tags:
  - react
  - error-handling
---

An **error boundary** is a [[react-component|component]] that catches JavaScript errors thrown while rendering its subtree and shows fallback UI instead of crashing the whole app.

```jsx
class Boundary extends React.Component {
  state = { failed: false }
  static getDerivedStateFromError() {
    return { failed: true }
  }
  componentDidCatch(error, info) {
    reportError(error, info)
  }
  render() {
    return this.state.failed ? <p>Something broke.</p> : this.props.children
  }
}
```

## How it works

When a descendant throws during render, React unwinds the subtree and looks for the nearest boundary above it. `getDerivedStateFromError` switches that boundary into its fallback state, and `componentDidCatch` receives the error for logging. There is no hook equivalent yet, so this remains a class component — most teams use the `react-error-boundary` library wrapper instead of writing their own.

## What it does and doesn't catch

It catches errors during rendering, in lifecycle methods, and in constructors *below* it. It does **not** catch errors in event handlers (use `try/catch` there), in async code like `setTimeout` or promise callbacks, during server-side rendering, or thrown by the boundary itself. Those slip past because they don't happen during the render React is tracking.

## Placement and reset

Granularity is a deliberate choice: a single top-level boundary turns any error into a blank page, while boundaries around routes or independent widgets keep the rest of the app alive. To recover, change the boundary's [[react-key|key]] (or call `resetErrorBoundary`) so React remounts the subtree fresh. It pairs naturally with [[suspense|Suspense]] — one handles failures, the other handles loading.
