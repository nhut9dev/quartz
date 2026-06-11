---
title: robots.txt
description: A crawl control file that tells well-behaved bots which paths they may fetch.
tags:
  - seo
  - technical-seo
---

**robots.txt** is a crawl control file that tells well-behaved bots which paths they may fetch.

It controls crawling, not indexing. A blocked URL can still appear in search if other pages link to it, but the crawler may not fetch the page content to understand it.

Use `robots.txt` to keep crawlers away from low-value crawl paths such as internal search results, infinite parameter combinations, or private-looking generated routes. Use `noindex` on the page itself when the goal is to keep a crawlable page out of the index.

The main pitfall is blocking assets or pages that search engines need to render and evaluate public content. Always test production rules after migrations.
