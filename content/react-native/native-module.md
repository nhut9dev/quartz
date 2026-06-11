---
title: Native module
description: Platform-specific native code exposed to React Native JavaScript.
tags:
  - react-native
  - mobile
---

A **native module** exposes platform-specific iOS or Android code to React Native JavaScript.

Native modules are used when JavaScript needs access to platform APIs, SDKs, or performance-sensitive work that is not available through existing packages.

```txt
JavaScript -> native module -> iOS or Android API
```

Use native modules carefully because they add platform maintenance. The more native code a project owns, the more it needs iOS and Android build knowledge.
