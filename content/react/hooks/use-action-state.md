---
title: useActionState
description: A React hook for managing state produced by a form action, including pending status.
tags:
  - react
  - hook
---

`useActionState` manages the state returned by a form action and tracks whether that action is pending. You pass an action function and an initial state, and get back the latest state, a wrapped action to attach to a form, and an `isPending` flag.

```jsx
function Signup() {
  const [error, submitAction, isPending] = useActionState(
    async (prev, formData) => {
      const res = await signup(formData)
      return res.error ?? null
    },
    null,
  )

  return (
    <form action={submitAction}>
      <button disabled={isPending}>Sign up</button>
      {error && <p>{error}</p>}
    </form>
  )
}
```

It builds on [[form-submit|form submit]] with actions. Use it when a form's result and pending state should drive the UI.
