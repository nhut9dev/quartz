---
title: useRef
description: A React hook for storing a mutable value that does not trigger re-render.
tags:
  - react
  - hook
  - ref
---

`useRef` stores a mutable value in `.current`. Updating it does not trigger a [[re-render|re-render]].

```jsx
const countRef = useRef(0)

countRef.current += 1
```

Refs are commonly used to access DOM elements.

```jsx
function SearchBox() {
  const inputRef = useRef(null)

  return (
    <>
      <input ref={inputRef} />
      <button onClick={() => inputRef.current?.focus()}>
        Focus
      </button>
    </>
  )
}
```

Use [[state|state]] for data that affects the screen. Use refs for values that need to persist between renders but should not cause rendering by themselves.

## How it works

`useRef` returns the *same* plain object (`{ current: ... }`) on every render — React creates it once and hands back that identical reference forever, which is why mutating `.current` doesn't trigger a re-render: nothing about the component's render output changed, only a field on an object React doesn't track. For DOM refs specifically, `.current` is `null` during the render itself; React only assigns the actual DOM node to `.current` during the commit phase, after the DOM has been updated. That's why DOM refs are read in event handlers or [[use-effect|effects]] — by the time those run, the commit has happened — and reading `.current` *during* render for a DOM ref gives `null` on the first render.

## When to use

Refs fit three situations: imperative access to a DOM node (`.focus()`, `.scrollIntoView()`, measuring with `getBoundingClientRect`), storing a mutable value that the component needs across renders but that should never itself cause a render (a timer id to clear later, the previous value of a prop for comparison, an instance-variable-like flag), and stashing the *latest* version of a callback or value so an effect with a stable dependency array can still read current data without re-running.

## Trade-offs

A ref's mutation is invisible to React's render cycle — that's the whole point, but it means the UI will not reflect a ref's current value unless something else (a state update, a different render) causes a re-render afterward. State guarantees the UI stays in sync with the value at the cost of a render on every change; a ref is free to mutate but the screen can silently drift out of sync with `.current` until the next render happens for some other reason.

## Pitfalls

Reading or writing `ref.current` *during render* (not in an effect or handler) breaks React's purity assumptions — under concurrent rendering, React may call a component's render function multiple times for a single update (and discard some results), so a ref mutated during render can end up reflecting a discarded render pass, not the committed one. The other common mistake is expecting a DOM ref to be populated on the very first render — `inputRef.current` is `null` until after mount, so code that runs during render (rather than in an effect) and assumes the element exists will throw or silently no-op.
