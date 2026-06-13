---
title: Reducer pattern
description: Managing state transitions with explicit actions and a reducer function.
tags:
  - react
  - state
---

The **reducer pattern** manages state transitions with explicit actions and a reducer function.

In React, `useReducer` is useful when state has multiple related fields, transitions are easier to name than direct setters, or updates depend on previous state.

Reducers make state changes easier to test because the transition is a pure function from previous state and action to next state.

The pattern pairs well with [[use-reducer|useReducer]], [[../typescript/discriminated-union|discriminated unions]], and [[../typescript/exhaustive-checking|exhaustive checking]].

## How it works

A reducer is a pure function `(state, action) => newState` — it never mutates `state` in place, only returns a new value. `dispatch(action)` calls this function with the current state and the action, and React schedules a re-render with the result, using the same bail-out check as [[use-state|`useState`]]: if the reducer returns a value `Object.is`-equal to the current state, React skips re-rendering. This is why returning a *new* object (even with the same field values) when nothing changed still triggers a render, while mutating and returning the same object reference does **not** — React sees "same state" and bails out, even though the data was actually mutated.

## When to use

Reach for a reducer when state updates involve more than one field changing together, when the *next* state depends on the *previous* state in a non-trivial way, or when there's a meaningful set of named operations ("add item", "remove item", "clear") that's clearer to read as actions than as a sequence of `setX`/`setY` calls scattered across handlers. A [[state-machine|state machine]] is a reducer where the action set and valid transitions are deliberately constrained.

## Trade-offs

Centralizing transitions in one reducer function makes them independently testable (call the reducer directly with a state and action, assert the result — no component needed) and makes "what can happen to this state" auditable in one place. The cost is indirection: a simple toggle becomes a `dispatch({ type: "TOGGLE" })` plus a `case` in a switch, versus a one-line `setOpen(o => !o)` — worthwhile once there are several related fields or transitions, overhead for a single independent value.

## Pitfalls

Mutating `state` directly inside the reducer and returning it (`state.items.push(newItem); return state`) returns the *same reference* React already has — the `Object.is` bail-out sees no change and **skips the re-render**, so the UI doesn't update even though the underlying data did. Every branch must return a new object/array (spread, `.map`, `.filter`) even when only one field changes. The other common issue is putting non-serializable values (functions, class instances, promises) into reducer state — it breaks time-travel debugging in DevTools and, for [[state-machine|state machines]], makes the state harder to log, persist, or compare.
