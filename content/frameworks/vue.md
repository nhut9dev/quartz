---
title: Vue
description: A template-based framework with automatic, fine-grained reactivity.
tags:
  - frameworks
  - vue
---

**Vue** uses a template-based, reactive component model — component state is reactive by default, and the framework automatically tracks which parts of the render depend on which state, in contrast to React's explicit re-render-on-`setState` model.

## How it works

Vue wraps reactive state (`ref`, `reactive`) in Proxies that track property access during rendering and re-run only the parts of the render that depend on a value when it changes — this is **fine-grained reactivity**: changing one property updates only the DOM bindings that read it, without a full component re-render and diff like React's. Templates compile ahead of time into render functions, and the compiler can statically separate dynamic parts of a template from static ones, skipping diffing on the static parts entirely.

## When to use

Vue fits teams that want template-based components — closer to traditional HTML/CSS authoring — with routing, state management (Pinia), and forms built into the core ecosystem rather than assembled from separate libraries as in a typical React app. Its automatic dependency tracking removes the need to think about `useMemo`/`useCallback` for most cases.

## Trade-offs

Automatic dependency tracking removes a class of manual optimization React requires — but reactivity comes with its own rules: a reactive object's properties must be accessed through the Proxy, so destructuring a `reactive()` object loses reactivity on its fields. The system is also more implicit — what re-renders on a state change isn't always obvious from reading a component, where React's explicit `setState` is more predictable to trace even though it requires more manual optimization.

## Pitfalls

Destructuring values out of a `reactive()` object breaks reactivity for those values — they become disconnected plain copies. `ref()` values need `.value` to read or write in script code (but not in templates, where Vue unwraps them automatically), a frequent source of "why isn't this updating" confusion for newcomers. Vue's automatic dependency tracking also means a computed property or watcher that conditionally accesses different reactive values across calls can end up with a dependency list that changes between runs — if tracking misses a branch, that branch's changes won't trigger updates.
