---
title: Clickjacking
description: Tricking users into clicking a hidden or disguised page.
tags:
  - security
  - web
---

**Clickjacking** tricks a user into interacting with one page while seeing another page or overlay.

A common version embeds the target site inside an invisible or disguised [[../html/iframe|iframe]] and positions fake UI above it.

Defenses include `X-Frame-Options`, the `frame-ancestors` directive in [[../web/content-security-policy|Content Security Policy]], and avoiding dangerous actions triggered by a single click.

Sensitive flows should also require clear confirmation and proper [[input-validation|server-side validation]].
