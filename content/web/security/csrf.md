---
title: CSRF
description: An attack where another site tricks a browser into sending an authenticated request.
tags:
  - web
  - security
---

**CSRF** (cross-site request forgery) happens when an attacker causes a user's browser to send an unwanted request to a site where the user is already authenticated.

## Why it works

Browsers automatically attach matching [[cookie|cookies]] to a request based on its destination, regardless of which site initiated it. So a form or image on the attacker's page can fire a `POST` to your bank, and the browser dutifully includes the victim's session cookie. The attacker never sees the response — they don't need to. The damage is done by the *request* itself (transfer money, change email), which the server accepts as genuine.

## Defenses

`SameSite` cookies are the modern baseline: `Lax` (now the default) blocks cookies on cross-site `POST`s, `Strict` blocks them on cross-site navigation too. Layer on a CSRF token (a synchronizer or double-submit value the attacker's page can't read), validate the `Origin`/`Referer` header on state-changing requests, and require explicit interaction for sensitive actions.

## Pitfalls

APIs that authenticate with a bearer token in a header are largely immune, because another site can't auto-attach that header — CSRF specifically exploits *ambient* credentials like cookies. `SameSite=None` needs `Secure` or browsers drop it. A `GET` that changes state is a CSRF trap, since it rides along on image and link loads. And note [[cors|CORS]] does **not** prevent CSRF — CORS governs *reading* responses, while CSRF only needs the request to land.
