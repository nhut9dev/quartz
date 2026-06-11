---
title: State machine
description: Modeling UI as explicit states and allowed transitions instead of scattered booleans.
tags:
  - react
  - state
  - pattern
---

A **state machine** models a component as a finite set of named states with explicit rules for moving between them, instead of a handful of independent boolean flags.

The flag approach drifts into bugs: `isLoading`, `isError`, and `isSuccess` allow combinations that should never exist, like loading *and* error at once. A state machine says the component is in exactly one of `idle | loading | success | error`, and only certain transitions are legal — `idle → loading`, `loading → success`, `loading → error`. Impossible states become unrepresentable.

[[use-reducer|useReducer]] is already a lightweight state machine: the reducer is the transition function, and the action is the event. For richer flows — multi-step wizards, checkout, media players — XState adds guards, entry/exit actions, nested states, and a visualizer.

```js
function reducer(state, event) {
  switch (state.status) {
    case "idle":    return event.type === "FETCH" ? { status: "loading" } : state
    case "loading": return event.type === "RESOLVE" ? { status: "success", data: event.data } : state
    // unhandled events are ignored, not silently corrupting state
  }
}
```

It shines when a UI has several modes and transitions that must not interleave. For a single toggle it is overkill — a plain [[derived-state|derived value]] is enough.
