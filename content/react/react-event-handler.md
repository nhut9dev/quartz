---
title: React event handler
description: A function passed to a React event prop such as onClick or onChange.
tags:
  - react
  - event
---

A **React event handler** is a function passed to an event prop such as `onClick`, `onChange`, or `onSubmit`.

```jsx
function Button() {
  function handleClick() {
    console.log("clicked")
  }

  return <button onClick={handleClick}>Save</button>
}
```

Pass the function itself. Do not call it during render unless you intentionally want the returned value to become the handler.

```jsx
<button onClick={handleClick}>Save</button>
<button onClick={() => save(id)}>Save</button>
```

Event handlers are the right place for user-driven side effects: submitting data, updating state, focusing an input, or opening a dialog.
