---
title: Object storage
description: Storage for files and blobs addressed by object keys rather than filesystem paths.
tags:
  - file-handling
  - storage
---

**Object storage** stores files as objects under keys inside buckets or containers.

It is commonly used for user uploads, images, videos, documents, backups, and static assets.

Object storage is usually better than local disk for production uploads because app instances can scale horizontally without sharing a filesystem.

Store application metadata in a database and file bytes in object storage. The database should know who owns the file, what it is for, and where the object lives.
