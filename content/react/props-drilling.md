---
title: Props drilling
description: Passing props through intermediate components that only forward them.
tags:
  - react
  - props
  - architecture
---

**Props drilling** happens when data is passed through several components that do not use it themselves, only to reach a deeply nested child.

```jsx
function App() {
  return <Layout user={user} />
}

function Layout({ user }) {
  return <Sidebar user={user} />
}

function Sidebar({ user }) {
  return <UserMenu user={user} />
}
```

Some prop passing is normal and clear. It becomes a problem when intermediate components are cluttered with props they do not care about.

Common fixes are [[component-composition|component composition]], moving state closer to where it is used, or using [[react-context|React context]] for truly shared data.

## How it works

Props drilling is a direct consequence of [[props|props]] being the only way data flows down the component tree by default — if `UserMenu` needs `user` and `App` is where it's fetched, every component on the path between them must accept and forward it, whether or not it uses it itself. Nothing is "wrong" mechanically; it's a readability and maintenance cost that grows with the distance between where data lives and where it's needed.

## When to use

Some drilling is normal and not worth fixing — one or two levels of forwarding a prop is often clearer than the indirection of context or a store. It becomes worth fixing when intermediate components accumulate props they don't use (cluttering their signatures and making refactors touch files that have nothing to do with the change), or when the same prop is threaded through many unrelated branches of the tree.

## Trade-offs

[[component-composition|Composition]] (passing already-rendered JSX as `children` so intermediate components don't need to know about props meant for a deep child) fixes drilling without adding any new mechanism, but only works when the intermediate components don't need to *render differently* based on that data. [[react-context|Context]] removes the forwarding entirely — any descendant can read the value directly — but every consumer re-renders when the context value changes, which is its own cost (see [[context-performance|context performance]]).

## Pitfalls

The overcorrection is reaching for context (or a global store) for *everything* that's drilled more than once, including state that's only shared by a small, nearby cluster of components — this turns a local, traceable data flow into a global one, where "what causes this component to re-render" requires checking every place that calls the context's setter, anywhere in the app. [[lifting-state-up|Lifting state]] to the nearest common ancestor and using composition is usually the right first move; context is for state that's genuinely needed across distant, unrelated parts of the tree (theme, auth, locale).
