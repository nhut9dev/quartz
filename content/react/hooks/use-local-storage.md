---
title: useLocalStorage
description: A custom hook pattern for syncing React state with localStorage.
tags:
  - react
  - hook
  - browser
---

`useLocalStorage` is a common [[custom-hook|custom hook]] pattern for persisting state in `localStorage`.

```jsx
function useLocalStorage(key, initialValue) {
  const [value, setValue] = useState(() => {
    const saved = localStorage.getItem(key)
    return saved ? JSON.parse(saved) : initialValue
  })

  useEffect(() => {
    localStorage.setItem(key, JSON.stringify(value))
  }, [key, value])

  return [value, setValue]
}
```

Use this for small client-side preferences like theme, dismissed banners, or draft settings. Avoid storing sensitive data in localStorage.
