---
title: File metadata
description: Database data that describes an uploaded file and how the application should use it.
tags:
  - file-handling
  - database
---

**File metadata** is the structured record that describes a stored file.

Typical fields include owner ID, storage key, original name, MIME type, size, checksum, upload status, visibility, created time, and processing status.

The file bytes usually live in [[object-storage|object storage]], while metadata lives in the application database.

Metadata lets the application enforce ownership, display file lists, retry processing, delete files, and avoid exposing raw storage details to clients.
