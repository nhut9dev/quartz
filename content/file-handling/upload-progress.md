---
title: Upload progress
description: UI feedback that shows how much of a file upload has completed.
tags:
  - file-handling
  - frontend
---

**Upload progress** shows how much data has been sent from the browser.

It is most useful for large files, slow networks, mobile users, and workflows where upload completion blocks the next step.

Progress can be tracked with APIs that expose upload events, or through storage SDKs that report transferred bytes.

Always handle cancellation, retry, failure, and the final processing state. A file being uploaded is not always the same as a file being ready to use.
