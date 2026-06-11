---
title: Session fixation
description: An attack where a user is forced to authenticate with an attacker-controlled session id.
tags:
  - security
  - auth
---

**Session fixation** happens when an attacker causes a victim to use a session id the attacker already knows.

If the application keeps the same session id after login, the attacker may be able to reuse that authenticated session.

A common defense is to rotate the session id immediately after authentication and after privilege changes.

This matters most for [[../web/session-cookie-auth|session-cookie auth]], where the cookie is the main handle for the authenticated browser session.
