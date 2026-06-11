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

Common traps are `get`, `set`, `has`, and `deleteProperty`. Pairing each with the corresponding `Reflect` method keeps default behavior correct, including the `receiver` for getters.

Proxies power real patterns: reactivity systems that re-render when state changes, validation that rejects bad writes in `set`, and logging or access control around objects.

Use a Proxy when you need to observe or customize how an object is accessed, transparently.
