---
title: React Server Components
description: Components that render only on the server and ship zero JavaScript to the client.
tags:
  - react
  - rendering
---

**React Server Components (RSC)** are components that render only on the server and ship zero JavaScript to the client. They can read server resources directly, querying a database, reading the file system, or calling an internal service, without exposing that code or its dependencies to the browser.

Because their code never reaches the client, RSC keep heavy libraries out of the [[bundler|bundle]], shrinking download size. They interleave with regular [[react-component|client components]]: a server component can render an interactive client child, but not the reverse, since client code can't run server-only logic.

```txt
server component  → renders on server, 0 JS shipped
client component  → renders + hydrates in the browser
```

RSC are a React-specific model, most visible in the Next.js App Router. Unlike plain [[ssr|server-side rendering]], which sends HTML that the client then [[hydration|hydrates]] in full, server components send a description of UI and only the client parts get hydrated.
