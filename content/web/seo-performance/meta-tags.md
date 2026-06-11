---
title: Meta tags
description: Head tags that describe a page to browsers, search engines, and social platforms.
tags:
  - web
  - seo
---

**Meta tags** are `<head>` elements that describe a page to browsers, search engines, and social platforms. The common ones are `<title>`, `<meta name="description">` for search snippets, `<meta name="viewport">` for mobile layout, and Open Graph / Twitter Card tags that control how links unfurl into rich previews.

```html
<title>Getting Started with Quartz</title>
<meta name="description" content="A quick guide to publishing notes." />
<meta property="og:title" content="Getting Started with Quartz" />
```

These tags are part of [[seo]]: a clear title and description shape what users see in search results, and Open Graph tags decide the card shown when a link is shared.

For them to work reliably, they must be in the HTML that crawlers and scrapers receive. With [[ssr|server rendering]] the tags are present in the initial response, rather than injected later by client JavaScript that bots may never run.
