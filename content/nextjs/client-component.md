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

## How it works

`"use client"` at the top of a file marks the **module boundary**, not just that one component — every component exported from that file, and everything that file imports (that isn't itself separately boundary-marked), is bundled and shipped to the browser. A Server Component can render a Client Component by importing and using it normally; the reverse — importing a Server Component's source directly into a Client Component file and rendering it as JSX there — doesn't work, because by the time that module is part of the client bundle, its "Server Component" code has no server to run on.

## When to use

Push `"use client"` as far down the tree as possible — onto the specific interactive leaf (a button, a form field, a dropdown) rather than a whole page or layout. The Server Component above it does the data fetching and passes results down as props; the Client Component handles only the interactive slice.

## Trade-offs

A small, leaf-level Client Component boundary keeps most of the tree server-rendered with minimal client JS, but means data has to flow from Server Component to Client Component via props — if the Client Component needs more data later, that prop chain has to be extended. A large Client Component boundary (e.g. an entire interactive page) avoids that prop-plumbing but pulls everything in that subtree — including parts that don't need interactivity — into the client bundle.

## Pitfalls

The fix for "I need to render a Server Component inside a Client Component" is **composition, not import** — pass the Server Component as `children` or another prop from a shared Server Component parent; a Client Component can render whatever was passed to it without needing to know it's a Server Component. Trying to `import` and directly render a Server Component from within a `"use client"` file either errors or silently converts that component into a client-bundled one, defeating the point of it being a Server Component.
