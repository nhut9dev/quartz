---
title: useLayoutEffect
description: A React effect hook that runs after DOM updates but before the browser paints.
tags:
  - react
  - hook
  - effect
---

`useLayoutEffect` is like [[use-effect|useEffect]], but it runs synchronously after React updates the DOM and before the browser paints the screen.

```jsx
useLayoutEffect(() => {
  const rect = ref.current.getBoundingClientRect()
  setHeight(rect.height)
}, [])
```

Use it when code must measure layout or make a visual correction before the user sees the frame. Tooltips, popovers, and scroll-position adjustments are common examples.

Prefer `useEffect` for normal side effects. `useLayoutEffect` blocks painting, so overusing it can make the UI feel slower.
