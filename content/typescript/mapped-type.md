---
title: Mapped type
description: A type that builds a new type by transforming each key of another type.
tags:
  - typescript
  - type
---

A **mapped type** iterates over the keys of an existing type and produces a new property for each one, using the `{ [K in keyof T]: ... }` form. It pairs naturally with [[keyof|keyof]] to walk every member of an object type.

```ts
type Optional<T> = { [K in keyof T]?: T[K] }

type User = { id: string; name: string }
type PartialUser = Optional<User> // { id?: string; name?: string }
```

## Modifiers and key remapping

You can add or strip the `?` and `readonly` modifiers — `-?` removes optionality, `-readonly` removes immutability. With an `as` clause you can rename keys or drop them entirely by mapping a key to `never`.

```ts
type Getters<T> = {
  [K in keyof T as `get${Capitalize<string & K>}`]: () => T[K]
}
```

## Building utility types

Most built-in [[utility-types|utility types]] are mapped types underneath: `Partial`, `Required`, `Readonly`, `Pick`, and `Record` are all a `[K in ...]` loop with modifiers. A mapped type that keys directly over `keyof T` is *homomorphic* — it automatically preserves the original's modifiers and works through arrays and tuples.

## Pitfalls

Remapping keys to `never` to filter them is a real technique but easy to misread; comment the intent. And key remapping with [[template-literal-type|template literal types]] is powerful but can explode type-check time on large objects — keep transformations shallow when you can.
