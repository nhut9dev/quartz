---
title: useContext
description: A React hook for reading a value from React context.
tags:
  - react
  - hook
  - context
---

`useContext` reads the nearest value provided by a [[react-context|React context]] provider above the current component.

```jsx
const ThemeContext = createContext("light")

function Button() {
  const theme = useContext(ThemeContext)
  return <button className={theme}>Save</button>
}
```

Use context for app-wide values like theme, locale, current user, feature flags, or dependency objects. Avoid putting fast-changing local state in context unless many descendants truly need it.
