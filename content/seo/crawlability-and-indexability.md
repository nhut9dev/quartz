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
