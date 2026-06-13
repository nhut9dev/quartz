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

## How it works

A native module is platform code (Swift/Objective-C on iOS, Kotlin/Java on Android) that registers itself with React Native's module system, exposing methods and constants to JavaScript under a name you call like any other import. In the old architecture, calls go through the [[bridge|bridge]] — asynchronous and serialized. In the new architecture, native modules are written as **TurboModules** on top of JSI, with a typed interface generated from a spec, allowing synchronous calls where appropriate.

## When to use

Write a native module when a capability isn't available through an existing community package or Expo SDK module — direct access to a platform SDK (payments, Bluetooth, a vendor's hardware SDK), or CPU-bound native code where crossing into native is worth it for the performance gain. Check the existing ecosystem first; a maintained community module usually costs less long-term than an in-house one.

## Trade-offs

A native module gives access to anything the platform supports — there's no ceiling imposed by React Native's JS APIs. The cost is ongoing ownership of platform-specific code: every React Native upgrade, iOS/Android OS version bump, and architecture change (old bridge → new architecture) is now something your team's native code needs to keep working with, not just something the framework or a library maintainer handles.

## Pitfalls

A native module implemented for only one platform doesn't fail at compile time on the other — it typically throws or silently returns nothing at runtime, which can ship unnoticed if testing only covers one platform. The other major pitfall surfaced during the New Architecture rollout: native modules written only against the old bridge API can break or behave incorrectly once an app enables the new architecture, so any in-house native module needs to be migrated to TurboModules on the same timeline as the rest of the app — it doesn't get the migration "for free" the way a well-maintained community library might.
