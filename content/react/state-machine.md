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

## When to use

Reach for an explicit state machine when a component has **more than two or three booleans that interact** — the moment you find yourself asking "can `isLoading` and `isError` both be true, and what should render if they are?", that's the signal. Multi-step flows (checkout, onboarding wizards), anything with retry/cancel semantics, and async request states (`idle | loading | success | error`) are the canonical cases.

## Trade-offs

A `useReducer`-based state machine costs little beyond what a reducer already costs — it's the same hook, just with a `status` field and a `switch` that only handles valid transitions. Reaching for XState adds a real dependency and a new mental model (states, events, guards, actions, often a separate config object), which pays off once a flow has enough states and transitions that a hand-written reducer's `switch` statement becomes hard to verify by reading — but for 3-4 states, XState's ceremony can exceed the reducer it replaces.

## Pitfalls

The inverse mistake is modeling something as a state machine that's really just a derived value — a single `isOpen` boolean doesn't need `status: "open" | "closed"` plus a transition table; that's ceremony without payoff, see [[derived-state|derived state]]. The other common issue is an *incomplete* transition table: if the reducer's `switch` doesn't have a `default` case (or silently returns `state` for unhandled actions, as shown above), an action dispatched from a state that doesn't expect it is silently dropped — which can look like "the button did nothing" with no error, rather than failing loudly during development.
