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
