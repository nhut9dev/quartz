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
