---
title: Custom hook
description: A reusable function that composes React hooks.
tags:
  - react
  - hook
---

A **custom hook** is a function that uses React hooks and packages reusable stateful logic. Its name must start with `use`.

```jsx
function useToggle(initialValue = false) {
  const [value, setValue] = useState(initialValue)

  function toggle() {
    setValue(current => !current)
  }

  return [value, toggle]
}
```

Custom hooks do not share state automatically. Each component that calls the hook gets its own independent hook state.

Use a custom hook when behavior is repeated across components: media queries, local storage, form fields, async state, subscriptions, or keyboard shortcuts.
