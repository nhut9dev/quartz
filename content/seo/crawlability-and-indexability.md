---
title: Crawlability and indexability
description: Whether search engines can reach a page and decide to store it in their index.
tags:
  - seo
  - technical-seo
---

**Crawlability and indexability** describe whether search engines can reach a page and decide to store it in their index.

Crawlability is about access: links, sitemaps, HTTP status codes, redirects, server errors, and [[robots-txt|robots.txt]]. Indexability is about permission and quality: `noindex`, [[canonical-url|canonical URLs]], duplicate content, soft 404s, and whether the page has enough value to keep.

A page can be crawlable but not indexable. For example, a crawler may fetch a page and then exclude it because of `noindex`, a canonical pointing elsewhere, duplicate content, or poor quality.

Public pages that matter should be linked from the site, return `200`, expose meaningful HTML, avoid accidental `noindex`, and appear in an [[xml-sitemap|XML sitemap]] when appropriate.

## How it works

Crawlers discover URLs through links and sitemaps, then fetch the HTML. For JavaScript-heavy pages, a second render pass is queued separately and can lag the initial crawl by days, so content that only appears after client-side rendering may be evaluated much later than the page itself. Once content is in hand, the crawler weighs the HTTP status, meta directives (`noindex`), [[canonical-url|canonical]] signals, and perceived content quality before deciding whether the page enters the index. Search engines also allocate a finite **crawl budget** per site, so low-value URLs compete with important ones for crawl attention.

## When to use

Use this distinction to diagnose why a page isn't showing up in search: is the problem that the crawler can't *reach* the page (a crawlability issue — broken links, blocked paths, server errors), or that it reached the page but chose not to *keep* it (an indexability issue — `noindex`, a canonical pointing elsewhere, thin or duplicate content)? The two have different fixes.

## Trade-offs

Blocking low-value paths — faceted navigation, internal search results, infinite parameter combinations — preserves crawl budget for pages that matter. But over-blocking is easy: blocking CSS or JS that the renderer needs, or blocking a path that actually contains pages worth indexing, removes those pages from consideration entirely rather than just deprioritizing them.

## Pitfalls

A `noindex` tag on a page that's also blocked by [[robots-txt|robots.txt]] is invisible to the crawler — it never fetches the page, so it never sees the tag, and the page can still appear in search (with no snippet) purely from external links pointing to it. A **soft 404** — a page that returns `200` but whose content says "not found" or is effectively empty — confuses indexability because the status code says "this is fine" while the content says otherwise. And content that only renders after user interaction or a delayed client-side fetch may never be seen if the crawler's render pass doesn't trigger that interaction.
