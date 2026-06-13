---
title: Signals
description: A fine-grained reactivity primitive that notifies only what reads it.
tags:
  - frameworks
  - reactivity
---

**Signals** are a fine-grained reactivity primitive — a value container that tracks who reads it, so updating the value notifies exactly those readers, without a parent re-render or virtual DOM diff.

## How it works

A signal is a getter/setter pair (or a `.value` accessor) wrapping a value. When code reads a signal inside a "reactive scope" — a [[solidjs|Solid]] component's JSX expression, a Vue `computed`, a Preact Signals-bound JSX prop — that scope subscribes to the signal. Writing to the signal notifies only its subscribers, which re-run just enough to update the affected DOM node or recompute a dependent value, not the surrounding component.

## When to use

Signals fit state that changes frequently and independently of a component's overall structure — a counter, a form field's value, a derived total — where re-rendering the whole component on every change would be wasted work. [[solidjs|Solid]] and Svelte 5 runes build their entire reactivity model on signals; Preact Signals and Vue's `ref`/`reactive` add a signals-like primitive on top of a framework that also re-renders components.

## Trade-offs

Signals push reactivity to the value level instead of the component level — updates can skip re-render-and-diff entirely, which is why Solid has no virtual DOM. But fine-grained tracking depends on signals being read inside a tracked context; reading a signal's value outside that context — storing it in a plain variable, destructuring it — silently loses reactivity, producing a UI that doesn't update, with no error.

## Pitfalls

Mixing a signals library into a framework that also re-renders components — Preact Signals in React via `@preact/signals-react` — means two update mechanisms coexist: a signal update can change the DOM directly without a React re-render, which can desync from `useEffect`s or other code that assumes "this only changes when the component re-renders". Across frameworks, the same root mistake recurs in different forms: destructuring a Vue `reactive()` object, reading `props.value` into a local variable in Solid, or storing a signal's current value in a non-reactive variable all break the tracking that makes signals work.
