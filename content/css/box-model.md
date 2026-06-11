---
title: Box model
description: The CSS model that describes an element's content, padding, border, and margin.
tags:
  - css
  - layout
---

The **box model** describes the space an element occupies: content at the centre, optional padding around it, an optional border, and margin outside the border.

```css
.card {
  box-sizing: border-box;
  width: 320px;
  padding: 16px;
  border: 1px solid #ddd;
}
```

## content-box vs border-box

The default `content-box` applies `width` to the content only — padding and border are *added on top*, so the card above would actually render wider than 320px. `border-box` folds padding and border into the declared width, so 320px means 320px. The latter is almost always easier to reason about, which is why most stylesheets start with a global `* { box-sizing: border-box }`.

## Margins

Padding adds space *inside* an element (within its background); margin adds space *outside* (transparent). Vertical margins between adjacent blocks **collapse** — two stacked `20px` margins produce `20px` of gap, not `40px` — and a parent's margin can collapse with its first or last child's.

## Pitfalls

Forgetting the `border-box` reset means every padding change silently alters layout width. Margin collapse surprises people constantly (especially a child's top margin "leaking" out of its parent); padding/border or a flex/grid container stops it. Percentage padding is relative to the *width* of the containing block, even vertically — a handy trick for aspect ratios, a trap otherwise.
