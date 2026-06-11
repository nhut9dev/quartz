---
title: CORS preflight
description: The browser's permission check before sending certain cross-origin requests.
tags:
  - browser
  - security
  - cors
---

A **CORS preflight** is an `OPTIONS` request sent before some cross-origin requests.

The browser uses it to ask whether the server allows the method, headers, and origin. If the preflight fails, the real request is not sent by the browser.

Preflights affect latency and caching. Configure them deliberately, especially for APIs with custom headers or non-simple methods. Related: [[../web/cors|CORS]].
