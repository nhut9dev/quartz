---
title: Higher-order component
description: A function that takes a component and returns an enhanced version of it.
tags:
  - react
  - pattern
  - architecture
---

A **higher-order component** (HOC) is a function that takes a component and returns a new component with extra behavior, such as injected [[props|props]], shared data, or wrapping logic. The name echoes higher-order functions.

```jsx
function withUser(Component) {
  return function WithUser(props) {
    const user = useCurrentUser()
    return <Component {...props} user={user} />
  }
}

const Profile = withUser(BaseProfile)
```

HOCs were the classic way to share logic, but they add wrapper layers and can obscure where props come from. [[custom-hook|Custom hooks]] usually solve the same problems more directly today, and [[component-composition|composition]] handles structural reuse. Use an HOC when you must wrap arbitrary components uniformly, such as in a library.
