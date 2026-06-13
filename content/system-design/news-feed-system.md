---
title: News feed system
description: A system that ranks and delivers posts or events to a user's feed.
tags:
  - system-design
  - product
---

A **news feed system** decides which items a user sees and in what order — combining a delivery problem (getting each post to the right feeds) with a ranking problem (ordering them well).

## The fan-out choice

The defining decision is *when* a post reaches a follower's feed — the [[fan-out|fan-out]] trade:

- **Fan-out on write (push)** — when someone posts, write it into all their followers' precomputed feeds. Reads are instant (just read your feed), but a post fans out to as many writes as the author has followers.
- **Fan-out on read (pull)** — store the post once; build each feed by pulling from followed accounts when the user opens the app. Writes are cheap, reads are heavy.

Push suits the common case (people read far more than they post, so paying at write time and reading cheaply wins).

## The celebrity problem

Pure push breaks on high-follower accounts: a post by someone with tens of millions of followers triggers tens of millions of feed writes — a [[../caching/hot-key|hot-key]] spike that can overwhelm the system. The standard fix is **hybrid**: push for ordinary accounts, but for celebrity accounts skip the fan-out and **pull** their recent posts at read time, merging them into the feed when it's assembled. Most production feeds are some version of this split.

## Design concerns

- **Ranking** — chronological is simplest; relevance ranking (engagement, recency, affinity) improves quality but adds a scoring layer and a feature pipeline.
- **Freshness vs cost** — precomputed feeds can be stale; how aggressively to refresh trades storage and compute against how live the feed feels.
- **Privacy filtering** — blocked users, deleted posts, and visibility rules must be applied at read time, since a precomputed feed can contain items the viewer should no longer see.
- **Deduplication** — the same item arriving via multiple paths (push + pull merge) must be suppressed.

Start from the [[fan-out|fan-out]] decision; storage and ranking layers follow from it.
