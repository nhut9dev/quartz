---
title: Node.js runtime
description: A server-side JavaScript runtime built outside the browser.
tags:
  - javascript
  - node
  - runtime
---

**Node.js** is a JavaScript runtime for running code outside the browser. It is commonly used for CLIs, servers, scripts, build tools, API services, and backend applications.

```js
// main.js
console.log(process.version)
```

Node.js can run JavaScript files directly:

```txt
node main.js
```

Unlike a browser runtime, Node.js does not provide the DOM: there is no `document`, `window`, or real page to manipulate. Instead, Node gives access to server-side capabilities such as the file system, environment variables, networking, and package-based tooling.

Knowing whether code runs in the browser or in Node helps avoid mixing APIs from different runtimes.
