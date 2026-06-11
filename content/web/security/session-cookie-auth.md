---
title: Session-cookie auth
description: The classic stateful approach where the server stores a session keyed by a cookie.
tags:
  - web
  - auth
  - security
---

**Session-cookie auth** is the classic stateful approach to keeping a user logged in. On login the server creates a session, stores its id in a [[cookie|cookie]], and the browser sends that cookie automatically on every request to the same site. The server looks the id up to recover who the user is.

## How it works

The cookie holds only an opaque session id, not the user data — the real state lives server-side in memory, a database, or a store like Redis. That indirection is the defining trait, and the source of both its strengths and its costs.

## vs stateless tokens

Because the server owns the session, it can revoke a login instantly by deleting it — something a self-contained [[jwt|JWT]] can't do until it expires. The trade-off is that the server must *keep* that state: every instance needs to reach a shared session store (or you pin users with sticky sessions), which a stateless token avoids entirely.

## Pitfalls

Regenerate the session id on login to prevent **[[../security/session-fixation|session fixation]]**, where an attacker plants a known id beforehand. Because the browser attaches the cookie automatically, session auth is exposed to [[csrf|CSRF]] — defend with `SameSite` plus a token. Set the cookie `HttpOnly` (blunts [[xss|XSS]] theft), `Secure` (HTTPS only), and a deliberate `SameSite`. For cross-app or third-party access, reach for delegated [[oauth|OAuth]] instead.
