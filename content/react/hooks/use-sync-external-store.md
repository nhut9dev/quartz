---
title: useSyncExternalStore
description: A React hook for subscribing to an external store safely under concurrent rendering.
tags:
  - react
  - hook
---

`useSyncExternalStore` subscribes a component to a store that lives outside React, such as a browser API or a third-party state library. It reads the snapshot in a way that stays consistent during concurrent rendering, avoiding tearing where parts of the UI show different values.

```jsx
function useOnlineStatus() {
  return useSyncExternalStore(
    (callback) => {
      window.addEventListener("online", callback)
      return () => window.removeEventListener("online", callback)
    },
    () => navigator.onLine,
  )
}
```

You rarely call it directly; state libraries like Redux and Zustand use it internally. Use it when wiring a non-React data source into React rendering safely.
