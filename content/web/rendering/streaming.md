---
title: Streaming
description: The server sends HTML in chunks as it renders instead of waiting for the whole page.
tags:
  - web
  - rendering
---

**Streaming** lets the server send HTML in chunks as it renders, rather than buffering the entire page and sending it all at once. The browser starts displaying earlier parts while the server is still working on the rest.

This pairs naturally with [[ssr|server-side rendering]] and [[suspense|Suspense]]: you render an instant shell, mark slow sections (a feed, recommendations) with Suspense fallbacks, and stream each section in as its data resolves. The user sees a usable page immediately instead of waiting on the slowest query.

```txt
shell + spinners → stream slow chunk → stream next chunk → done
```

The streamed chunks arrive as server-rendered HTML, then [[hydration|hydration]] makes them interactive as they land. Streaming doesn't make the total work faster, it improves *perceived* load by showing something meaningful right away and filling in the gaps progressively.
