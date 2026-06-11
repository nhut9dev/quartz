---
title: Hook
description: A React function for using stateful React features inside components.
tags:
  - react
  - hook
---

A **hook** is a function that lets a component use React features such as [[state|state]], effects, refs, and memoization. Built-in hooks include [[use-state|useState]], [[use-effect|useEffect]], and [[use-ref|useRef]].

```jsx
import { useState } from "react"

function Counter() {
  const [count, setCount] = useState(0)
  return <button onClick={() => setCount(count + 1)}>{count}</button>
}
```

Hooks must be called at the top level of a React component or another hook. Do not call hooks inside conditions, loops, nested functions, or event handlers.

This rule lets React match hook calls in the same order on every [[re-render|re-render]].
