---
title: Accessible name
description: The name assistive technologies use to identify a control.
tags:
  - accessibility
---

An **accessible name** is the label [[screen-reader|assistive technologies]] use to identify an interactive element.

```html
<button aria-label="Close dialog">×</button>
```

For visible text buttons, the text usually becomes the accessible name automatically. Icon-only controls need a label through visible text or an [[aria]] attribute such as `aria-label` or `aria-labelledby`.

Accessible names should describe the action or object clearly. "Close dialog" is more useful than "X".
