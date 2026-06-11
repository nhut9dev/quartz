---
title: File download
description: Serving stored files back to users through direct links, redirects, or backend proxying.
tags:
  - file-handling
  - backend
---

A **file download** returns a stored file to an authorized user.

Public files can often be served through a CDN. Private files usually need authorization before returning a temporary link or streaming bytes through the backend.

Important response headers include `Content-Type`, `Content-Length`, `Content-Disposition`, `Cache-Control`, and sometimes `ETag`.

Use `Content-Disposition: attachment` when the file should download instead of rendering inline.
