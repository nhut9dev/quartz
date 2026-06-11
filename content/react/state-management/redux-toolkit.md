---
title: Redux Toolkit
description: The standard modern way to write Redux state management.
tags:
  - react
  - state
  - library
---

**Redux Toolkit** is the modern recommended way to write Redux. It is useful when an app needs explicit, centralized state transitions, devtools, middleware, and predictable update rules.

```js
const counterSlice = createSlice({
  name: "counter",
  initialState: { value: 0 },
  reducers: {
    increment(state) {
      state.value += 1
    },
  },
})
```

Redux Toolkit is heavier than [[zustand|Zustand]], but it can be a good fit for large apps with many coordinated state transitions and strict debugging needs.

Do not use Redux for server cache by default. A server-state tool like [[../data-fetching/tanstack-query|TanStack Query]] usually fits API data better.
