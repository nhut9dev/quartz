---
title: useOptimistic
description: A React hook for showing an optimistic UI state while an async action is pending.
tags:
  - react
  - hook
---

`useOptimistic` lets you render an optimistic value immediately while an async action is still pending, then reconciles to the real state once it settles. You give it the current state and a function that derives the optimistic version.

```jsx
function Thread({ messages, sendMessage }) {
  const [optimistic, addOptimistic] = useOptimistic(
    messages,
    (state, text) => [...state, { text, pending: true }],
  )

  async function action(formData) {
    addOptimistic(formData.get("text"))
    await sendMessage(formData)
  }

  return <form action={action}>...</form>
}
```

It pairs naturally with [[use-action-state|useActionState]] and form actions. Use it when you want the UI to react instantly instead of waiting on the server.
