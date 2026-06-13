---
title: SVG
description: An XML-based vector graphics format where each shape is a DOM node.
tags:
  - graphics
  - browser
---

**SVG** (Scalable Vector Graphics) is an XML-based vector format where each shape — `<rect>`, `<circle>`, `<path>` — is its own element in the DOM, stylable with CSS and scriptable like any other node.

```html
<svg viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="40" fill="tomato" />
</svg>
```

## How it works

Each SVG shape becomes a real DOM node with its own attributes (`fill`, `stroke`, `d`). The browser includes it in the page's normal render tree, so SVG goes through the same layout/paint/composite pipeline as HTML — shapes can have their own event listeners, CSS transitions, and `:hover`/`:focus` styles.

## When to use

Use SVG for icons, logos, diagrams, and graphics where element count stays in the dozens-to-low-hundreds and individual shapes need interactivity, styling, or accessibility — each element can carry its own `aria-label`. For thousands of elements or pixel-level effects, [[canvas-api|Canvas]] scales better because its cost doesn't grow with DOM node count.

## Trade-offs

SVG's DOM-based model gives CSS styling, hover/focus states, an accessibility tree, and crisp rendering at any zoom level "for free" — but every shape is a DOM node the browser lays out and paints, so a chart with tens of thousands of points as `<circle>` elements gets slow in ways a canvas-based equivalent wouldn't.

## Pitfalls

Inline SVG inherits page styles and `currentColor` unless explicitly isolated, so an icon can unexpectedly change color or size depending on where it's embedded. Very large or deeply-nested SVG — complex illustrations, map data — slows down layout because the browser tracks every element individually. And `viewBox`/`preserveAspectRatio` mistakes are a common source of SVGs that render at the wrong size or get unexpectedly cropped.
