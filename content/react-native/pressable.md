---
title: Pressable
description: A React Native component for touch interactions.
tags:
  - react-native
  - component
---

`Pressable` handles touch interactions in React Native. It supports press states such as pressed, hovered, focused, and disabled depending on platform.

```jsx
<Pressable onPress={save}>
  <Text>Save</Text>
</Pressable>
```

Use `Pressable` when you need a custom button-like surface. It gives more control than a fixed native button component.

For accessibility, make sure interactive surfaces have clear labels, adequate hit area, and visual feedback when pressed.
