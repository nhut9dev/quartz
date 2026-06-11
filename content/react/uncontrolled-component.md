---
title: Uncontrolled component
description: A form input that keeps its own value in the DOM, read with a ref when you need it.
tags:
  - react
  - form
---

An **uncontrolled component** is a form input that keeps its own value in the DOM, which you read with a [[use-ref|ref]] when you need it — typically on submit — instead of storing it in React [[state|state]].

```jsx
function NameForm() {
  const input = useRef(null)
  function handleSubmit(e) {
    e.preventDefault()
    console.log(input.current.value)
  }
  return (
    <form onSubmit={handleSubmit}>
      <input ref={input} defaultValue="Ana" />
    </form>
  )
}
```

The DOM holds the value; React just reads it at the moment it matters. That is less code than a [[controlled-component|controlled component]], since there is no `value`/`onChange` pair on every keystroke.

The tradeoff is that you cannot easily validate or transform input live, because React does not track each change. Use uncontrolled inputs for simple [[form-submit|submit]]-and-read forms, and reach for controlled ones when you need reactive logic per character.
