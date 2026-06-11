---
title: Internationalization strategy
description: Preparing a frontend for multiple languages, locales, formats, and writing systems.
tags:
  - frontend-architecture
  - i18n
  - product-engineering
---

An **internationalization strategy** makes the interface adaptable to different languages, regions, date formats, number formats, currencies, plural rules, and text directions.

Retrofitting internationalization late is expensive because strings, layouts, validation, search, sorting, and analytics labels often assume one language or locale.

## What to externalize

User-visible strings should live outside component logic. Dates, numbers, currencies, units, and relative times should be formatted with locale-aware APIs instead of string concatenation.

Pluralization matters: many languages do not follow English singular/plural rules. Avoid building messages by stitching translated fragments together; translators need the full sentence context.

## Layout concerns

Text expansion can break compact buttons, tables, nav items, and empty states. Components should tolerate longer labels and support right-to-left layout when the product needs RTL locales.

## Pitfalls

Do not use translated display text as stable IDs for analytics, tests, permissions, or routing logic. Keep stable machine keys separate from localized user-facing copy.

Related notes: [[../product-engineering/form-ux|Form UX]], [[../product-engineering/empty-state|Empty state]], [[../html/html-document|HTML document]], and [[../web/seo-performance/internationalization|Internationalization]].
