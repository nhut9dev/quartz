---
title: Conditional rendering
description: Choosing which JSX to render based on data.
tags:
  - react
  - rendering
---

**Conditional rendering** means returning different JSX depending on data.

```jsx
function Status({ isOnline }) {
  if (isOnline) {
    return <span>Online</span>
  }

  return <span>Offline</span>
}
```

Inside JSX, ternaries are useful when both branches produce UI.

```jsx
{isLoading ? <Spinner /> : <UserList users={users} />}
```

Use `&&` only when the left side is definitely boolean. Values like `0` can accidentally render on the page because JavaScript follows [[truthy-falsy|truthy and falsy]] rules.
