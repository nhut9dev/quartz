---
title: Presigned URL
description: A temporary URL that grants limited permission to upload or download an object.
tags:
  - file-handling
  - security
---

A **presigned URL** grants temporary access to a specific storage operation.

It is commonly used so a browser can upload directly to object storage without receiving permanent storage credentials.

Good presigned URLs are short-lived, scoped to one object key, constrained by method, and generated only after authorization checks.

Do not treat possession of a presigned URL as proof of user identity. It is a temporary capability that should expire quickly.
