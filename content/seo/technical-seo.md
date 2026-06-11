---
title: Technical SEO
description: Making a site crawlable, indexable, fast, and technically understandable to search engines.
tags:
  - seo
  - web
---

**Technical SEO** is making a site crawlable, indexable, fast, and technically understandable to search engines.

### How it works

Search engines discover URLs, crawl HTML, render pages when needed, select canonical versions, understand links and structured data, then decide whether a page should enter the index. Technical SEO removes blockers in that pipeline.

The basics are stable URLs, real HTML content, correct HTTP status codes, clean redirects, a useful [[xml-sitemap|XML sitemap]], sensible [[robots-txt|robots.txt]], correct [[canonical-url|canonical URLs]], and pages that do not depend on fragile client-only rendering. Rendering choices connect directly to [[../web/ssr|SSR]], [[../web/ssg|SSG]], and [[../web/csr|CSR]].

### When to use

Use technical SEO checks before launching a public site, after migrations, when changing routing, and when search traffic drops. It matters most for content sites, marketing pages, ecommerce, documentation, marketplaces, and any page that needs organic discovery.

### Trade-offs

Technical SEO can improve discoverability, but it cannot make weak content rank by itself. Over-optimizing crawl controls, redirects, or canonical rules can also hide good pages from search.

### Pitfalls

Common failures include blocking important pages in `robots.txt`, shipping empty HTML, returning `200` for missing pages, duplicating URLs without canonicals, breaking redirects during migration, and putting important links behind JavaScript-only interactions.
