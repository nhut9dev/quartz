---
title: Deep link
description: A link that opens a mobile app to a specific screen or state.
tags:
  - mobile
  - navigation
---

A **deep link** opens a mobile app to a specific screen or state instead of only launching the app home screen.

```txt
myapp://orders/42
https://example.com/orders/42
```

Deep links are used for notifications, emails, password resets, invites, shared content, and cross-app flows.

They require coordination between routing, platform configuration, and sometimes web domain verification. In React Native apps, navigation libraries like [[react-navigation|React Navigation]] often handle the in-app routing side.
