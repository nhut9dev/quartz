---
title: View
description: React Native's basic container component.
tags:
  - react-native
  - component
---

`View` is React Native's basic container component. It is similar in role to a `div` on the web, but it renders a native platform view instead of a DOM node.

```jsx
import { View, Text } from "react-native"

function Card() {
  return (
    <View>
      <Text>Profile</Text>
    </View>
  )
}
```

Use `View` for layout, grouping, background colors, borders, spacing, and touchable areas when combined with components like [[pressable|Pressable]].

Text must be rendered inside [[text|Text]], not directly inside `View`.
