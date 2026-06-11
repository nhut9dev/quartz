---
title: Range request
description: Asking a server for only part of a resource using HTTP Range headers.
tags:
  - web
  - http
---

A **range request** lets a client fetch a byte range of a resource instead of the whole thing, using the `Range` header — the mechanism behind resumable downloads, video seeking, and parallel chunked transfers.

## How it works

The client sends `Range: bytes=0-1023`. A server that supports it replies `206 Partial Content` with the requested slice and a `Content-Range: bytes 0-1023/146515` header naming the slice and the total size. A server advertises support up front with `Accept-Ranges: bytes`; if it ignores the header it just returns the full `200 OK` body. Multiple ranges in one request are answered with a `multipart/byteranges` body.

## Why it matters

- **Media streaming** — a video player requests only the bytes around the current playhead, so seeking is instant and the whole file never downloads.
- **Resumable downloads** — an interrupted download restarts from where it stopped by requesting `bytes=<already-received>-`, instead of from zero.
- **Parallel fetching** — a client can pull several ranges concurrently and reassemble them.

## Pitfalls

Range correctness depends on the resource being stable, so conditional headers matter: pair `Range` with `If-Range` plus an [[etag|ETag]] so the server returns the full body (not a mismatched slice) if the resource changed mid-download. A `Range` whose start is past the end of the resource gets `416 Range Not Satisfiable`. [[cdn-cache|CDNs]] and proxies must honour and forward range semantics, and dynamically generated or compressed responses often cannot be ranged because the byte offsets are not stable. Range support is what makes large [[file-download|file downloads]] robust.
