---
title: use
description: A React API for reading a promise or context during render.
tags:
  - react
  - hook
---

`use` reads the value of a resource like a promise or [[react-context|React context]] during render. When you pass it a promise, React suspends until it resolves, integrating with [[suspense|Suspense]] and the nearest [[error-boundary|error boundary]].

Unlike other [[hook|hooks]], `use` can be called conditionally, including inside loops and `if` blocks.

```jsx
import { use } from "react"

function Comments({ commentsPromise }) {
  const comments = use(commentsPromise)
  return comments.map((c) => <p key={c.id}>{c.text}</p>)
}
```

Use it when a component needs to unwrap a promise inside [[suspense|Suspense]] or read context in a branch where [[use-context|useContext]] would not be allowed.
