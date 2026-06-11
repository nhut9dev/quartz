---
title: key
description: A stable identity React uses when rendering lists.
tags:
  - react
  - rendering
---

A **key** gives React a stable identity for each item in a rendered list. It helps React understand which items were added, removed, or moved.

```jsx
users.map(user => (
  <li key={user.id}>{user.name}</li>
))
```

Use a stable ID from the data whenever possible. Avoid array indexes as keys when items can be inserted, deleted, sorted, or filtered, because indexes describe position rather than identity.

Keys are only meaningful to React during [[list-rendering|list rendering]]. They are not passed to the child component as a normal [[props|prop]].
