---
title: OAuth flows
description: Common ways applications use OAuth 2.0 to obtain access tokens.
tags:
  - auth
  - security
---

**OAuth flows** are the interaction patterns used to obtain access tokens from an authorization server.

The authorization code flow is the default for server-rendered web apps and modern browser apps when combined with [[../security/pkce|PKCE]].

Client credentials is used for service-to-service access where no user is involved.

Refresh token rotation, narrow scopes, and short-lived access tokens reduce the damage when a token leaks.
