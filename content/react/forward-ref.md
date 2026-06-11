---
title: forwardRef
description: Passing a ref through a component to a child DOM node or imperative handle.
tags:
  - react
  - component
  - ref
---

**forwardRef** wraps a component so a [[use-ref|ref]] passed by its parent reaches a child element inside it. Components do not receive `ref` as an ordinary prop by default, so without it the parent's ref would have nowhere to attach.

```jsx
const TextInput = forwardRef(function TextInput(props, ref) {
  return <input ref={ref} {...props} />
})
```

Combine it with [[use-imperative-handle|useImperativeHandle]] to expose a custom handle instead of the raw DOM node.

In React 19 you can also accept `ref` as a regular prop on function components, making `forwardRef` largely unnecessary for new code. Use it when supporting older React or when a parent needs to reach a child's DOM node.
