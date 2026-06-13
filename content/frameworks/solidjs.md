---
title: Solid
description: A JSX framework with fine-grained reactivity and no virtual DOM or re-renders.
tags:
  - frameworks
  - solidjs
---

**Solid** looks like React — JSX, component functions — but compiles to fine-grained reactive updates with no virtual DOM and no component re-renders. A component function runs once; only the specific reactive expressions inside it re-run when their dependencies change.

## How it works

`createSignal()` returns a getter/setter pair. Reading the getter inside a JSX expression registers that expression as a dependent of the signal. When the signal updates, only that specific DOM-bound expression re-runs — not the whole component function. This is the core difference from React: calling `setState` in React re-runs the entire component function, then diffs the result; in Solid, the component function runs once at mount, and state updates surgically update only the DOM nodes that depend on them.

## When to use

Solid fits teams that want React's JSX authoring experience without React's re-render model — useful when the render cost of large component trees is a concern, since there's no re-render to optimize away with `memo` or `useCallback`. Its ecosystem is smaller than React's, so expect more "build it yourself" for things React has multiple mature libraries for.

## Trade-offs

Because components run once, patterns that rely on a component function re-running on every render — closures capturing "the current value of a prop", the way React effects often do — work differently in Solid. Reading `props.value` inside a callback always reads the live, current value (no stale-closure problem), but code that assumes "this function body runs again with fresh values" needs rethinking.

## Pitfalls

Destructuring props (`const { value } = props`) breaks reactivity in Solid the same way destructuring a Vue `reactive()` object does — `props.value` is reactive, but a destructured `value` is a snapshot taken once at destructure time. Conditionally rendering JSX with a plain `if` statement (rather than Solid's `<Show>` component) can break fine-grained tracking, since the compiler can't statically determine the reactive boundary the way it can with `<Show when={...}>`.
