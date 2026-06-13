---
title: Clipboard API
description: Reading and writing the system clipboard from JavaScript.
tags:
  - dom
  - browser
---

The **Clipboard API** (`navigator.clipboard`) reads and writes the system clipboard from JavaScript — `writeText()`/`readText()` for plain text, and `write()`/`read()` for rich content (HTML, images) via `ClipboardItem`.

```js
await navigator.clipboard.writeText("Copied!")
```

It requires a secure context (HTTPS) and, for most operations, a recent user gesture (a click). Calling `writeText()` outside a click handler — or after an async gap that loses the page's "user activation" — often fails silently or rejects with a permission error.

Reading the clipboard (`readText()`) additionally requires explicit permission and can prompt the user, unlike writing in response to a click, which is generally allowed without a prompt. Related: [[../accessibility/index|Accessibility]] for making a "copy" button keyboard-operable and announced to screen readers.
