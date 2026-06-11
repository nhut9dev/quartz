---
title: ARIA
description: Attributes that expose roles, states, and properties to assistive technologies.
tags:
  - accessibility
  - html
---

**ARIA** (Accessible Rich Internet Applications) is a set of attributes for describing roles, states, and properties to [[screen-reader|assistive technologies]].

```html
<button aria-expanded="false" aria-controls="menu">
  Menu
</button>
```

ARIA can improve custom widgets, but it does not add behavior by itself. If a `div` is given `role="button"`, [[keyboard-navigation|keyboard handling]] still has to be implemented manually.

Prefer [[semantic-html|semantic HTML]] whenever it already provides the role and behavior you need.
