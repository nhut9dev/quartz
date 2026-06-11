---
title: AsyncStorage
description: A persistent key-value storage API commonly used in React Native.
tags:
  - react-native
  - storage
---

**AsyncStorage** is a persistent key-value storage API commonly used in React Native apps.

```js
await AsyncStorage.setItem("theme", "dark")
const theme = await AsyncStorage.getItem("theme")
```

It is useful for small pieces of app state such as preferences, onboarding flags, or cached non-sensitive values.

Do not treat it as secure storage. Sensitive data like long-lived auth tokens should use platform-backed secure storage when possible, similar to how web apps avoid putting secrets in [[browser-storage|browser storage]].
