---
title: bfcache
description: The back-forward cache that can preserve an entire page when users navigate away and back.
tags:
  - browser
  - performance
---

**bfcache** (back-forward cache) stores a page in memory so back and forward [[navigation-lifecycle|navigation]] can restore it instantly.

## How it works

Unlike the HTTP cache, which stores responses, bfcache freezes the *whole live page* — JavaScript heap, DOM, and scroll position — and pauses it when you navigate away. Going back restores that frozen state in a frame, with no reload, no refetch, and no re-execution. The page learns it was restored through the `pageshow` event's `persisted` flag (and is frozen on `pagehide`), which is where you refresh anything that may be stale.

## What blocks eligibility

A page is made ineligible by anything that can't be safely frozen: an `unload` event listener, a `Cache-Control: no-store` response, or open connections like an in-flight request or a live WebSocket. Browsers also have their own restrictions, and silently skip bfcache rather than warn.

## Pitfalls

The big trap is assuming a page always reloads from scratch — on restore your JavaScript state is exactly as you left it, so a timestamp, auth state, or feed can be stale; re-sync inside `pageshow` when `persisted` is true. Listen on `pagehide`, never `unload` (which both breaks bfcache and is unreliable). Chrome DevTools has a bfcache tester that reports why a page was excluded.
