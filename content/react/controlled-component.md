---
title: Controlled component
description: A form element whose value is driven by React state.
tags:
  - react
  - form
  - state
---

A **controlled component** is a form element whose value comes from React [[state|state]]. The input displays the state value, and `onChange` updates that state.

```jsx
function NameField() {
  const [name, setName] = useState("")

  return (
    <input
      value={name}
      onChange={event => setName(event.target.value)}
    />
  )
}
```

Controlled inputs make form data easy to validate, reset, submit, and combine with other UI state.

The tradeoff is more code: every controlled field needs state and an event handler. For simple one-off fields, uncontrolled inputs with [[use-ref|useRef]] can be enough.
