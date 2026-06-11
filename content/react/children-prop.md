---
title: children prop
description: The prop React uses for content nested between component tags.
tags:
  - react
  - component
---

`children` is the special [[props|prop]] React uses for content placed between opening and closing component tags.

```jsx
function Panel({ children }) {
  return <section className="panel">{children}</section>
}

function App() {
  return (
    <Panel>
      <h2>Settings</h2>
      <p>Manage your account.</p>
    </Panel>
  )
}
```

Use `children` when a component should provide layout or behavior but let the caller decide the inner content. It is one of the simplest forms of [[component-composition|component composition]].
