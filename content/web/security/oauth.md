---
title: OAuth 2.0
description: An authorization framework for granting third-party apps limited account access.
tags:
  - web
  - auth
  - security
---

**OAuth 2.0** lets a user grant a third-party app limited access to their account on another service without ever sharing their password. The app receives a scoped, short-lived access token through a flow instead of credentials — this is what powers "Log in with Google" or "Log in with GitHub".

## The authorization code flow

Four roles take part: the **resource owner** (user), the **client** (app), the **authorization server** (issues tokens), and the **resource server** (holds the data). The app redirects the user to the provider, the user logs in and consents, the provider redirects back with a one-time **code**, and the app exchanges that code for a token over a secure back channel. Public clients (SPAs, mobile) add **PKCE** to protect the exchange, since they can't keep a secret.

## OAuth vs OpenID Connect

OAuth handles *authorization* — what an app may do. [[../auth/openid-connect|OpenID Connect]] layers *authentication* on top, adding an ID token that says who the user is. Access tokens are often [[jwt|JWTs]] the resource server can verify directly.

## Pitfalls

The legacy implicit flow is deprecated — use [[../auth/oauth-flows|authorization code]] with [[../security/pkce|PKCE]] everywhere. Validate redirect URIs strictly or you create an open-redirect token leak, and send a `state` parameter to defend the callback against CSRF. Mind where the token is stored (the same [[xss|XSS]] concerns as any token) and request the narrowest scopes you need. Contrast a per-user OAuth token with a single shared [[api-key|API key]], or with stateful [[session-cookie-auth|session-cookie auth]] inside one app.
