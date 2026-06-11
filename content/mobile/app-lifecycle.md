---
title: App lifecycle
description: The states and transitions a mobile app goes through while running.
tags:
  - mobile
---

The **app lifecycle** is the set of states and transitions a mobile app goes through while running: launch, foreground, background, inactive, suspended, and terminated.

Lifecycle changes affect what work the app should do. A video might pause in the background, a chat app might refresh when returning to foreground, and sensitive screens might lock after inactivity.

Mobile operating systems can pause or kill apps to save battery and memory, so apps should persist important state instead of assuming they will keep running forever.

React Native exposes some lifecycle information through [[app-state|App state]].
