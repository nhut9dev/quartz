---
title: Object.freeze
description: Make an object shallowly immutable so its properties can't be changed.
tags:
  - javascript
  - object
  - immutability
---

`Object.freeze` locks an object so its existing properties can't be reassigned, and no properties can be added or removed. In non-strict code the writes simply fail silently; in strict mode they throw a `TypeError`.

```js
const config = Object.freeze({ port: 3000 })

config.port = 8080 // ignored (or throws in strict mode)
config.port // 3000
```

The freeze is *shallow*: nested objects are still mutable, because only the top level is sealed. To lock deeper you'd freeze each nested object too.

```js
const state = Object.freeze({ user: { name: "Nhut" } })
state.user.name = "An" // still changes
```

Unlike an [[immutable-operation|immutable operation]], which returns a new value and leaves the source alone, `Object.freeze` enforces immutability *in place*. Use it to protect constants or configuration from accidental mutation. Check with `Object.isFrozen`.
