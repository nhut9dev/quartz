---
title: Offline-first
description: A mobile app design approach that keeps core behavior useful without a network.
tags:
  - mobile
  - architecture
---

**Offline-first** means an app is designed to keep core behavior useful when the network is slow, unreliable, or unavailable.

Mobile networks change constantly. Users move through elevators, trains, buildings, and weak coverage areas, so a mobile app cannot assume stable connectivity.

Offline-first apps usually cache data locally, queue writes, show sync status, and handle conflicts when the device reconnects.

The hard part is deciding which data can be stale, which actions can be queued, and how to recover when server state changed while the app was offline.

## How it works

The app treats local storage as the primary source of truth for the UI: reads come from a local database (SQLite, WatermelonDB, Realm) or cache, and writes go to that local store **first**, immediately updating the UI, before being placed in a sync queue. A background process drains the queue against the server when connectivity is available, and incoming server changes are merged back into the local store — the UI never waits on the network for either reads or writes.

## When to use

Offline-first earns its complexity for apps where users need core functionality without connectivity — note-taking, field-service/inspection apps, chat (composing and queuing messages), anything used in transit or in low-coverage environments. It's not worth it for apps that are inherently online — a live sports score feed or a real-time collaborative editor has nothing meaningful to show "offline," so the local-first machinery adds cost without adding value.

## Trade-offs

Writing locally first makes the app feel instant — there's no spinner waiting for a round trip — and the app remains usable through network interruptions. The cost is architectural: every mutation needs a local-write path, a queue entry, retry logic, and a conflict-resolution strategy for when the same data was changed both locally and on the server while offline. This is substantially more code than "call the API and show a loading state," and bugs in the sync logic can cause data loss or duplication that's hard to reproduce because it depends on timing and connectivity sequences.

## Pitfalls

Conflict resolution is the genuinely hard part: if a record is edited on two devices while both are offline, "last write wins" silently discards one user's changes with no indication anything was lost — for some data that's acceptable, for others (financial records, collaborative documents) it's a real bug. The UI also needs to communicate sync state honestly — if a save shows as "successful" immediately (because it succeeded locally) but later fails to sync and gets reverted or flagged as conflicted, a user who already moved on will be confused and may lose trust in the app. Queued mutations that reference data deleted server-side while offline (editing a record someone else deleted) need explicit handling — retrying forever against a resource that no longer exists just wastes the queue.
