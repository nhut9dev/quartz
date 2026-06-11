---
title: API key auth
description: A static secret that identifies a calling application, simple but coarse.
tags:
  - auth
---

**API key auth** identifies a calling application using a static secret sent with each request.

It is simple to issue and check, which makes it popular for server-to-server and machine clients.

Because the key is long-lived and shared, it is coarse: it identifies an application, not an individual user, and rarely carries fine-grained scopes.

Rotation is painful, since every client using the key must be updated at once, so leaked keys tend to linger.

For user-facing access, richer schemes like [[../web/oauth|OAuth 2.0]] and [[../web/jwt|JWT]] are usually a better fit.
