---
title: CORS misconfiguration
description: Incorrect cross-origin policy that exposes browser-accessible API data too broadly.
tags:
  - security
  - web
---

**CORS misconfiguration** happens when an API allows browser reads from origins that should not be trusted.

Risky patterns include reflecting arbitrary origins, using broad allowlists, combining credentials with overly permissive origins, or assuming CORS is an authentication mechanism.

CORS controls which browser origins can read responses. It does not stop non-browser clients from sending requests.

CORS should be designed alongside [[../web/cors|CORS]], [[../web/same-origin-policy|same-origin policy]], cookies, and authentication.
