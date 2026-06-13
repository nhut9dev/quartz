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

## How it works

Every keystroke fires `onChange`, which calls `setName`, which schedules a [[re-render|re-render]]; on that re-render, the `<input>`'s `value` prop is set back to the (now-updated) state — so the DOM input's displayed value is always whatever React's state says it should be, not whatever the browser's native input behavior would have produced on its own. React is the single source of truth; the DOM value is a reflection of it, recomputed every render.

## When to use

Use controlled inputs whenever something needs to react to the value as the user types: live validation, character counters, conditionally enabling a submit button, formatting input (uppercasing, masking), or keeping multiple inputs in sync. If the only thing that matters is the final value at submit time, [[uncontrolled-component|uncontrolled]] is simpler.

## Trade-offs

Controlling an input gives React's render cycle full visibility into the value at every keystroke — necessary for the reactive behaviors above — at the cost of a re-render per keystroke for that component (and anything below it that isn't memoized). For a single field this is unnoticeable; for a form with many controlled fields, or fields driving expensive derived UI, the per-keystroke re-render cost is why libraries like [[forms/react-hook-form|React Hook Form]] keep inputs uncontrolled internally and only surface values on demand.

## Pitfalls

The most common error is **switching a field between controlled and uncontrolled** — React warns "A component is changing an uncontrolled input to be controlled" when `value` goes from `undefined` to a defined value across renders (e.g. `value={user?.name}` before `user` loads is `undefined`, then becomes a string once data arrives). Always initialize the state with `""` or another defined value, never `undefined` or `null`, so the input is controlled from the first render. The other pitfall is passing `value` without `onChange` — React then renders a read-only input and warns, since nothing updates the state the value is bound to.
