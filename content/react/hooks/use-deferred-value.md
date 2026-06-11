---
title: useDeferredValue
description: A React hook for deferring a value so urgent UI can update first.
tags:
  - react
  - hook
  - performance
---

`useDeferredValue` returns a deferred version of a value. React can keep the urgent UI responsive while slower parts render with the delayed value.

```jsx
function SearchResults({ query }) {
  const deferredQuery = useDeferredValue(query)

  return <Results query={deferredQuery} />
}
```

It is useful when a changing value drives expensive rendering, such as filtering a large list. For network requests, a data library like [[tanstack-query|TanStack Query]] is usually a better tool.
