---
title: Anchor and link
description: The navigable a element versus the metadata link element.
tags:
  - html
  - content
---

`<a>` and `<link>` sound alike but do different jobs. An **anchor** `<a href>` is a clickable hyperlink in the page body that navigates to another location. A **link** `<link>` sits in the `<head>` and connects the document to external resources like stylesheets.

```html
<a href="/docs" target="_blank" rel="noopener">Docs</a>
<a href="https://example.com">External</a>

<link rel="stylesheet" href="styles.css" />
```

An `href` may be relative, resolved against the current page, or absolute with a full URL. `target="_blank"` opens a new tab, and you should pair it with `rel="noopener"` so the new page cannot access the opener. A `<link>`, by contrast, is never clicked: it loads stylesheets, icons, and other metadata, complementing the page's [[meta-tags|meta tags]] and [[seo|SEO]]. Use `<a>` to send users somewhere, and `<link>` to attach resources to the document.
