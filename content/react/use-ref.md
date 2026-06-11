---
title: useRef
description: A React hook for storing a mutable value that does not trigger re-render.
tags:
  - react
  - hook
  - ref
---

`useRef` stores a mutable value in `.current`. Updating it does not trigger a [[re-render|re-render]].

```jsx
const countRef = useRef(0)

countRef.current += 1
```

Refs are commonly used to access DOM elements.

```jsx
function SearchBox() {
  const inputRef = useRef(null)

  return (
    <>
      <input ref={inputRef} />
      <button onClick={() => inputRef.current?.focus()}>
        Focus
      </button>
    </>
  )
}
```

Use [[state|state]] for data that affects the screen. Use refs for values that need to persist between renders but should not cause rendering by themselves.
