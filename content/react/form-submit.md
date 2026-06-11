---
title: Form submit
description: Handling a form submission in React without a page reload.
tags:
  - react
  - form
  - event
---

A **form submit** in React uses the normal browser submit event. In client-side forms, call `event.preventDefault()` to stop the browser from reloading the page.

```jsx
function LoginForm() {
  function handleSubmit(event) {
    event.preventDefault()
    const form = new FormData(event.currentTarget)
    console.log(form.get("email"))
  }

  return (
    <form onSubmit={handleSubmit}>
      <input name="email" />
      <button type="submit">Log in</button>
    </form>
  )
}
```

Use `onSubmit` on the form instead of only using `onClick` on the button. That keeps keyboard submit, Enter key behavior, and browser form semantics working.
