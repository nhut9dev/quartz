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

## How it works

The server begins sending the HTTP response using chunked transfer encoding before rendering finishes, and the browser parses and renders each chunk as it arrives rather than waiting for the connection to close. Suspense boundaries mark which subtrees can be deferred: the server sends a placeholder for that boundary first, continues rendering the rest of the page, and once the slow data resolves, sends the real markup along with a small inline script that swaps it into place.

## When to use

Streaming helps most on pages with one or more slow data dependencies alongside content that's ready quickly — a dashboard whose shell and navigation render instantly while a slow widget loads, or a product page where core details are fast but recommendations are slow.

## Trade-offs

Streaming improves perceived performance without changing total server work, but it turns one response into multiple flushes — anything that needs the complete response before acting (certain proxies, response-size-based logic, some CDN configurations) may buffer the whole thing anyway and need explicit configuration to pass chunks through as they arrive.

## Pitfalls

A chunk that streams in late still delays everything below it in the DOM, and if its content has a different height than the placeholder, it can cause a layout shift after the user has already started reading the page. Status codes and headers must be decided before the first chunk is sent — if an error occurs after streaming has started, the response has already committed to `200`, so the error can only be reflected in the rendered content, not the HTTP status.
