---
title: HTTP caching
description: Using HTTP headers so browsers and proxies can reuse responses instead of refetching.
tags:
  - caching
---

**HTTP caching** is the mechanism by which browsers and proxies store responses and reuse them, governed by response headers.

The `Cache-Control` header is central. `max-age` sets how long a response stays fresh; while fresh, clients reuse it without contacting the server. `no-store` forbids caching entirely.

Once a response goes stale, validators let the client revalidate cheaply. A conditional request carrying an [[etag|ETag]] or `Last-Modified` lets the server reply `304 Not Modified` with no body when nothing changed.

This turns the network into a cache layer that costs nothing to maintain in your application.

See [[stale-while-revalidate|stale-while-revalidate]] for serving stale data during revalidation, and [[../web/caching|web caching]] for the broader picture.
