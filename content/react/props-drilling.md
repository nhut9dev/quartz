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
