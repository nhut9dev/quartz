---
title: Viewport meta tag
description: The HTML meta tag that controls how mobile browsers size the layout viewport.
tags:
  - dom
  - mobile
---

The **viewport meta tag** — `<meta name="viewport" content="width=device-width, initial-scale=1">` — tells mobile browsers how to size the page's layout viewport. Without it, mobile browsers default to a desktop-width viewport (typically 980px) and shrink the whole page to fit, making text unreadably small.

`width=device-width` sets the layout viewport to match the device's screen width in CSS pixels, and `initial-scale=1` sets the initial zoom so one CSS pixel maps to one viewport pixel. Together, this is the baseline for any responsive design that uses [[../css/media-query|media queries]] and [[../css/responsive-design|responsive layout]], since breakpoints are evaluated against the layout viewport's width.

`user-scalable=no` or `maximum-scale=1` disable pinch-zoom — this is an accessibility anti-pattern, since it blocks low-vision users from zooming to read text, and should generally be avoided regardless of how "locked down" a design is supposed to feel.
