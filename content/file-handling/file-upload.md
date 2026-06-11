---
title: File upload
description: The flow for sending user-selected files from a client to a backend or storage service.
tags:
  - file-handling
  - backend
  - frontend
---

A **file upload** moves a file selected by the user into a system controlled by the application.

The common flow is: user selects a file, frontend validates basic constraints, backend validates again, file bytes are stored, metadata is saved, and the client receives an identifier or URL.

Small files can be uploaded through the application server. Large files often use [[direct-upload|direct upload]] to object storage so the backend does not become the bottleneck.

Treat uploads as untrusted input. Validate type, size, extension, ownership, and intended use before serving or processing the file.
