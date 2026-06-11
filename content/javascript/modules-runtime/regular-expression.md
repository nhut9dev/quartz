---
title: Regular expression
description: A pattern for matching and manipulating text.
tags:
  - javascript
  - string
---

A **regular expression** describes a text pattern, written as a `/.../` literal or built with `new RegExp()`. You use it to test for a match, extract substrings, or replace parts of a string.

```js
const pattern = /\d+/g

"a1 b22".match(pattern) // ["1", "22"]
pattern.test("abc") // false
"a1 b22".replace(/\d+/g, "#") // "a# b#"
```

Flags after the closing slash tune behavior: `g` finds every match instead of just the first, and `i` makes matching case-insensitive. Inside the pattern, tokens like `\d` (digit), `\w` (word character), `+` (one or more), and anchors `^`/`$` define what counts as a match.

Reach for a regular expression when a fixed-string check is not expressive enough — for validation, parsing, or search-and-replace.
