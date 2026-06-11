---
title: Type coercion
description: JavaScript automatically converting a value from one type to another.
tags:
  - javascript
  - basics
  - type
---

**Type coercion** happens when JavaScript automatically converts a value from one type to another. It appears in conditions, arithmetic, string concatenation, and loose equality.

```js
"5" + 1 // "51" — + prefers strings
"5" - 1 // 4   — - is numeric only
Boolean("") // false
```

## How it works

Operators apply conversion rules to their operands. The `+` operator is special: if either side is a string it concatenates, otherwise it adds numerically — which is why `"5" + 1` and `"5" - 1` disagree. Other arithmetic operators always convert to number. Objects are first reduced to a primitive (via `valueOf`/`toString`) before these rules apply, which produces the famously weird `[] + {}`.

## == vs ===

Loose equality `==` coerces the two sides toward a common type before comparing; strict equality `===` does not, so types must already match.

```js
1 == "1"     // true  — string coerced to number
0 == false   // true  — boolean coerced to number
null == undefined // true (special case)
1 === "1"    // false — no coercion
```

## Pitfalls

The `==` rules are subtle enough to hide bugs: `null == 0` is `false` yet `null >= 0` is `true`, and `[] == ![]` is `true`. Prefer [[strict-equality|strict equality]] in application code and convert explicitly (`Number(x)`, `String(x)`) when you do want a type change. The one place coercion is genuinely convenient is [[truthy-falsy|truthy and falsy]] checks in an `if`.
