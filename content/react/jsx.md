---
title: JSX
description: A JavaScript syntax extension for describing React UI.
tags:
  - react
  - jsx
---

**JSX** is the syntax React uses to describe UI inside JavaScript. It looks like HTML, but it is compiled into JavaScript function calls.

```jsx
const name = "Nhut"

const element = <h1>Hello, {name}</h1>
```

Curly braces let JSX use any JavaScript [[expression|expression]]. Attribute names follow JavaScript conventions, so HTML `class` becomes `className`, and `for` becomes `htmlFor`.

```jsx
function Field() {
  return (
    <label htmlFor="email" className="field">
      Email
    </label>
  )
}
```

JSX must return one root value. Use a fragment when you need to return siblings without adding an extra DOM element.
