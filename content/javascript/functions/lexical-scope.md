---
title: Lexical scope
description: Variable access determined by where code is written, not where it is called.
tags:
  - javascript
  - function
  - scope
---

**Lexical scope** (sometimes *static scope*) means that what a variable can see is decided by **where it is written** in the source code, not by where the function is later called from. You can work out a variable's reach just by reading the file — the structure on the page *is* the rule.

```js
const outer = "A"

function parent() {
  const middle = "B"

  function child() {
    console.log(outer, middle) // "A B"
  }

  child()
}
```

`child` can read `middle` and `outer` because it is physically nested inside them. When JavaScript looks up a name, it searches the current scope and then walks **outward** through each enclosing scope until it finds a match or throws a `ReferenceError`. This outward chain is what makes [[closure|closures]] possible, and it is why JavaScript never uses *dynamic* scope, where the answer would instead depend on the call site.
