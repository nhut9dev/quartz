---
title: React Navigation
description: A routing and navigation library for React Native apps.
tags:
  - react-native
  - navigation
---

**React Navigation** is a common routing and navigation library for React Native apps. It provides stacks, tabs, drawers, deep linking, headers, and screen lifecycle integration.

```jsx
<Stack.Navigator>
  <Stack.Screen name="Home" component={HomeScreen} />
  <Stack.Screen name="Profile" component={ProfileScreen} />
</Stack.Navigator>
```

Navigation in mobile apps is more than URL routing. It also manages native gestures, transitions, headers, back behavior, and nested navigators.

For external links into a screen, React Navigation often integrates with [[deep-link|deep links]].
