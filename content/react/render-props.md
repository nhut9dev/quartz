---
title: Render props
description: Sharing logic through a prop that is a function returning UI.
tags:
  - react
  - pattern
  - architecture
---

**Render props** is a pattern where a component takes a [[props|prop]], often the [[children-prop|children]], that is a function returning UI. The component owns some logic or state and calls that function with the values, letting the caller decide what to render.

```jsx
function MouseTracker({ children }) {
  const [pos, setPos] = useState({ x: 0, y: 0 })
  return (
    <div onMouseMove={(e) => setPos({ x: e.clientX, y: e.clientY })}>
      {children(pos)}
    </div>
  )
}

<MouseTracker>{({ x, y }) => <p>{x}, {y}</p>}</MouseTracker>
```

[[custom-hook|Custom hooks]] now cover most logic sharing with less nesting. Use render props when the shared logic must also control where its consumers render.
