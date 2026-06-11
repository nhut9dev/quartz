---
title: SEO
description: Making pages discoverable, understandable, crawlable, and worth ranking by search engines.
tags:
  - web
  - seo
---

**SEO** (search engine optimization) is the practice of making pages discoverable, understandable, crawlable, and worth ranking by search engines.

This web note covers the rendering-specific part: crawlers need real content, links, headings, and metadata in the HTML they can fetch or render. The fuller SEO map lives in [[../seo/|SEO]] and breaks the work into [[../seo/technical-seo|technical SEO]], [[../seo/on-page-seo|on-page SEO]], [[../seo/content-seo|content SEO]], and [[../seo/internal-linking|internal linking]].

The biggest technical pitfall is rendering. A [[csr|client-only]] app ships an almost empty HTML shell and fills the page with JavaScript after load. Crawlers that do not execute or wait for that JavaScript may index a blank page, so your content effectively does not exist for ranking.

[[ssr|Server-side rendering]] and [[ssg|static generation]] fix this by putting the real content in the initial HTML response, so crawlers and social previews get text, headings, and links immediately. For content-driven sites where search traffic matters, prefer SSR or SSG over pure client rendering, then handle [[../seo/title-tag|title tags]], [[../seo/meta-description|meta descriptions]], [[../seo/canonical-url|canonical URLs]], [[../seo/xml-sitemap|XML sitemaps]], and [[core-web-vitals|Core Web Vitals]].
