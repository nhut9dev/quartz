---
title: Token storage
description: Where to keep tokens on the client and the XSS and CSRF tradeoffs involved.
tags:
  - auth
---

**Token storage** is the question of where a client keeps its auth token, and each option has a different attack surface.

A token in `localStorage` is easy to use from JavaScript, but any [[../web/xss|XSS]] flaw can read and exfiltrate it.

A token in an `HttpOnly` cookie is hidden from JavaScript, which blocks that XSS theft, but cookies are sent automatically and so are exposed to [[../web/csrf|CSRF]].

Cookie-based storage is usually preferred, paired with CSRF defenses like the `SameSite` attribute.

There is no storage choice that is safe on its own; the surrounding defenses are what matter.
