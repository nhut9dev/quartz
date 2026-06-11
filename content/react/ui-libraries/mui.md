---
title: MUI
description: A full-featured React component library based on Material Design.
tags:
  - react
  - ui
  - library
---

**MUI** is a full-featured React component library based on Material Design. It includes many ready-made components, theming, layout utilities, and enterprise-oriented packages.

Use MUI when a project needs a broad component set quickly and the Material-style design language is acceptable.

Compared with headless tools like [[radix-ui|Radix UI]], MUI gives more out of the box but also brings stronger visual and architectural opinions.

```jsx
import Button from "@mui/material/Button"

function SaveButton() {
  return <Button variant="contained">Save</Button>
}
```

MUI is especially practical for admin panels, dashboards, internal tools, and teams that want consistent components without designing every primitive from scratch.

The tradeoff is customization. You can theme MUI deeply, but if the product needs a highly custom visual language, a lower-level stack like [[tailwind-css|Tailwind CSS]] plus [[radix-ui|Radix UI]] may feel easier to bend.
