---
title: HTML element
description: The tag-and-attribute building block the browser parses into nodes.
tags:
  - html
  - structure
---

An **HTML element** is a piece of content marked up with a tag. Most elements have an opening tag, content, and a closing tag, plus optional attributes that configure them. The browser parses these elements into a [[dom-tree|DOM tree]] of nodes.

```html
<a href="/about" class="link">About</a>
<img src="logo.png" alt="Company logo" />
<br />
```

Attributes live in the opening tag as `name="value"` pairs and supply things like links, classes, or identifiers. Most elements are containers that wrap content and need a closing tag. **Void elements** such as `<img>`, `<br>`, `<input>`, and `<meta>` have no content and therefore no closing tag. Choosing the right element matters for [[semantic-html|semantic HTML]] and the page's [[accessible-name|accessible name]]. Think in elements whenever you write or read markup.
