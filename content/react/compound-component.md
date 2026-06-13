---
title: Compound component
description: Related components that share implicit state through React context.
tags:
  - react
  - pattern
  - architecture
---

A **compound component** is a set of related components that work together and share state implicitly through [[react-context|React context]], rather than through explicitly passed [[props|props]]. The parent holds the state and children read it from context, giving a clean, declarative API.

```jsx
<Tabs defaultValue="a">
  <Tabs.List>
    <Tabs.Tab value="a">First</Tabs.Tab>
    <Tabs.Tab value="b">Second</Tabs.Tab>
  </Tabs.List>
  <Tabs.Panel value="a">...</Tabs.Panel>
</Tabs>
```

This relies on [[component-composition|composition]]: the parent stays flexible about what children appear and in what order. Use it when several pieces must coordinate, like tabs, accordions, or menus, without making callers wire up every prop by hand.

## How it works

The parent (`Tabs`) creates a [[react-context|context]] and renders a `Provider` around its children, holding the shared state (which tab is active) and the functions to change it. The sub-components (`Tabs.List`, `Tabs.Tab`, `Tabs.Panel`) are attached as static properties of the parent function and each calls `useContext` internally to read that state — `Tabs.Tab` knows whether it's the active tab without `Tabs` ever passing it an `isActive` prop. The "compound" part is purely an API convention (attaching them as `Tabs.X`); the actual sharing mechanism is the same context any component could use.

## When to use

Use it for widget families with one piece of shared state and several interchangeable, reorderable children: tabs, accordions, selects, menus, multi-part form fields. It's the right call when callers should be free to reorder, omit, or wrap individual pieces (`<Tabs.Panel>` doesn't have to be a direct child of `<Tabs>` — it just needs to render *somewhere* inside the provider) without the parent needing to know about each child explicitly.

## Trade-offs

Compared to a single component with a big config-object prop, compound components give callers a flexible, JSX-native API — arbitrary ordering, conditional rendering of pieces, wrapping sub-components in their own markup. The cost is that the relationship between parent and children becomes *implicit*: `<Tabs.Tab>` only works inside `<Tabs>`, but nothing in the JSX itself signals that dependency, and TypeScript alone won't catch a misplaced sub-component without extra context-typing work.

## Pitfalls

Rendering a sub-component outside its parent's provider — `<Tabs.Tab>` used without a wrapping `<Tabs>` — means `useContext` returns the context's default value (often `undefined`), which either throws a confusing error deep inside the sub-component or silently no-ops depending on how carefully the context was set up. A well-built compound component throws a clear, named error ("`Tabs.Tab` must be used within `Tabs`") from a custom hook wrapping `useContext`, rather than letting `undefined.something` fail with a generic TypeError. Context lookups follow the *render tree*, not the JSX tree, so a sub-component rendered through a portal that escapes the provider's subtree loses access to the shared state even though it looks correctly nested in the source.
