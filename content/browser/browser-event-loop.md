---
title: Browser event loop
description: The browser scheduler that coordinates tasks, microtasks, rendering, and user input.
tags:
  - browser
  - javascript
---

The **browser event loop** coordinates JavaScript execution, user input, timers, network callbacks, microtasks, and rendering.

A task runs first, then the browser drains the microtask queue, then it may update rendering. This is why a long JavaScript task can block clicks, delay painting, and make the page feel frozen.

Microtasks come from things like [[../javascript/promise|promises]] and `queueMicrotask`. Tasks come from timers, events, and message callbacks.

The browser event loop is related to the [[../javascript/event-loop|JavaScript event loop]], but browser rendering and input scheduling make it different from the [[../node/node-js-runtime|Node.js runtime]].
