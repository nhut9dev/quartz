---
title: IndexedDB
description: A transactional in-browser database for large structured and offline data.
tags:
  - web
  - storage
---

**IndexedDB** is a transactional database built into the browser for storing large amounts of structured data on the client. Unlike [[browser-storage|localStorage]], which holds only small string key-value pairs synchronously, IndexedDB stores objects in named object stores, supports indexes for querying, and works asynchronously so it never blocks the main thread.

```js
const tx = db.transaction('notes', 'readwrite')
tx.objectStore('notes').put({ id: 1, text: 'hello' })
```

Its API is event-based and verbose, so most projects use a wrapper like `idb` or Dexie. Storage limits are far larger than localStorage, often hundreds of megabytes or more, making it the natural backing store for offline-first apps and a [[service-worker|service worker]] cache of application data. Reach for IndexedDB when you need to persist substantial structured or offline data; use localStorage for small, simple values.
