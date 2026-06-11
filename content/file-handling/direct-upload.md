---
title: Direct upload
description: Uploading file bytes from the client directly to object storage instead of proxying through the app server.
tags:
  - file-handling
  - architecture
---

A **direct upload** sends file bytes from the client directly to storage, usually with a temporary authorization token or [[presigned-url|presigned URL]].

The backend still controls the flow: it validates intent, creates the upload permission, and saves metadata after upload completes.

Direct upload reduces backend bandwidth and memory pressure, especially for images, videos, PDFs, and large attachments.

It adds coordination work around permissions, progress, retries, cleanup, and confirming that the uploaded object matches the expected constraints.
