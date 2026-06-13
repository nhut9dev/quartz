---
title: Font loading
description: How web fonts affect rendering, layout, and perceived performance.
tags:
  - performance
  - css
---

**Font loading** controls how custom fonts are fetched and displayed.

Large fonts can delay text rendering or cause [[layout-shift|layout shift]] when swapped in.

Use fewer font families and weights, subset fonts when possible, and choose an appropriate `font-display` strategy.

System fonts are often the fastest option for dense application UIs.

## How it works

`font-display` controls what happens to text in the window between the page being ready to render and the custom font finishing download. `block` hides the text entirely (invisible) for a short period, then swaps to the custom font once loaded — "flash of invisible text" (FOIT). `swap` renders immediately with a fallback font, then swaps to the custom font when it arrives — "flash of unstyled text" (FOUT), which can shift layout if the fallback and custom font have different character widths/line heights. `optional` gives the custom font a very short window to load from cache; if it's not ready, the page commits to the fallback for that render and never swaps later.

## When to use

`swap` is the common default for body text — readers see content immediately, and the brief font swap is usually less disruptive than invisible text. `optional` fits decorative or non-essential fonts where a layout shift from swapping would be worse than occasionally falling back to a system font. For text that must match a specific custom font exactly and is small enough to matter (a logo, a hero heading), pair `font-display: swap` with `<link rel="preload">` on the font file so it starts downloading immediately rather than after CSS is parsed.

## Trade-offs

Fewer font families/weights and subsetting (shipping only the characters actually used) reduce both download size and the FOIT/FOUT window — but constrain design choices (fewer available weights) and can break if the subset is missing characters needed later (a new locale, special symbols, emoji).

## Pitfalls

`swap`'s fallback-then-swap can cause a visible, sometimes large layout shift (CLS) if the fallback font's metrics differ significantly from the custom font's — text reflows, pushing content below it down or up. This is often invisible on a fast connection (the swap happens in milliseconds) and very visible on a slow one. `font-display: block` (or omitting it, which some browsers historically treated similarly) risks genuinely invisible text for seconds on a slow connection — not just a performance metric, but a real readability problem for users on poor networks.
