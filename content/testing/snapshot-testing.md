---
title: Snapshot testing
description: Comparing serialized output against a stored reference snapshot.
tags:
  - testing
---

**Snapshot testing** serializes the output of code, such as a rendered component or a data structure, and compares it to a stored snapshot on later runs.

The first run records the snapshot; future runs fail if the output drifts from it.

It is fast to write, since you assert "looks like before" instead of spelling out every field.

The gotcha is rubber-stamping: when a snapshot fails, it is tempting to blindly update it without checking whether the change was intended.

Snapshots are also brittle on legitimate changes, producing large, noisy diffs. Keep them small and focused. [[../jest/|Jest]] popularized the technique.
