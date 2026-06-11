---
title: Batching
description: React groups multiple state updates in the same event into a single re-render.
tags:
  - react
  - rendering
  - performance
---

**Batching** is how React groups multiple [[state|state]] updates that happen in the same event into a single [[re-render|re-render]], instead of rendering once per update.

```jsx
function handleClick() {
  setCount(c => c + 1)
  setName("Ana")
  // one re-render, not two
}
```

This is faster — fewer renders and DOM passes — and it avoids inconsistent intermediate UI where the screen briefly reflects only half the new state.

Before React 18, only updates inside React event handlers were batched; updates inside promises, `setTimeout`, or native callbacks each triggered their own render. React 18+ batches automatically in all of these cases.

Because updates are batched, calling a [[use-state|setter]] does not change the value immediately. Read the next value from the updater function argument rather than expecting the variable to update mid-event.
