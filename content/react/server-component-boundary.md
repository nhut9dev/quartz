---
title: Server Component boundary
description: The line between React Server Components and Client Components, and what crossing it costs.
tags:
  - react
  - nextjs
---

A **Server Component boundary** is the line where React moves from server-rendered component code to client-side interactive component code.

Server Components run only on the server: they can read databases and secrets, and their component JavaScript never ships to the browser. Client Components run in the browser and can use state, effects, event handlers, and browser APIs. The boundary is where one hands off to the other, and where it sits determines bundle size, data access, and interactivity.

## How it works

A file marked `"use client"` — and everything it imports — becomes part of the client bundle. The directive marks an *entry point* into client land, not a per-component switch: once you cross, you stay client-side down that import chain. Server Components are the default; you opt into the client only where you need interactivity.

## Crossing the boundary

A Server Component can render a Client Component and pass it props, but those props must be **serializable** — they're serialized on the server and rehydrated on the client. Plain data crosses fine; functions, class instances, and `Date`-like objects do not. The escape hatch is `children`: a Server Component can pass server-rendered JSX *through* a Client Component as a prop, keeping that subtree on the server while the client wrapper adds interactivity around it.

## Pitfalls

Pushing the boundary too high turns an interactive leaf into a whole client tree, bloating the bundle — keep `"use client"` at the leaves. Importing server-only code (db client, secrets) into a Client Component leaks it to the browser. Passing a non-serializable prop across the boundary is a runtime error. See [[../web/react-server-components|React Server Components]], [[../nextjs/server-component|Server Components]], and [[../nextjs/client-component|Client Components]].
