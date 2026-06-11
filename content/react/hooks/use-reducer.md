---
title: useReducer
description: A React hook for state updates organized around actions and a reducer function.
tags:
  - react
  - hook
  - state
---

`useReducer` manages [[state|state]] with a reducer function. It is useful when updates have several named actions or when the next state depends on structured rules.

```jsx
function reducer(state, action) {
  switch (action.type) {
    case "increment":
      return { count: state.count + 1 }
    case "reset":
      return { count: 0 }
    default:
      return state
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, { count: 0 })

  return <button onClick={() => dispatch({ type: "increment" })}>{state.count}</button>
}
```

Use [[use-state|useState]] for simple local state. Use `useReducer` when state transitions deserve names, validation, or central rules.
