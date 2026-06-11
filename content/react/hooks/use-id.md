---
title: useId
description: A React hook for generating stable unique IDs for accessibility attributes.
tags:
  - react
  - hook
  - accessibility
---

`useId` creates a stable unique ID that works across server and client rendering. It is commonly used to connect labels, inputs, descriptions, and error messages.

```jsx
function EmailField() {
  const id = useId()

  return (
    <>
      <label htmlFor={id}>Email</label>
      <input id={id} type="email" />
    </>
  )
}
```

Do not use `useId` for list keys. List identity should come from the data itself, as explained in [[react-key|key]].
