---
title: Platform API
description: React Native APIs for branching behavior by mobile platform.
tags:
  - react-native
  - mobile
---

The **Platform API** lets React Native code branch by platform.

```js
import { Platform } from "react-native"

const shadow = Platform.OS === "ios" ? iosShadow : androidElevation
```

Use platform branches for real platform differences: permissions, shadows, file behavior, native modules, status bars, and design conventions.

Avoid scattering platform checks everywhere. If a feature has many differences between [[ios|iOS]] and [[android|Android]], isolate those differences behind a small helper or component.
