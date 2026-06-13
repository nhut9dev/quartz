---
title: Proxy and Reflect
description: Intercept object operations with traps, backed by default behaviors.
tags:
  - javascript
  - object
  - metaprogramming
---

A **Proxy** wraps an [[object|object]] and lets you intercept fundamental operations — reading a property, writing one, checking existence — through *traps*. **Reflect** provides the matching default behaviors, so a trap can do its custom work and then defer to the original semantics.

```js
const user = { name: "Nhut" }

const guarded = new Proxy(user, {
  get(target, key, receiver) {
    console.log(`read ${String(key)}`)
    return Reflect.get(target, key, receiver)
  },
})

guarded.name // logs "read name", then "Nhut"
```

## How it works

Every fundamental operation on an object — `get`, `set`, `has`, `deleteProperty`, `ownKeys`, `apply`, `construct`, and more — has a matching trap. When code touches the proxy, the engine calls the trap instead of performing the operation directly; if a trap is omitted, the engine falls back to the default behavior automatically. Inside a trap, `Reflect.<method>(target, ..., receiver)` performs that default behavior on the real target, so a `get` trap can log or validate and still return the value a normal property read would. Passing `receiver` through matters whenever the target has getters/setters or is part of a prototype chain — without it, `this` inside an inherited getter resolves to the wrong object.

## When to use

Proxies are the basis of fine-grained reactivity systems: Vue 3 and MobX/Valtio wrap state objects in a Proxy so a `set` trap can know exactly which property changed and re-run only the dependents that read it, without the manual `getter`/`setter` boilerplate [[private-state|private state]] would need per field. Other common uses are validation (`set` rejects an invalid write before it lands), access control or logging around an API client, and lazily-computed or virtual properties (`get` computes a value only when accessed).

## Trade-offs

Every trapped operation adds a function-call indirection, so hot paths that touch the same object millions of times (tight loops, large data processing) are measurably slower through a Proxy than on a plain object — fine for app state, not for a hot inner loop. Proxies also cannot be polyfilled or transpiled: unlike most ES2015+ syntax, there is no way to express "intercept a property read" in older JavaScript, so supporting very old runtimes rules them out. And a Proxy is not structurally transparent — `JSON.stringify`, `structuredClone`, and `===` identity checks against the original target can behave differently than expected, which is why reactivity libraries usually expose an `unwrap`/`toRaw` escape hatch.

## Pitfalls

The engine enforces *invariants* for non-configurable or non-writable properties — if a trap returns a value that contradicts the target's real descriptor (e.g. `get` returns something different from a non-configurable, non-writable property's actual value), it throws a `TypeError` rather than silently lying. Forgetting `Reflect.get/set(target, key, receiver)` and instead reading/writing `target[key]` directly breaks inherited getters and setters, since `this` inside them becomes `target` instead of the proxy. Finally, debugging tools print proxies as `Proxy(Object) {}`, which can obscure what's actually being read or written — useful to know before assuming a bug is in the wrapped object itself.
