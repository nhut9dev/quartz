---
title: useDebounce
description: A custom hook pattern for delaying a changing value.
tags:
  - react
  - hook
  - performance
---

`useDebounce` delays a changing value until it has stayed stable for a chosen amount of time. It is the hook version of [[debounce|debounce]].

```jsx
function useDebounce(value, delay) {
  const [debouncedValue, setDebouncedValue] = useState(value)

  useEffect(() => {
    const id = setTimeout(() => setDebouncedValue(value), delay)
    return () => clearTimeout(id)
  }, [value, delay])

  return debouncedValue
}
```

Use it for search inputs, filters, validation, or any UI where every keystroke should not immediately trigger expensive work.
