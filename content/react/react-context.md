---
title: React context
description: A way to pass shared values through a component tree without forwarding props manually.
tags:
  - react
  - context
  - architecture
---

**React context** lets a parent provide a value to many descendants without passing the same [[props|prop]] through every level.

```jsx
const ThemeContext = createContext("light")

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Page />
    </ThemeContext.Provider>
  )
}
```

A child reads the value with `useContext`.

```jsx
function Button() {
  const theme = useContext(ThemeContext)
  return <button className={theme}>Save</button>
}
```

Context is useful for shared values like theme, locale, auth user, or app-level settings. It is not automatically a replacement for all state management; overusing it can make data flow harder to trace.
