---
title:
description:
tags:
  -
---

A **term** is ... — open by bolding the term and defining it in one sentence. Don't add a `# Title` (Quartz renders it from `title`). Fill `description` with one sentence; it feeds SEO and the index pages.

When the note mentions another existing or useful future note, link it with a [[wikilink]] inline instead of leaving the relationship implicit.

Then choose the tier that fits the topic. Both are first-class — pick by what the topic is, not by habit.

## Tier 1 — Atomic concept (most notes)

A single fact, hook, definition, or API. Stay flat: 2–4 short paragraphs, an optional small code snippet, related notes linked inline with [[wikilink]]. Keep it lean — don't pad `useState` with five headings.

## Tier 2 — Load-bearing topic (go deep here)

A mechanism, a design decision, anything with trade-offs or failure modes (reconciliation, a caching strategy, a rate limiter). **This is where seniority shows.** A one-paragraph gloss on a load-bearing topic is exactly what caps a note at beginner depth, so give it real structure. Headings follow the topic — these are the usual ones, not a fixed menu:

### How it works

The actual mechanism, not just what it does. Name the internals (Fiber lanes, the event loop, the index B-tree) so the reader can *reason*, not memorize.

### When to use

Concrete fit and anti-fit: "use when ... / not worth it when ...".

### Trade-offs

Benefit vs cost vs risk. Being explicit about what you give up is the senior signal.

### Pitfalls

The edge case, the failure mode, the thing that breaks in production.

<!--
Pre-publish self-check (keep as a comment, not page content):
[ ] description is one clear sentence
[ ] the term is bolded in the first sentence
[ ] related notes are linked with [[wikilink]]
[ ] a load-bearing topic names its mechanism, a trade-off, AND a failure mode
-->
