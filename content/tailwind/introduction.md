---
title: Tailwind CSS
description: A utility-first CSS framework that composes small classes in markup instead of writing custom CSS.
tags:
  - tailwind
  - css
---

**Tailwind CSS** is a utility-first CSS framework. Instead of inventing class names and writing matching CSS, you compose small single-purpose utilities directly in the markup.

```jsx
<button className="rounded bg-black px-3 py-2 text-white hover:bg-gray-800">
  Save
</button>
```

## How it works

Tailwind has no runtime. A build-time engine scans your source for the class names you actually use and generates only those rules into the final stylesheet, so the CSS stays small no matter how many utilities exist. Tailwind v4 ships a faster engine that detects source files automatically; v3 needed an explicit `content` list.

## Trade-offs

The wins: no naming bikeshedding, no dead CSS, a consistent spacing/color scale that acts as built-in [[../css/design-token|design tokens]], and styles colocated with markup so there's no jumping between files. The costs: markup gets verbose, you have to learn the utility vocabulary, and dense class strings look noisy at first.

## Pitfalls

Long class strings hurt readability — extract a [[../react/react-component|component]] rather than reaching for [[apply-directive|@apply]]. Class names must appear as **complete static strings**; building them by concatenation (`` `text-${color}` ``) makes the engine miss them and the style gets stripped. And leaning on [[arbitrary-values|arbitrary values]] everywhere throws away the consistency the scale was giving you. Tailwind pairs naturally with [[../react/ui-libraries/shadcn-ui|shadcn/ui]] and headless primitives.
