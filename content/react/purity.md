---
title: Purity
description: A component returning the same JSX for the same props and state, with no side effects during render.
tags:
  - react
  - rendering
---

**Purity** means a component renders predictably: given the same [[props|props]] and [[state|state]], it returns the same JSX and causes no [[side-effect|side effects]] during render.

## Why React requires it

Purity is the contract React's whole model rests on. Because rendering is a side-effect-free calculation, React can call a component again on any [[re-render|re-render]] without surprises, skip work safely with [[react-memo|memoization]], and — under [[concurrent-rendering|concurrent rendering]] — pause, restart, or throw away a render in progress. None of that is safe if rendering changes the world.

## Pitfalls

Purity breaks when render does more than compute output: mutating a prop or existing state object in place, writing to a module-level or shared variable, generating a random id or reading `Date.now()` mid-render, or performing I/O. These make the result depend on timing and call count — exactly what React assumes it can vary. [[react/strict-mode|Strict Mode]] surfaces them by intentionally double-invoking components in development; a component that misbehaves on the second call was never pure.

Keep render a calculation. Anything that touches the outside world belongs in [[use-effect|an effect]] or an [[react-event-handler|event handler]].
