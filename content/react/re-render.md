---
title: Re-render
description: React calling a component again to calculate the next UI, and what makes it happen.
tags:
  - react
  - rendering
---

A **re-render** means React calls a component again to calculate what the UI should look like now. The setter call below doesn't touch the DOM — it gives React new data, then React runs the component again and reconciles the result against the previous output.

```jsx
setCount(count + 1)
```

## What triggers a re-render

A component re-renders when its own [[state|state]] changes, when its parent re-renders, when a [[react-context|context]] it consumes gets a new value, or when its [[react-key|key]] changes. The second one surprises people: **a parent re-rendering re-renders all of its children by default**, whether or not their [[props|props]] actually changed. Passing the same props down does not skip the child unless you opt in with [[react-memo|React.memo]].

## What it is not

A re-render is not a DOM update. After rendering, [[reconciliation|reconciliation]] diffs the new output against the old one and touches the DOM only where it differs — a component can re-render many times and produce zero DOM changes. React also bails out of a state update when the next value is identical (`Object.is`) to the current one.

## Pitfalls

Creating new object, array, or function values inline in JSX gives children fresh prop identities every render, which defeats `React.memo` and effect dependency checks downstream. Defining a component *inside* another component makes it a new type each render, forcing a full remount. And calling a state setter unconditionally during render causes the "too many re-renders" loop — render must stay a [[purity|pure]] calculation, with updates living in effects or event handlers.
