---
title: Lifting state up
description: Moving state to the closest shared parent that needs to coordinate children.
tags:
  - react
  - state
  - architecture
---

**Lifting state up** means moving [[state|state]] from a child component to the nearest parent that needs to coordinate multiple children.

```jsx
function Parent() {
  const [selectedId, setSelectedId] = useState(null)

  return (
    <>
      <List selectedId={selectedId} onSelect={setSelectedId} />
      <Details selectedId={selectedId} />
    </>
  )
}
```

Lift state when two or more components need the same value or need to stay in sync. Keep state local when only one component cares about it.

This is usually better than duplicating state in multiple places and trying to manually keep each copy synchronized.
