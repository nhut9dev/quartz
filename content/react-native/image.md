---
title: Image
description: React Native's component for displaying images.
tags:
  - react-native
  - component
---

`Image` displays local or remote images in React Native.

```jsx
import { Image } from "react-native"

function Avatar() {
  return (
    <Image
      source={{ uri: "https://example.com/avatar.png" }}
      style={{ width: 48, height: 48 }}
    />
  )
}
```

Remote images need explicit dimensions so React Native knows how much space to reserve.

For icons, many apps use vector icon libraries or SVG tooling instead of `Image`, depending on the project setup.
