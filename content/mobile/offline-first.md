---
title: Offline-first
description: A mobile app design approach that keeps core behavior useful without a network.
tags:
  - mobile
  - architecture
---

**Offline-first** means an app is designed to keep core behavior useful when the network is slow, unreliable, or unavailable.

Mobile networks change constantly. Users move through elevators, trains, buildings, and weak coverage areas, so a mobile app cannot assume stable connectivity.

Offline-first apps usually cache data locally, queue writes, show sync status, and handle conflicts when the device reconnects.

The hard part is deciding which data can be stale, which actions can be queued, and how to recover when server state changed while the app was offline.
