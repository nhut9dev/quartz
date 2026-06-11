---
title: useTransition
description: A React hook for marking non-urgent state updates as transitions.
tags:
  - react
  - hook
  - performance
---

`useTransition` lets you mark a state update as non-urgent. Urgent updates, like typing into an input, can stay responsive while React works on heavier UI updates.

```jsx
function SearchPage() {
  const [query, setQuery] = useState("")
  const [resultsQuery, setResultsQuery] = useState("")
  const [isPending, startTransition] = useTransition()

  function handleChange(event) {
    const nextQuery = event.target.value
    setQuery(nextQuery)

    startTransition(() => {
      setResultsQuery(nextQuery)
    })
  }

  return <input value={query} onChange={handleChange} />
}
```

Use it when a state change triggers expensive rendering and should not block immediate feedback.
