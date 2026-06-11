---
title: HTML document
description: The overall skeleton of an HTML page, from the doctype to the head and body.
tags:
  - html
  - structure
---

An **HTML document** is the top-level structure the browser parses to build a page. It starts with `<!DOCTYPE html>`, then a root `<html>` element with a `lang` attribute, which contains two children: `<head>` for metadata and `<body>` for visible content.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>My page</title>
  </head>
  <body>
    <h1>Hello</h1>
  </body>
</html>
```

The `<head>` holds things the user does not see directly: the title, [[meta-tags|meta tags]], and links to stylesheets. The `<body>` holds everything rendered on screen, assembled from each [[html-element|HTML element]]. Set `lang` so screen readers and translation tools pick the right language. Reach for this structure whenever you start a new page from scratch.
