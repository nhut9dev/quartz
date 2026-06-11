---
title: React
description: A JavaScript library for building user interfaces from components.
tags:
  - react
---

**React** is a JavaScript library for building user interfaces from small pieces called [[react-component|components]]. Instead of manually changing the DOM step by step, you describe what the UI should look like for the current data.

```jsx
function App() {
  return <h1>Hello React</h1>
}
```

React is declarative: state changes, React calls your components again, and the screen updates to match the returned JSX. That makes React code easier to reason about than direct DOM manipulation once the UI has many states.

React does not replace JavaScript. It depends heavily on [[function|functions]], [[array-map|map()]], [[object|objects]], [[closure|closures]], and [[immutable-operation|immutable updates]].
