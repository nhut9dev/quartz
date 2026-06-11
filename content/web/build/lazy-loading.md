---
title: Lazy loading
description: Deferring work until it is actually needed to reduce initial cost.
tags:
  - web
  - performance
---

**Lazy loading** defers work until it is actually needed, rather than doing it all up front. The initial load stays cheap, and the deferred cost is paid only when (and if) the user reaches that part of the app.

It shows up in several forms: loading code with a dynamic `import()` or `React.lazy` paired with [[suspense|Suspense]], loading images with `loading="lazy"` so off-screen pictures wait until you scroll, and fetching data on demand instead of all at once.

The common thread is timing: the work still happens, just later and only when warranted. This trims initial download, parse, and render time, at the cost of a small delay when the deferred resource is finally requested.

Lazy loading pairs naturally with [[code-splitting]]: splitting decides *where* the boundaries are, lazy loading decides *when* each chunk is fetched. The [[bundler]] wires the two together from your dynamic imports.
