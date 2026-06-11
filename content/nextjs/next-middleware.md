---
title: Next.js middleware
description: Code that runs before a Next.js request is completed.
tags:
  - nextjs
  - web
---

**Next.js middleware** runs before a request reaches a route.

It can rewrite, redirect, set headers, and perform lightweight request checks.

As [[web/backend/middleware|middleware]], it should stay small. Heavy data fetching, complex authorization, and business logic usually belong in [[nextjs/route-handler|route handlers]] or server code.
