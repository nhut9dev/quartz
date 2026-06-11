---
title: multipart/form-data
description: The HTTP request encoding commonly used for form fields plus file uploads.
tags:
  - file-handling
  - web
---

`multipart/form-data` is an HTTP request encoding for sending regular fields and files in one request.

Browsers create it naturally when a form with a file input is submitted, or when JavaScript sends a `FormData` object.

```js
const form = new FormData()
form.append("avatar", file)
```

Backends usually need multipart parsing middleware because the request body is not plain JSON.
