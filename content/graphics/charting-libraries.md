---
title: Charting libraries
description: Libraries that render data as charts on top of SVG, Canvas, or D3.
tags:
  - graphics
  - frontend
---

**Charting libraries** turn data into bar, line, pie, or scatter charts, rendering to [[svg|SVG]] or [[canvas-api|Canvas]] under the hood.

## How it works

SVG-based libraries (Recharts, Victory) render each chart element as a DOM node, so React libraries like Recharts can describe a chart declaratively as nested components. Canvas-based libraries (Chart.js) draw the whole chart as pixels in one or more draw calls, redrawing the entire canvas on any change. D3 is lower-level than either — it's a toolkit for binding data to elements and computing scales/layouts, not a chart library itself. Libraries like Recharts and Victory use D3's math internally while exposing components.

## When to use

Recharts or Victory fit React apps that need standard chart types with a React-idiomatic API (props, composition) and don't need to go beyond what the library exposes. Chart.js fits when chart or data-point count is high enough that Canvas's pixel-based rendering matters, or the app isn't React-based. Reach for raw D3 only when the visualization is genuinely custom — something no off-the-shelf chart type covers — since D3 trades a steep learning curve for full control over the result.

## Trade-offs

SVG-based chart libraries give easy styling, CSS-driven animation, and accessibility hooks on individual data points, but render slowly with thousands of points. Canvas-based libraries handle large datasets better, but make individual points harder to style, animate, or expose to assistive tech — tooltips and interactions are hand-rolled with hit-testing against coordinates.

## Pitfalls

Re-rendering a large chart on every parent re-render — without memoization — is a common React performance issue, since chart libraries often re-run their whole layout/scale calculation on each render even when the data didn't change. Charts that convey information through color alone, without patterns, labels, or sufficient contrast, fail accessibility for colorblind users — see [[../accessibility/index|Accessibility]].
