---
title: WCAG
description: The Web Content Accessibility Guidelines used to evaluate accessible web content.
tags:
  - accessibility
---

**WCAG** stands for Web Content Accessibility Guidelines.

WCAG organizes accessibility around four principles: perceivable, operable, understandable, and robust.

It includes success criteria for [[alt-text|text alternatives]], [[keyboard-navigation|keyboard access]], [[color-contrast|contrast]], focus, error handling, and compatibility with assistive technologies.

WCAG is not only a checklist. It is a baseline for building interfaces that more people can use reliably.

## How it works

Each of the four principles (Perceivable, Operable, Understandable, Robust — POUR) breaks down into guidelines, and each guideline into testable **success criteria**, numbered like `1.4.3` (contrast) or `2.1.1` (keyboard). Every criterion is assigned a conformance level — **A** (minimum), **AA** (the level most laws and policies require), or **AAA** (enhanced, rarely required site-wide). "WCAG 2.1 AA" means every success criterion at level A and AA in version 2.1 is met. Later versions (2.2) add criteria on top of earlier ones rather than replacing them.

## When to use

**AA** is the practical target for almost all public-facing products — it's what accessibility laws (ADA, EN 301 549, AODA) and most procurement requirements reference. Use WCAG criteria as acceptance criteria during development (contrast ratios, focus visibility, alt text) rather than only as a post-launch audit checklist — retrofitting AA compliance into an already-built interface is far more expensive than building to it from the start.

## Trade-offs

WCAG conformance is testable and gives legal/procurement teams a concrete bar, which is its main value — "AA compliant" is a defensible claim in a way "we care about accessibility" isn't. But conformance is not the same as *usability*: an interface can pass every automated AA check (correct contrast ratios, valid ARIA, alt text present) and still be confusing or unusable with a screen reader if the experience wasn't actually tested with one. Treat WCAG as a floor, not a definition of done.

## Pitfalls

Automated scanners (axe, Lighthouse) catch roughly a third of WCAG issues — contrast ratios, missing alt attributes, missing form labels — but cannot detect whether focus order makes sense, whether an [[aria-live|live region]] announcement is useful, or whether a custom widget's keyboard interaction matches what a [[screen-reader|screen reader]] user expects. A site can score 100 on automated audits and still be unusable for real assistive-technology users. Conversely, teams sometimes target AAA for individual criteria (like 7:1 contrast) where it's easy, while missing AA criteria elsewhere that matter more — conformance should be tracked per-criterion across the whole product, not as a single aggregate score.
