---
title: Fragment
description: A React wrapper that groups children without adding a DOM element.
tags:
  - react
  - jsx
---

A **Fragment** groups multiple children without rendering an extra DOM element.

```jsx
function UserSummary({ user }) {
  return (
    <>
      <h2>{user.name}</h2>
      <p>{user.email}</p>
    </>
  )
}
```

Fragments are useful because a component must return one top-level value, but the DOM should not always get an extra wrapper like a `div`.

Use the long form, `<Fragment key={id}>`, when rendering a list of fragments that needs a [[react-key|key]].
