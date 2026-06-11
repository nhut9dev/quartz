---
title: Compression
description: Shrinking text responses with gzip or Brotli to cut transfer size over the network.
tags:
  - web
  - performance
---

**Compression** shrinks text-based responses, HTML, CSS, JavaScript, JSON, before they cross the network, cutting transfer size and improving load time. The two common algorithms are gzip, supported everywhere, and Brotli, which usually compresses static assets a bit smaller. It is negotiated through [[http-headers|HTTP headers]]: the client advertises what it accepts and the server marks what it sent.

```http
Accept-Encoding: br, gzip
Content-Encoding: br
```

Compression is complementary to [[minification|minification]]: minification removes redundant characters from the source, then compression squeezes the remaining bytes. Smaller responses reach the user faster, which directly helps [[core-web-vitals|Core Web Vitals]] like Largest Contentful Paint. It applies to text, not already-compressed formats like JPEG or PNG, where re-compressing wastes CPU for little gain. Most servers and CDNs enable it by default.
