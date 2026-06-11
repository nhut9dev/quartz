---
title: Browser storage
description: Browser APIs for storing data on the client.
tags:
  - web
  - browser
---

**Browser storage** covers client-side storage APIs such as `localStorage`, `sessionStorage`, `IndexedDB`, and Cache Storage.

`localStorage` is simple key-value storage that persists across sessions. `sessionStorage` lasts for a browser tab session. `IndexedDB` handles larger structured data. Cache Storage is commonly used by service workers to store request and response pairs.

Do not store sensitive long-lived auth secrets in JavaScript-readable storage if you can avoid it. If the page has an [[xss|XSS]] bug, injected code can read that storage. For many auth flows, an `HttpOnly` [[cookie|cookie]] is safer.
