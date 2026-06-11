---
title: Content Security Policy
description: A browser security policy that limits where page resources and scripts may come from.
tags:
  - web
  - security
---

**Content Security Policy** (CSP) is an [[http-headers|HTTP header]] that tells the browser which scripts, styles, images, frames, and connections a page is allowed to use. It's the strongest defense-in-depth layer against [[xss|XSS]]: even if an attacker injects a script, a strict policy can stop the browser from running it.

```http
Content-Security-Policy: default-src 'self'; script-src 'self'
```

## How it works

A policy is a set of directives, each naming allowed sources for a resource type: `default-src` is the fallback, `script-src` and `style-src` govern code, `connect-src` governs fetch/XHR/WebSocket targets, and `frame-ancestors` controls who may embed the page (anti-clickjacking). The browser blocks anything not on the list and can `report-uri`/`report-to` violations; `Content-Security-Policy-Report-Only` logs without enforcing, so you can roll it out safely.

## Writing a strong policy

The whole value collapses if you allow `'unsafe-inline'` for scripts, since that's exactly what XSS injects. Permit specific inline scripts with a per-response **nonce** or a **hash** instead, and use `strict-dynamic` to let trusted scripts load their own dependencies without whitelisting every CDN.

## Pitfalls

`'unsafe-inline'` and `'unsafe-eval'` quietly defeat the policy. A strict CSP breaks inline `onclick=` handlers and inline `style` attributes, so legacy markup needs refactoring. Third-party widgets often demand broad allowances that erode it. And CSP is a *second* line — it reduces blast radius but never replaces output escaping and input handling.
