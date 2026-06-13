---
title: Expo
description: A React Native platform for building, running, and shipping mobile apps.
tags:
  - react-native
  - mobile
  - tooling
---

**Expo** is a platform and toolchain built around React Native. It provides project scaffolding, development builds, native APIs, updates, builds, and deployment services.

```txt
Expo app -> React Native -> iOS and Android
```

Expo is useful when a team wants a smoother development path without manually managing every native project detail from the start.

Use bare React Native or [[react-native-cli|React Native CLI]] when the app needs custom native setup that does not fit Expo's workflow, or when the team wants direct ownership of native projects from day one.

## How it works

The **managed workflow** keeps the project JavaScript-only — there's no `ios`/`android` folder to maintain, native capabilities come from pre-built Expo SDK modules (camera, notifications, location, etc.), and builds happen via EAS Build in the cloud. The **bare workflow** (via `expo prebuild`, sometimes called "continuous native generation") generates the native `ios`/`android` projects from your config, giving full native-code access while still using Expo's SDK and tooling — prebuild can be re-run to regenerate those folders from config, rather than being a one-way "eject."

## When to use

Stay managed when the app's needs fit within the Expo SDK's module set and you don't need custom native code — this covers a large share of apps and gives the fastest iteration loop (Expo Go for quick testing, EAS Update for over-the-air JS updates without an app store review). Move to bare/prebuild when you need a native SDK or capability Expo doesn't ship a module for, or need specific native project configuration (custom build settings, a native dependency with its own Gradle/CocoaPods setup).

## Trade-offs

Managed gives up some control — you can't hand-edit native project files, because prebuild can regenerate them — in exchange for not needing Xcode/Android Studio for day-to-day work and a much faster build/iterate cycle via EAS. Bare gives full native control at the cost of needing native toolchains, and any custom native code changes must go through **config plugins** (so prebuild regenerates them consistently) rather than direct edits to the generated `ios`/`android` folders, which get overwritten on the next prebuild.

## Pitfalls

A dependency that "works in Expo Go" can fail in a real build if it requires native code Expo Go's pre-built binary doesn't include — Expo Go only bundles the standard Expo SDK modules, so any custom native module needs a custom **development build** instead. The other common surprise is editing the generated `ios`/`android` folders directly after `expo prebuild` — those edits are silently lost the next time prebuild runs, unless the same changes are expressed as a config plugin that prebuild applies every time.
