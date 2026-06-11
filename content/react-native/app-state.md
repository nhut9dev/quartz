---
title: App state
description: React Native API for knowing whether the app is active, backgrounded, or inactive.
tags:
  - react-native
  - mobile
---

**App state** describes whether a mobile app is active, inactive, or in the background. React Native exposes this through `AppState`.

```js
import { AppState } from "react-native"

AppState.addEventListener("change", status => {
  console.log(status)
})
```

App state matters for pausing timers, refreshing data when the app returns, locking sensitive screens, or stopping expensive work in the background.

It is part of the broader [[app-lifecycle|app lifecycle]] on mobile platforms.
