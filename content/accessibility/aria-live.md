---
title: aria-live
description: An ARIA attribute for announcing dynamic content changes to assistive technologies.
tags:
  - accessibility
  - aria
---

`aria-live` is an [[aria]] attribute that marks a region whose updates should be announced by [[screen-reader|assistive technologies]].

```html
<div aria-live="polite">Saved</div>
```

Use live regions for status messages, [[html-form-validation|validation feedback]], background updates, and async results that appear without moving [[focus-management|focus]].

Avoid overusing assertive announcements. Too many interruptions make an interface harder to use.
