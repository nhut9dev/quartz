---
title: Security headers
description: HTTP response headers that reduce common browser-side attack risks.
tags:
  - security
  - web
---

**Security headers** tell browsers to apply stricter rules when loading and running a page.

Common examples include [[../web/content-security-policy|Content Security Policy]], `Strict-Transport-Security`, `X-Frame-Options`, `Referrer-Policy`, and `Permissions-Policy`.

They do not replace application fixes, but they reduce the impact of mistakes like [[../web/xss|XSS]], mixed content, clickjacking, and overly broad browser permissions.

Security headers are usually configured at the app server, reverse proxy, CDN, or framework middleware layer.
