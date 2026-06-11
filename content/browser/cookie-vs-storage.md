---
title: Cookie vs storage
description: Choosing between cookies, localStorage, sessionStorage, and IndexedDB for browser data.
tags:
  - browser
  - storage
  - security
---

**Cookies** are sent with matching HTTP requests. `localStorage`, `sessionStorage`, and `IndexedDB` are read by client-side JavaScript.

Cookies fit server sessions and cross-request state, especially with `HttpOnly`, `Secure`, and `SameSite` attributes. Web storage fits non-sensitive client preferences and cached UI state.

Do not store long-lived secrets in JavaScript-readable storage. Compare with [[../web/cookie|Cookie]], [[../web/browser-storage|Browser storage]], and [[../security/secure-cookie|Secure cookie]].
