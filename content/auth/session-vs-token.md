---
title: Session vs token
description: Stateful server-side sessions versus stateless self-contained tokens.
tags:
  - auth
---

**Session versus token** is the choice between storing auth state on the server or inside a self-contained credential.

A server-side session is stateful: the server keeps the session record and the client holds only an opaque id, as in [[../web/session-cookie-auth|session-cookie auth]].

A token like a [[../web/jwt|JWT]] is stateless: it carries its own claims and signature, so the server can verify it without a lookup.

Sessions are easy to revoke but need shared storage to scale. Tokens scale naturally but are hard to revoke before they expire.

[[../security/refresh-token|Refresh tokens]] are a common middle ground.
