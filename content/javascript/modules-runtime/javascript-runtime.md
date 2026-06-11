---
title: JavaScript runtime
description: The environment that runs JavaScript and provides extra APIs.
tags:
  - javascript
  - runtime
---

A **JavaScript runtime** is the environment that executes JavaScript code. The language gives you syntax, values, functions, objects, promises, and the event loop model; the runtime adds APIs around it.

```js
console.log("runs in many runtimes")
```

In the browser, the runtime gives JavaScript access to the DOM, events, `fetch`, `localStorage`, timers, and other Web APIs. In [[node-runtime|Node.js]], the runtime gives JavaScript access to the file system, processes, streams, packages, and server-side APIs.

This distinction matters because not every API exists everywhere. `document.querySelector` is a browser API, not a JavaScript language feature. `fs.readFile` is a Node.js API, not something a browser page can call directly.
