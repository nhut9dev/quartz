---
title: Resumable upload
description: Uploading a large file in chunks so an interruption can resume instead of restarting.
tags:
  - file-handling
  - architecture
---

A **resumable upload** splits a large file into chunks and tracks how many have arrived, so a dropped connection resumes from the last good chunk rather than starting the whole transfer over.

## How it works

The client first creates an upload session and gets back an upload URL or ID. It then sends the file in fixed-size chunks, and after each chunk the server records the new offset. If the connection drops, the client asks the server "how many bytes do you have?" and continues from there. When the final chunk lands, the server assembles (or finalizes) the object and returns its location. The **tus** protocol standardizes exactly this handshake over HTTP; cloud object stores expose their own multipart upload APIs that work the same way.

This complements [[direct-upload|direct upload]] and [[presigned-url|presigned URLs]]: the chunks can go straight to [[object-storage|object storage]], with the backend only issuing credentials and confirming completion.

## Why not a single request

A plain [[multipart-form-data|multipart/form-data]] POST of a multi-gigabyte file is all-or-nothing — a timeout at 95% wastes everything, and the server must hold or stream the whole body. Chunking bounds the cost of a failure to one chunk, enables real [[upload-progress|progress]] and pause/resume, and lets chunks upload in parallel.

## Pitfalls

Retries mean the same chunk can arrive twice, so chunk writes must be idempotent — address each chunk by its byte offset (or an [[idempotency-key|idempotency key]]) rather than appending blindly. Incomplete sessions leave orphaned chunks that need a TTL and cleanup job. Validation (size limits, type, [[virus-scanning|virus scanning]]) can only run after assembly, so the file must be treated as untrusted until the session is finalized and verified.
