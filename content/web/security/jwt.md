---
title: JWT
description: A compact, signed token carrying claims a server can verify without a session lookup.
tags:
  - web
  - auth
  - security
---

**JWT** (JSON Web Token) is a compact, URL-safe token made of three base64url parts joined by dots: `header.payload.signature`. It carries signed claims, so a server can verify it with the signature alone — no database lookup — which makes JWTs popular for stateless auth and as [[oauth|OAuth]] access tokens.

```txt
eyJhbGc...   .   eyJzdWIi...   .   SflKxwRJ...
  header           payload         signature
```

## How verification works

The issuer signs the token with a secret (HMAC) or a private key (RSA/ECDSA). Any service holding the secret or matching public key can recompute the signature and trust the claims without shared session state. That statelessness is the whole appeal — and the whole catch.

## The revocation problem

Because the server keeps no record of the token, you cannot easily *un*-issue one. A stolen or stale JWT stays valid until it expires. The standard answer is short-lived access tokens plus a longer-lived refresh token, optionally backed by a denylist for emergencies — but a denylist reintroduces exactly the server state JWTs were meant to avoid.

## Pitfalls

The payload is only encoded, not encrypted — anyone can read it, so never put secrets there. Pin the expected algorithm when verifying; accepting `alg: none` or confusing HMAC with RSA enables classic forgery attacks. Storing JWTs in `localStorage` exposes them to [[xss|XSS]], whereas an `HttpOnly` [[cookie|cookie]] can't be read by injected scripts. Contrast all this with server-held [[session-cookie-auth|session-cookie auth]], where revocation is trivial because the server owns the state.
