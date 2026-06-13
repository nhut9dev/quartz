---
title: Web Share API
description: Opening the device's native share sheet from a web page.
tags:
  - dom
  - browser
---

The **Web Share API** (`navigator.share()`) opens the device's native share sheet — the same one apps use — letting the user share a URL, text, or files to any installed app (Messages, email, social apps) without the page implementing share-target integrations itself.

```js
if (navigator.canShare?.({ url, title })) {
  await navigator.share({ url, title, text })
}
```

It requires a secure context and a user gesture, and is only available on browsers/platforms that expose a share sheet — mainly mobile Safari/Chrome and some desktop browsers, not all. Check `navigator.canShare()` before calling `share()`, with a fallback such as a copy-link button for browsers that don't support it.

`share()` returns a promise that rejects with `AbortError` if the user cancels the share sheet — that rejection is normal and shouldn't be treated as an error.
