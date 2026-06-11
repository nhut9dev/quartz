---
title: File storage system
description: A system for uploading, storing, processing, and serving user files.
tags:
  - system-design
  - storage
  - file-handling
---

A **file storage system** usually separates metadata from file bytes.

Metadata lives in a database; bytes live in object storage or a blob store. Uploads often use [[../file-handling/presigned-url|presigned URLs]] so large files do not flow through the application server.

Production concerns include access control, virus scanning, image processing, lifecycle cleanup, CDN caching, and safe deletion. See [[../file-handling/object-storage|Object storage]] and [[../file-handling/file-access-control|File access control]].
