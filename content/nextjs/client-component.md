---
title: Client Component
description: A React component that runs in the browser inside a Next.js App Router app.
tags:
  - nextjs
  - react
---

A **Client Component** runs in the browser and can use state, effects, event handlers, and browser APIs.

In the App Router, a file becomes a Client Component entry point by adding the `"use client"` directive at the top.

Client Components are needed for interactive UI, but they also add JavaScript to the client bundle.

A common pattern is to keep data loading in [[server-component|Server Components]] and isolate only the interactive parts as Client Components.
