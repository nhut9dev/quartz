---
title: Derived state
description: A value computed from existing props or state during render rather than stored separately.
tags:
  - react
  - state
---

**Derived state** is a value computed from existing [[props|props]] or [[state|state]] during render, instead of being stored as its own [[use-state|state]] that you must keep in sync.

```jsx
const fullName = `${first} ${last}`
```

If `first` or `last` changes, `fullName` is simply recomputed on the next render — it can never drift out of date. Storing it as separate state would mean updating it in every place the inputs change, and forgetting one spot gives you stale data.

Computing in render avoids that whole class of bugs. When the calculation is genuinely expensive, wrap it in [[use-memo|useMemo]] so it only reruns when its inputs change — but the value still lives in render, not in stored state.

Rule of thumb: if you can calculate it from what you already have, derive it; do not store it.
