---
title: Bridge
description: The communication layer between JavaScript and native code in React Native.
tags:
  - react-native
  - architecture
---

The **bridge** is the communication layer between JavaScript and native code in older React Native architecture.

JavaScript sends messages to native modules and native UI systems, and native code can send events back to JavaScript.

The bridge made React Native possible, but crossing it too often can become a performance bottleneck for high-frequency work.

Modern React Native architecture reduces this overhead with newer native interop mechanisms, but the bridge is still useful vocabulary when reading older docs, libraries, and performance discussions.
