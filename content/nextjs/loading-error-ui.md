---
title: Loading and error UI
description: Next.js App Router files for route-level pending and failure states.
tags:
  - nextjs
  - react
---

`loading.tsx` defines pending UI for a route segment.

`error.tsx` defines a client-side [[error-boundary|error boundary]] for a route segment.

These files make loading and failure states part of the route structure instead of scattered ad hoc states. The loading UI integrates with React [[suspense|Suspense]] under the hood.
