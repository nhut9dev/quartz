---
title: structuredClone
description: A built-in for deep-copying objects, including nested and complex values.
tags:
  - javascript
  - object
---

`structuredClone` is a built-in that returns a deep copy of a value, recursing through nested objects and arrays so the copy shares no references with the original. Unlike the common `JSON.parse(JSON.stringify(x))` trick, it preserves richer types.

```js
const original = { date: new Date(), tags: new Set(["a"]) }

const copy = structuredClone(original)

copy.tags.add("b")
original.tags // Set { "a" } — untouched
```

It handles `Map`, `Set`, `Date`, typed arrays, and even circular references, all of which a JSON round-trip would lose or break.

There are limits: it cannot clone functions, DOM nodes, or class prototypes, and throws a `DataCloneError` if it meets one. The result is a plain structural copy, not an instance of your class.

Use it when you need a true deep copy of plain data without pulling in a library.
