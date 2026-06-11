---
title: Object
description: A keyed collection of values, used to model structured data.
tags:
  - javascript
  - object
---

An **object** stores values behind property keys. Most everyday JavaScript data is object-shaped: users, settings, API responses, options, and instances created from a [[class|class]].

```js
const user = {
  id: 1,
  name: "Nhut",
  active: true,
}

user.name // "Nhut"
user["active"] // true
```

Dot access is best when the property name is known and is a valid identifier. Bracket access is useful when the key comes from a variable or contains characters dot syntax cannot express.

```js
const field = "name"

user[field] // "Nhut"
```

Objects are reference values. Assigning an object to another variable copies the reference, not the object itself, so both variables can point at the same underlying data. That is why immutable updates often use object spread to create a fresh object.
