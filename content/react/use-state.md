---
title: useState
description: A React hook for adding state to a function component.
tags:
  - react
  - hook
  - state
---

`useState` is the React [[hook|hook]] for adding [[state|state]] to a function component. It returns the current value and a setter function.

```jsx
import { useState } from "react"

function Counter() {
  const [count, setCount] = useState(0)

  return (
    <button onClick={() => setCount(count + 1)}>
      {count}
    </button>
  )
}
```

Calling the setter does not mutate the existing value directly. It asks React to store the next value and render again.

When the next state depends on the previous state, use the functional form.

```jsx
setCount(current => current + 1)
```
