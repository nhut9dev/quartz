---
title: Image preview
description: Showing a selected local image before it has been uploaded.
tags:
  - file-handling
  - frontend
  - image
---

An **image preview** shows a selected image before upload completes.

In the browser, previews are often built with `URL.createObjectURL(file)` or `FileReader`.

Object URLs should be revoked when no longer needed to avoid leaking memory.

Preview is for user experience only. The backend still needs to validate and process the image before trusting it.
