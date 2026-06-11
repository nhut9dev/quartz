---
title: Text
description: React Native's component for rendering text.
tags:
  - react-native
  - component
---

`Text` is React Native's component for rendering text. Unlike the web, raw text cannot be placed directly inside a [[view|View]].

```jsx
import { Text } from "react-native"

function Greeting() {
  return <Text>Hello Ada</Text>
}
```

Text styles inherit only within nested `Text` components, not through every parent `View`.

Use `Text` for visible copy, labels, formatted inline text, and accessible names. For editable text, use [[textinput|TextInput]].
