---
title: Edge Runtime
description: A lightweight Next.js runtime designed to run close to users.
tags:
  - nextjs
  - web
---

The **Edge Runtime** runs supported Next.js code in a lightweight JavaScript environment close to users.

It can reduce latency for routing, personalization, redirects, and request checks.

The tradeoff is a smaller API surface than the full [[../node/node-js-runtime|Node.js runtime]], so not every Node package or native API works there.

It is commonly used with [[next-middleware|Next.js middleware]] and route handlers that need fast request-time decisions.
