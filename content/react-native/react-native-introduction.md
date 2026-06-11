---
title: React Native
description: A React framework for building mobile apps with native platform views.
tags:
  - react-native
  - react
  - mobile
---

**React Native** is a framework for building [[native-app|native mobile apps]] with React. You write components in JavaScript or TypeScript, and React Native renders platform views on [[ios|iOS]] and [[android|Android]].

```jsx
import { Text, View } from "react-native"

export function App() {
  return (
    <View>
      <Text>Hello mobile</Text>
    </View>
  )
}
```

React Native shares React ideas like [[react-component|components]], [[props|props]], [[state|state]], and [[hook|hooks]], but its UI primitives are not HTML elements. Use `View`, `Text`, `Image`, and native APIs instead of `div`, `span`, and browser APIs.

Use React Native when the app needs native mobile distribution, device APIs, and platform UI while keeping much of the product logic in React.
