---
title: JWT pitfalls
description: Common mistakes when using JSON Web Tokens for authentication or authorization.
tags:
  - security
  - auth
---

**JWT pitfalls** are common mistakes that make token-based systems harder to secure.

Examples include accepting weak algorithms, skipping signature verification, storing sensitive data in the payload, using long-lived access tokens, ignoring audience or issuer, and lacking a revocation strategy.

A JWT is signed, not encrypted by default. Anyone holding the token can usually read its claims.

JWT design should be paired with [[refresh-token|refresh tokens]], [[secure-cookie|secure cookies]], [[../auth/token-storage|token storage]], and clear authorization checks.
