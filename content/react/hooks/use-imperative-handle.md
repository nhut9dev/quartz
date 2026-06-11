---
title: useImperativeHandle
description: A React hook for customizing the ref value a component exposes to its parent.
tags:
  - react
  - hook
---

`useImperativeHandle` lets a component customize the value its [[use-ref|ref]] exposes to a parent. Instead of handing back the raw DOM node, you return an object with just the methods the parent should be able to call.

Pair it with [[forward-ref|forwardRef]] so the parent's ref reaches your component.

```jsx
const Input = forwardRef(function Input(props, ref) {
  const inputRef = useRef(null)
  useImperativeHandle(ref, () => ({
    focus: () => inputRef.current.focus(),
  }))
  return <input ref={inputRef} {...props} />
})
```

Use it when a parent needs a narrow imperative API, like `focus()` or `scrollTo()`, rather than full access to the DOM node.
