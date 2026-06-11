---
title: Server-side rendering
description: The server renders components to HTML on each request, then the client hydrates it.
tags:
  - web
  - rendering
---

**Server-side rendering (SSR)** renders the component tree to HTML on the server for each incoming request and sends ready-to-show markup. The browser displays content immediately, then downloads JavaScript and [[hydration|hydrates]] the page to make it interactive.

```txt
request → server renders HTML → browser shows it → JS hydrates
```

## How it works

Each request runs the components on the server with that request's data, producing full HTML. Because the browser receives real content (not an empty shell), first paint is fast and crawlers get something to index — the two things plain [[csr|client-side rendering]] struggles with.

## Choosing among rendering strategies

The decision is about *who* the page is for and *when* its data is known. SSR fits pages that depend on request-specific data — the logged-in user, live results. [[ssg|Static site generation]] renders once at build time and fits content that's the same for everyone. [[isr|ISR]] is the middle ground: pre-rendered but periodically refreshed. CSR is fine for behind-auth dashboards where SEO and first paint don't matter.

## Pitfalls

Every request re-renders, so traffic becomes CPU, and time-to-first-byte is tied to your slowest data fetch — cache aggressively. Server render has no `window` or `document`, so browser-only code must move into effects. And the server and client must produce the same output or you get a [[hydration|hydration]] mismatch. For large pages, [[streaming|streaming]] sends a shell first so users see something before the whole tree finishes.
