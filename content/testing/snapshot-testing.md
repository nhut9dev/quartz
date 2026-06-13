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

## How it works

A serializer converts the value under test — a rendered component tree, a JSON object, CLI output — into a stable text representation. The first run writes that text to a snapshot file and passes automatically. Every later run re-serializes the current output and diffs it against the stored file; any difference, however small, fails the test and prints the diff.

## When to use

Snapshots fit output that's tedious to assert field-by-field but easy to recognize at a glance — a rendered component tree, a generated config file, formatted CLI output, an error message format. They're a weaker choice when individual fields in the output matter for the behavior under test — there, an explicit assertion documents *why* that value matters, which a snapshot can't.

## Trade-offs

Snapshots are fast to write because there's no assertion to design — but that's also their limit. A snapshot records "what the output currently is", not "what it should be", so it can't distinguish an intentional change from a regression. The judgment call moves entirely to whoever reviews the diff.

## Pitfalls

The most common failure is the update-and-commit reflex: a failing snapshot gets accepted with `-u` without reading the diff, turning the test into one that always passes on the next run regardless of what changed. Large snapshots — a whole page's rendered tree — make this worse, since one unrelated change produces a sprawling diff that buries the line that actually matters. And snapshots that capture non-deterministic values — timestamps, generated IDs, randomized ordering — fail intermittently unless those values are normalized before serializing.
