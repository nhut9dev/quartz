---
title: File validation
description: Checking uploaded files before accepting, storing, processing, or serving them.
tags:
  - file-handling
  - security
---

**File validation** checks whether an uploaded file is allowed and safe enough for the intended workflow.

Validate size, extension, MIME type, detected content type, image dimensions, filename behavior, and business rules such as allowed owner or attachment type.

Never trust only the client-provided filename or MIME type. They are useful hints, not proof.

Validation should happen before permanent use. Riskier files may also need [[virus-scanning|virus scanning]] or manual review.
