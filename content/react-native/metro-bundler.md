---
title: Metro bundler
description: The JavaScript bundler used by React Native.
tags:
  - react-native
  - tooling
---

**Metro** is the [[bundler|bundler]] used by React Native. It resolves JavaScript modules, transforms source code, and serves bundles to the app during development.

```txt
source files -> Metro -> JavaScript bundle -> mobile app
```

Metro supports fast refresh, platform-specific file resolution, asset loading, and integration with React Native's development server.

It plays a similar role to Vite or Webpack in web apps, but it targets mobile runtimes and React Native's packaging model instead of browser pages.
