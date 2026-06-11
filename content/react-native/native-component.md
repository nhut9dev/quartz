---
title: Native component
description: A React Native component backed by a native iOS or Android view.
tags:
  - react-native
  - mobile
---

A **native component** is a React Native component backed by a real platform view. `View` maps to native container views, `Text` maps to native text rendering, and `Image` maps to native image views.

React Native code describes the UI with React, but the final screen is not a web page. It is a tree of native views managed by the mobile platform.

This is the key difference from React DOM. In web React, JSX becomes DOM nodes; in React Native, JSX becomes native UI through React Native's renderer and platform bindings.

When built-in components are not enough, apps can expose custom platform code through a [[native-module|native module]] or custom native view.
