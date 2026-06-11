---
title: Flexbox layout
description: React Native's default layout model.
tags:
  - react-native
  - layout
---

**Flexbox layout** is React Native's default layout model. It controls how children are arranged inside a parent.

```js
const styles = StyleSheet.create({
  row: {
    flexDirection: "row",
    alignItems: "center",
    gap: 8,
  },
})
```

React Native uses Flexbox concepts like `flexDirection`, `justifyContent`, `alignItems`, and `flex`.

One important difference from web CSS is the default direction: React Native defaults to `column`, while web flex containers default to `row`.
