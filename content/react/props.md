---
title: Props
description: Inputs passed from a parent component to a child component.
tags:
  - react
  - component
---

**Props** are inputs passed from a parent [[react-component|component]] to a child component. They let the same component render different data.

```jsx
function Greeting({ name }) {
  return <h1>Hello, {name}</h1>
}

function App() {
  return <Greeting name="Nhut" />
}
```

Props are read-only from the child component's point of view. A child should not mutate props; it should render from them or ask the parent to change data through a callback prop.

```jsx
function SaveButton({ onSave }) {
  return <button onClick={onSave}>Save</button>
}
```

Props are the foundation of React's one-way data flow: data moves down, events move up.
