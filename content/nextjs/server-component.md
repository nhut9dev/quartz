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

## How it works

A Server Component's render happens entirely on the server — its imports, its data-fetching code, any server-only libraries (a database client, an API key) never get bundled for the browser. What crosses the network is a serialized description of the rendered output (the "RSC payload"), not the component's source. Because of this, only serializable values can cross from a Server Component into a [[client-component|Client Component]]'s props — plain objects, arrays, strings, numbers — not functions, class instances, or closures. The one deliberate exception is [[server-action|Server Actions]], which Next.js specially serializes as callable references.

## When to use

Default to Server Components for anything that reads data, accesses secrets/credentials, or doesn't need interactivity — which in the App Router is everything unless a file declares `"use client"`. Convert to a Client Component only for the specific leaf that needs [[../react/use-state|state]], effects, event handlers, or browser APIs — the composition pattern is a Server Component page that fetches data and passes it as props/children to a small Client Component island.

## Trade-offs

Server Components ship zero component code to the browser — only their rendered output — which is the App Router's main lever for reducing client JS. The cost is the restriction itself: no hooks, no event handlers, no `useEffect`, no direct access to `window`/`localStorage`. Any interactive piece has to be factored out into its own Client Component, which adds a server/client seam to the component tree that wasn't there in a fully client-rendered app.

## Pitfalls

Importing a server-only module (a database client, a file-system call) into a file that a Client Component also imports breaks the boundary — the bundler tries to include that server-only code in the client bundle, which either fails the build or, worse, leaks server-only code/credentials into the browser if it doesn't fail. The `"use client"` boundary is also "viral downward": once a module is marked client, everything *it* imports becomes part of the client bundle too, even modules that don't themselves use client features — so a single misplaced `"use client"` can pull a large dependency tree into the browser bundle.
