---
title: Server Component
description: A React component rendered on the server in the Next.js App Router.
tags:
  - nextjs
  - react
---

A **Server Component** runs on the server and sends rendered output to the client without shipping its component code to the browser.

In the Next.js [[app-router|App Router]], components are Server Components by default.

They are useful for reading files, querying databases, loading private server data, and reducing client JavaScript.

Server Components cannot use browser-only APIs, event handlers, or client hooks such as [[../react/use-state|useState]].
