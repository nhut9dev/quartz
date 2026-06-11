---
title: Jotai
description: An atomic state management library for React.
tags:
  - react
  - state
  - library
---

**Jotai** manages state through small units called atoms. Components subscribe to the atoms they use.

```jsx
const countAtom = atom(0)

function Counter() {
  const [count, setCount] = useAtom(countAtom)

  return <button onClick={() => setCount(count + 1)}>{count}</button>
}
```

Jotai works well when state is naturally split into independent pieces. It can feel lighter than a centralized store when the app has many small state concerns.

For API cache and request lifecycle, use [[../data-fetching/tanstack-query|TanStack Query]] instead of atomizing server responses by hand.
