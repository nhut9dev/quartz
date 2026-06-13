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

## How it works

The old-architecture bridge is **asynchronous, serialized, and batched**: every message between the JavaScript thread and the native (UI) thread is converted to JSON, queued, and flushed in batches — calling a native method doesn't execute it immediately, it schedules a message that's processed on the next batch. The new architecture replaces this with **JSI** (JavaScript Interface), a C++ layer that lets JavaScript hold direct references to native objects and call their methods *synchronously*, with no serialization step — TurboModules (native modules) and Fabric (the renderer) are built on top of JSI.

## When to use

You don't choose the bridge directly — it's determined by which architecture the app runs (old "Paper" architecture vs. new architecture, the default since RN 0.76). Understanding it matters when reasoning about *why* certain patterns exist: high-frequency interactions (gesture tracking, animations driven by scroll position) historically couldn't run smoothly if every frame's data had to cross the async, batched bridge — which is why libraries like Reanimated and Gesture Handler run "worklets" on a separate thread with direct native access rather than going through JS↔native messages per frame.

## Trade-offs

The old bridge's async/batched design is safe — neither thread blocks waiting on the other — but adds latency and serialization cost proportional to message frequency, which is fine for occasional calls (opening a native picker) and poor for continuous ones (every scroll/gesture frame). JSI's synchronous calls remove that overhead but require native modules to be written or updated as TurboModules — a library built only against the old bridge API doesn't automatically gain JSI's benefits.

## Pitfalls

"Janky" scroll-linked animations or gesture-driven UI in older React Native code is often the bridge's batching showing up as dropped frames — sending position updates 60 times a second across an async, JSON-serialized channel adds up. The other practical pitfall is the New Architecture migration itself: third-party native modules that were never updated to support TurboModules/Fabric can fail or behave incorrectly once an app enables the new architecture, which is a common cause of "this library stopped working after upgrading React Native."
