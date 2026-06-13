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

## How it works

A cookie is attached automatically by the browser to every matching request's `Cookie` header — the server sees it without any client code running, and `SameSite` controls whether it's still attached on cross-site requests. Web storage is the opposite: nothing is ever sent over the network automatically; only JavaScript running on that origin can read or write it, and only that origin's pages can see it (`sessionStorage` is further scoped to one tab).

## When to use

Use a cookie — with `HttpOnly`, `Secure`, and `SameSite` set — for anything the *server* needs on every request: session identifiers, CSRF tokens, auth state. Use `localStorage`/`sessionStorage`/IndexedDB for client-only data the server never needs to see: theme preference, draft form input, cached UI state, feature-flag overrides.

## Trade-offs

An `HttpOnly` cookie can't be read by JavaScript at all, so a successful XSS injection can't steal it directly — but the browser *will* attach it to any matching request, including ones triggered by a malicious page on another site (CSRF), which `SameSite=Lax/Strict` and CSRF tokens defend against. A token in `localStorage` is immune to CSRF (nothing sends it automatically) but fully exposed to XSS — one injected `<script>` can read and exfiltrate it along with everything else on the page. Cookies are also capped around 4KB and ride along with *every* request to their domain (including images and stylesheets), while web storage has a much larger quota and is never transmitted unless your code does it.

## Pitfalls

Storing an auth token in `localStorage` "to avoid CSRF" is a common anti-pattern: it trades a *mitigable* risk (CSRF, solved by `SameSite` + tokens) for a *catastrophic* one (any XSS becomes full account takeover, since the attacker's script can just read `localStorage`). Prefer `HttpOnly` + `SameSite` cookies for authentication. Separately, `sessionStorage` is scoped **per tab**, not per "session" in the everyday sense — opening a link in a new tab starts with empty `sessionStorage`, which surprises people expecting it to be shared like a cookie-based session would be. See [[../web/cookie|Cookie]], [[../web/browser-storage|Browser storage]], and [[../security/secure-cookie|Secure cookie]] for the underlying primitives.
