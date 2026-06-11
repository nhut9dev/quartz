---
title: React component
description: A reusable UI function that returns JSX.
tags:
  - react
  - component
---

A **React component** is usually a JavaScript [[function|function]] that returns [[jsx|JSX]]. Components let you split UI into small, named pieces.

```jsx
function Avatar({ name }) {
  return <img alt={name} src={`/avatars/${name}.png`} />
}
```

Component names must start with a capital letter so React can distinguish them from normal HTML tags.

```jsx
function Profile() {
  return (
    <section>
      <Avatar name="nhut" />
    </section>
  )
}
```

Good components have a clear responsibility: they receive [[props|props]], render UI, and keep state only when they truly own changing data.
