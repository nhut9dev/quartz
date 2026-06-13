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

## How it works

The update inside `startTransition` is rendered like any other, but marked low-priority: if a higher-priority update (another keystroke, a click) comes in while the transition's render is still in progress, React can pause or discard that in-progress render and handle the urgent update first, then resume the transition afterward. `isPending` is `true` for the whole window between calling `startTransition` and that render committing. In the example, `setQuery` (urgent) updates the input immediately on every keystroke, while `setResultsQuery` (the transition) may lag behind, get interrupted, and restart if the user keeps typing.

## When to use

Use it when a state update triggers expensive rendering — filtering/sorting a large list, switching to a tab with a heavy subtree — and that work shouldn't make the *triggering* interaction (typing, clicking) feel laggy. It's the mechanism behind React's "keep the input responsive while results catch up" pattern.

## Trade-offs

Compared to debouncing, a transition doesn't impose a fixed delay — on a fast device or a cheap render, the transition can complete almost immediately with no perceptible lag; on a slow device, it naturally stays pending longer and yields more often to urgent input. The cost is conceptual: there are now two versions of the value in flight (`query` for the input, `resultsQuery` for the expensive render), and because a transition's render can be started, abandoned, and restarted multiple times before committing, anything it triggers must be safe to run more than once — it shouldn't have side effects beyond producing render output.

## Pitfalls

`startTransition` is not a debounce — it doesn't delay the update by any fixed amount, and if nothing more urgent interrupts it, the "non-urgent" render can complete essentially instantly. Code that expects a guaranteed delay (to coalesce rapid changes) needs actual debouncing, not a transition. Also, a transition only changes *scheduling priority*, not total work — if a render is genuinely too slow for the device, marking it as a transition makes the UI stay responsive to input during that time, but the slow render itself doesn't get any faster.
