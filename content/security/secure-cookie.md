---
title: Secure cookie
description: A cookie configured to reduce theft, cross-site abuse, and accidental exposure.
tags:
  - security
  - web
---

A **secure cookie** uses [[cookie|cookie attributes]] to limit when and how the browser sends it.

Important attributes include `HttpOnly`, `Secure`, `SameSite`, `Path`, `Domain`, and `Max-Age`.

`HttpOnly` prevents JavaScript from reading the cookie. `Secure` sends it only over HTTPS. `SameSite` controls whether the browser sends it on cross-site requests.

Secure cookie settings do not replace authentication checks. They reduce exposure around [[session-cookie-auth|session storage]] and request delivery.
