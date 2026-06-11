---
title: Storage quota
description: Browser limits on how much data an origin can store locally.
tags:
  - browser
  - storage
---

**Storage quota** is the amount of local data a browser allows an origin to keep.

Quota applies to storage APIs such as [[../web/indexeddb|IndexedDB]], Cache Storage, localStorage, and other origin-scoped browser storage.

Browsers may evict data when storage pressure is high, especially for origins the user does not interact with often. Apps should treat browser storage as useful but not permanent unless the browser grants persistent storage.

Good offline features keep data compact, handle missing cached data, and sync important state back to a server.
