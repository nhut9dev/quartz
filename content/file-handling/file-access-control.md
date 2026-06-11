---
title: File access control
description: Authorization rules that decide who can read, write, update, or delete a file.
tags:
  - file-handling
  - security
---

**File access control** decides who can upload, view, replace, share, or delete a file.

Rules usually depend on ownership, workspace membership, role, file visibility, and the resource the file is attached to.

Avoid exposing raw bucket paths as permanent public identifiers for private files. Use application IDs and authorize every private access.

For direct uploads and downloads, generate short-lived permissions only after checking the user's right to perform that action.
