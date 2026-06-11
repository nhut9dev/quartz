---
title: React.lazy
description: A React API for loading components only when they are rendered.
tags:
  - react
  - performance
---

`React.lazy` lets a component be loaded with a dynamic `import()` only when React needs to render it.

```jsx
import { lazy, Suspense } from "react"

const SettingsPage = lazy(() => import("./SettingsPage"))

function App() {
  return (
    <Suspense fallback={<p>Loading...</p>}>
      <SettingsPage />
    </Suspense>
  )
}
```

This works with [[code-splitting|code splitting]]: the [[bundler|bundler]] creates a separate chunk, and React loads that chunk when the lazy component appears.

Lazy components must render inside a [[suspense|Suspense]] boundary so React has a fallback while the code is still loading.
