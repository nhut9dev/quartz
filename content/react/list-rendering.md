---
title: List rendering
description: Rendering a collection by mapping data to JSX.
tags:
  - react
  - rendering
---

**List rendering** turns an array of data into an array of JSX elements, usually with [[array-map|map()]].

```jsx
function UserList({ users }) {
  return (
    <ul>
      {users.map(user => (
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  )
}
```

Each rendered item needs a stable [[react-key|key]] so React can match items between renders.

Avoid mutating the source array during render. If you need sorting or filtering, create a new array first so the render stays predictable.
