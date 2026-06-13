---
title: Lifting state up
description: Moving state to the closest shared parent that needs to coordinate children.
tags:
  - react
  - state
  - architecture
---

**Lifting state up** means moving [[state|state]] from a child component to the nearest parent that needs to coordinate multiple children.

```jsx
function Parent() {
  const [selectedId, setSelectedId] = useState(null)

  return (
    <>
      <List selectedId={selectedId} onSelect={setSelectedId} />
      <Details selectedId={selectedId} />
    </>
  )
}
```

Lift state when two or more components need the same value or need to stay in sync. Keep state local when only one component cares about it.

This is usually better than duplicating state in multiple places and trying to manually keep each copy synchronized.

## How it works

State lives in exactly one component, and that component re-renders — along with everything in its subtree — whenever the state changes. Lifting state to a parent doesn't move the *value* somewhere special; it changes which component's render is triggered by updates, and therefore which subtree gets re-rendered and which components can read the value via [[props|props]].

## When to use

Lift to the **closest common ancestor** of the components that need the value — not to the application root "to be safe." If `List` and `Details` both need `selectedId`, their nearest shared parent is where it belongs; lifting it further up (to `App`, or a global store) means components between that ancestor and the app root re-render on every selection change for no reason.

## Trade-offs

Lifting fixes the "two components, two copies of state, manually kept in sync" problem — there's exactly one value, so it can't drift. The cost scales with *how far* you lift: the component holding the state re-renders on every change, and so does everything below it in the tree, including siblings of the components that actually care. Lifting one level too high turns an unrelated sibling subtree into collateral re-renders.

## Pitfalls

A common path is: prop drilling becomes annoying (see [[props-drilling|props drilling]]), so state gets lifted all the way to a top-level provider "to make it accessible everywhere" — but this couples the entire tree below that provider to every change in that state, the opposite of the original goal of avoiding unnecessary re-renders. If state genuinely needs to be read by many distant components but doesn't need to live in one specific common ancestor, that's a signal to reach for [[react-context|context]] (scoped to the subtree that needs it) or a state-management library, not to lift past the components that actually coordinate the value.
