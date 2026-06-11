---
title: Zustand
description: A small React state management library based on external stores and hooks.
tags:
  - react
  - state
  - library
---

**Zustand** is a small state management library for shared client state. You create a store, then components read slices of it with a hook.

```jsx
import { create } from "zustand"

const useCounterStore = create(set => ({
  count: 0,
  increment: () => set(state => ({ count: state.count + 1 })),
}))

function Counter() {
  const count = useCounterStore(state => state.count)
  const increment = useCounterStore(state => state.increment)

  return <button onClick={increment}>{count}</button>
}
```

Use Zustand for client state shared across distant components: UI preferences, auth UI state, selected workspace, modal state, or editor state. Use [[../data-fetching/tanstack-query|TanStack Query]] for server state from APIs.
