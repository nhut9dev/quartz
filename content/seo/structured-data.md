---
title: Structured data
description: Machine-readable metadata that helps search engines understand page entities and content types.
tags:
  - seo
  - metadata
---

**Structured data** is machine-readable metadata that helps search engines understand page entities and content types.

### How it works

Structured data is commonly added as JSON-LD using Schema.org vocabulary. It can describe articles, products, breadcrumbs, FAQs, organizations, recipes, events, reviews, and other page types.

Search engines use it to understand entities and eligibility for rich results, but the visible page content still has to support the markup. Structured data should describe what is actually on the page.

### When to use

Use structured data when a page has a clear supported type: product, article, documentation breadcrumb, local business, event, or review. It pairs with [[on-page-seo|on-page SEO]] and [[../web/meta-tags|meta tags]].

### Trade-offs

Structured data can improve result presentation, but it adds maintenance cost. If prices, ratings, availability, or titles drift from the visible page, the markup becomes misleading.

### Pitfalls

Do not mark up content that users cannot see, invent fake ratings, or add every possible schema type. Invalid or spammy markup can be ignored and may create manual review risk.
