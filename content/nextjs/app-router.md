---
title: App Router
description: The Next.js routing system based on the app directory and React Server Components.
tags:
  - nextjs
  - react
---

The **App Router** is Next.js's routing model built around the `app` directory.

It uses filesystem routes, layouts, nested segments, loading UI, [[error-boundary|error boundaries]], and [[react-server-components|React Server Components]].

The App Router changes how data fetching, rendering, and routing are organized compared with the older Pages Router.

## How it works

Each folder under `app/` is a route segment; special files inside it play defined roles — `page.tsx` is the segment's UI, `layout.tsx` wraps it and persists across navigation within that segment, [[loading-error-ui|`loading.tsx` and `error.tsx`]] provide [[suspense|Suspense]] and [[error-boundary|error boundary]] UI for the segment, `route.ts` makes it an API endpoint instead of a page. Nested folders nest their layouts, composing a tree of wrappers down to the leaf page. By default every component in `app/` is a [[server-component|Server Component]] — it renders on the server and only the result crosses the network, unless a file opts into [[client-component|`"use client"`]].

## When to use

The App Router is the default and recommended model for new Next.js projects — the older Pages Router (`pages/` directory) still works but is effectively legacy, kept for backward compatibility and incremental migration. Choose Pages Router today only when working in an existing codebase that hasn't migrated, or when relying on a library/pattern that assumes it.

## Trade-offs

The App Router's payoff is streaming, nested layouts that don't re-render on navigation, and [[server-component|Server Components]] that keep data-fetching code and its dependencies off the client bundle entirely. The cost is a more complex mental model: every file now has a server/client classification that affects what APIs it can use and what gets bundled, and caching behavior (`fetch` caching, the full route cache, segment-level revalidation) varies by version and configuration in ways the Pages Router's simpler `getServerSideProps`/`getStaticProps` didn't require.

## Pitfalls

Adding `"use client"` near the root of the tree (a top-level layout or page) makes everything rendered beneath it part of the client bundle, even subtrees that don't use any client features — losing the App Router's main JS-reduction benefit. The other recurring surprise is caching: `fetch` requests inside Server Components are cached by default in some configurations, so a mutation that changes underlying data doesn't show up on next load unless the affected path or tag is explicitly revalidated with [[revalidate-path|`revalidatePath`]]/`revalidateTag` — code that "should" show fresh data appears stuck on stale data, which looks like a bug in the mutation rather than a caching default.
