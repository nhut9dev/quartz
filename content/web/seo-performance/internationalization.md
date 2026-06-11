---
title: Internationalization
description: Adapting an app to different languages and regions, from translated strings to locale formatting.
tags:
  - web
  - i18n
---

**Internationalization** (often abbreviated i18n) is structuring an app so it can adapt to different languages and regions without code changes. It separates user-facing strings from code so they can be translated, and defers anything locale-specific, dates, numbers, currency, sort order, to runtime formatting rather than hard-coding it.

The browser's built-in `Intl` API handles much of the formatting correctly per locale.

```js
new Intl.NumberFormat('de-DE', { style: 'currency', currency: 'EUR' }).format(1234.5)
```

Beyond strings, the markup itself carries locale signals: the `lang` attribute on `<html>` aids screen readers and search engines, and `dir="rtl"` flips layout for right-to-left languages like Arabic and Hebrew. Localization (l10n) is the related step of supplying the actual translations and regional content. Plan for internationalization early; retrofitting it onto an app full of hard-coded English is far more painful.
