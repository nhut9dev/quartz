---
title: File storage system
description: A system for uploading, storing, processing, and serving user files.
tags:
  - system-design
  - storage
  - file-handling
---

A **file storage system** handles uploading, storing, processing, and serving user files — and its defining decision is to **separate metadata from bytes**.

## Core design

File *bytes* live in [[../file-handling/object-storage|object storage]] (S3, GCS) built for large blobs, cheap durability, and direct serving. File *metadata* — owner, filename, content type, size, status, permissions — lives in a database, which is queryable and transactional in ways a blob store isn't. The database row is the system of record that points at the blob; the blob is just bytes. This split lets each side use the right tool: relational queries and access checks on metadata, cheap scalable storage and CDN delivery for content.

## The upload and serve path

The key move is keeping large bytes *off* the application server. Uploads use [[../file-handling/presigned-url|presigned URLs]]: the app authorizes the upload and returns a short-lived URL, then the client uploads bytes directly to object storage, and a callback (or event) marks the metadata row complete. Serving works the same way in reverse — a presigned download URL or a CDN in front of the bucket — so file traffic never bottlenecks the app tier. Large or flaky uploads use resumable/multipart so a dropped connection doesn't restart from zero.

## Production concerns

- **Access control** — a presigned URL is a bearer token; scope it tightly (short TTL, specific object) and enforce [[../file-handling/file-access-control|authorization]] when minting it.
- **Async processing** — virus scanning, image resizing, and transcoding run off a [[../messaging/message-queue|queue]] after upload, with the file marked "processing" until done.
- **Lifecycle** — orphaned blobs (upload started, never completed) and deleted-but-not-purged files need cleanup jobs, or storage cost and exposure grow unbounded.
- **CDN caching** — public files are served from a [[../caching/cdn-cache|CDN]]; private ones need signed URLs so the CDN doesn't leak them.

## Pitfalls

Routing file bytes *through* the app server is the classic scaling mistake — it ties up request threads and memory on I/O that object storage should handle directly. A two-step "create metadata, then upload bytes" flow always has a failure window where one half completed; reconcile with a status field and a cleanup job rather than assuming both succeed. And deletion must remove *both* the row and the blob — deleting only the row leaves bytes that still cost money and may still be reachable by an old URL.
