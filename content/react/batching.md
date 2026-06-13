---
title: Batching
description: React groups multiple state updates in the same event into a single re-render.
tags:
  - react
  - rendering
  - performance
---

**Batching** is how React groups multiple [[state|state]] updates that happen in the same event into a single [[re-render|re-render]], instead of rendering once per update.

```jsx
function handleClick() {
  setCount(c => c + 1)
  setName("Ana")
  // one re-render, not two
}
```

This is faster — fewer renders and DOM passes — and it avoids inconsistent intermediate UI where the screen briefly reflects only half the new state.

Before React 18, only updates inside React event handlers were batched; updates inside promises, `setTimeout`, or native callbacks each triggered their own render. React 18+ batches automatically in all of these cases.

Because updates are batched, calling a [[use-state|setter]] does not change the value immediately. Read the next value from the updater function argument rather than expecting the variable to update mid-event.

## How it works

React doesn't apply a state update the moment you call the setter — it queues the new value and marks the component for [[re-render|re-render]]. As long as React is still inside a unit of work it controls (an event handler, or in React 18+ any update scheduled via `createRoot`), it keeps collecting these queued updates and processes them together in one pass: re-render once, then commit once to the real DOM. Multiple `setState` calls to the *same* state variable in one batch don't each apply in sequence either — if you pass a value directly (`setCount(count + 1)` twice), both read the same stale `count` and the second overwrites the first; the updater-function form (`setCount(c => c + 1)`) avoids this because each updater receives the result of the previous one.

## When to use

Batching is automatic — there's nothing to opt into. What you sometimes need is the *opposite*: `flushSync` from `react-dom` forces React to apply an update and flush the DOM synchronously before continuing, which is occasionally needed when you must measure the DOM (`getBoundingClientRect`) immediately after a state-driven change, before the browser paints.

## Trade-offs

Batching trades immediate synchronous feedback for fewer renders and a UI that never shows a half-updated intermediate state — without it, `setCount` and `setName` in the same handler would each trigger their own render, briefly showing the count updated but not the name. The cost is that code which assumes "state changes the instant I call the setter" (a common assumption carried over from plain variable assignment) breaks; you must read the *next* value from the updater argument or from the next render, not from the enclosing scope.

## Pitfalls

Reaching for `flushSync` to "fix" a value that seems stale is usually treating a symptom — the real fix is almost always to derive the value you need from the updater function or an effect, not to force a synchronous flush, which defeats batching's performance benefit and can cause extra layout thrashing if called repeatedly. Code written for React 17 and earlier — where updates inside `setTimeout`, native DOM event listeners, or promise callbacks were *not* batched — may have relied on each `setState` there causing its own render; in React 18 these now batch too, which is usually an improvement but can surface bugs in code that depended on the old per-call render timing.
