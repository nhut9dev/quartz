---
title: Image processing
description: Backend work that transforms uploaded images into safer or more useful variants.
tags:
  - file-handling
  - image
  - backend
---

**Image processing** transforms uploaded images after validation.

Common steps include resizing, cropping, stripping metadata, converting format, generating thumbnails, and compressing for delivery.

Processing is often done asynchronously by a worker so the upload request can finish quickly.

Store the original only if the product needs it. Many apps store normalized variants and serve them through a CDN.
