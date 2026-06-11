---
title: CORS
description: A browser mechanism that decides whether a page may read an API response from another origin.
tags:
  - web
  - security
---

**CORS** (Cross-Origin Resource Sharing) is a browser security mechanism that decides whether a page from one origin may read responses from an API on a different origin. By default the browser blocks such cross-origin reads, and the server must opt in with response [[http-headers|headers]] like `Access-Control-Allow-Origin`.

## Simple vs preflighted requests

A "simple" request (a `GET`, or a `POST` with an ordinary content type) goes straight through, and the browser just checks the response's `Allow-Origin` header before exposing it to your code. Anything else — a `PUT`/`DELETE`, a JSON content type, custom headers — triggers a **preflight**: the browser first sends an `OPTIONS` request asking which origins, [[http-methods|methods]], and headers are allowed, and only makes the real call if the server approves.

```http
Access-Control-Allow-Origin: https://app.example.com
Access-Control-Allow-Methods: GET, POST
```

## Credentials

To send cookies cross-origin the server must set `Access-Control-Allow-Credentials: true` **and** echo a specific origin — the `*` wildcard is forbidden with credentials. Forgetting this is the usual reason an authenticated cross-origin request fails.

## Pitfalls

CORS is enforced by the *browser*, not the server, so it is not API protection — a non-browser client ignores it entirely; real defense is auth like [[session-cookie-auth|session cookies]] or tokens. A "CORS error" means the browser blocked the *read*, not that the server is down. And the fix lives on the server (response headers), never in client fetch options.
