---
title: Cookie
description: Small browser-stored data sent automatically with matching HTTP requests.
tags:
  - web
  - browser
  - auth
---

A **cookie** is a small piece of data stored by the browser for a site. When a request matches the cookie's domain and path rules, the browser sends it automatically with the [[http|HTTP]] request — which is what makes cookies useful for auth and stateful, but also what exposes them to [[csrf|CSRF]].

## Attributes that matter

`Domain` and `Path` scope which requests carry the cookie. `Expires`/`Max-Age` set its lifetime (without them it's a session cookie that dies with the tab). For security: `HttpOnly` hides it from JavaScript, `Secure` restricts it to HTTPS, and `SameSite` (`Lax` / `Strict` / `None`) controls whether it rides along on cross-site requests.

```http
Set-Cookie: sid=abc; HttpOnly; Secure; SameSite=Lax
```

## vs browser storage

JavaScript can read `localStorage`, but an `HttpOnly` cookie cannot be read from JavaScript at all — that's the point. It limits what an [[xss|XSS]] script can steal, which is why session auth favors `HttpOnly` cookies over tokens in [[browser-storage|browser storage]].

## Pitfalls

`SameSite` now defaults to `Lax`, and `None` requires `Secure` or the browser drops the cookie. Cookies are capped around 4 KB and are sent on *every* matching request, so stuffing data into them adds overhead to all traffic. And sloppy `Domain`/`Path` scoping either leaks a cookie to subdomains that shouldn't see it or fails to send it where you expect.
