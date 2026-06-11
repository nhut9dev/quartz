---
title: Frontend file input
description: The browser form control for selecting local files.
tags:
  - file-handling
  - frontend
  - html
---

A **frontend file input** lets the user pick files from their device.

```html
<input type="file" accept="image/*" multiple />
```

The selected files are exposed as `File` objects. Frontend code can read names, sizes, MIME types, and previewable object URLs.

The `accept` attribute improves the picker experience, but it is not a security boundary. The backend must still validate every uploaded file.
