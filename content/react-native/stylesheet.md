---
title: StyleSheet
description: React Native's helper for defining component styles.
tags:
  - react-native
  - styling
---

`StyleSheet` is React Native's helper for defining styles as JavaScript objects.

```jsx
const styles = StyleSheet.create({
  card: {
    padding: 16,
    borderRadius: 8,
    backgroundColor: "white",
  },
})
```

React Native styles look similar to CSS, but they are not full CSS. Property names are camelCased, layout uses [[flexbox-layout|Flexbox]], and values are passed through native style systems.

`StyleSheet.create()` also gives a central place to name styles instead of scattering large inline objects through JSX.
