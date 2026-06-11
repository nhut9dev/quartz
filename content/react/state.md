---
title: State
description: Data owned by a component that can change over time.
tags:
  - react
  - state
---

**State** is data a component owns that can change over time. When state changes, React schedules a [[re-render|re-render]] so the UI can reflect the new value.

```jsx
function Counter() {
  const [count, setCount] = useState(0)

  return <button>{count}</button>
}
```

State should represent data that affects what the user sees. If a value can be calculated from [[props|props]] or existing state during render, it is usually derived data, not separate state.

Keep state as local as possible. Move it up only when multiple components need to read or change the same value.
