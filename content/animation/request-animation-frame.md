---
title: requestAnimationFrame
description: Scheduling a callback to run right before the browser's next repaint.
tags:
  - animation
  - browser
---

**requestAnimationFrame** (rAF) schedules a callback to run right before the browser's next repaint, synced to the display's refresh rate (typically 60Hz, ~16.6ms per frame).

```js
function loop(timestamp) {
  // update positions based on timestamp
  requestAnimationFrame(loop)
}
requestAnimationFrame(loop)
```

## How it works

The browser calls rAF callbacks once per frame, right before painting — so code that updates visual state (position, canvas drawing) runs at exactly the right time to be picked up by that frame's paint, rather than at an arbitrary point that paint might miss or overwrite. Each callback receives a high-resolution timestamp, which frame-rate-independent animations use to compute how far to advance based on elapsed time rather than frame count.

## When to use

Use rAF for any JS-driven animation loop: canvas drawing, scroll-linked effects, or custom physics and easing that CSS or [[web-animations-api|WAAPI]] can't express. If the animation can be expressed as a CSS transition, keyframes, or WAAPI, prefer those — they can run on the compositor thread without depending on JS at all.

## Trade-offs

rAF automatically pauses in background tabs — the browser doesn't call it when the tab isn't visible — which saves battery and CPU for free. But it also means timing assumptions must account for large gaps when the tab regains focus, not just smooth ~16ms steps.

## Pitfalls

Computing each step as a fixed per-frame increment (`x += 2`) instead of scaling by elapsed time (`x += speed * deltaTime`) makes the animation run at different speeds on different refresh rates (60Hz vs 120Hz) or after a dropped frame. Each call only schedules the *next* frame — forgetting to call `requestAnimationFrame` again inside the callback stops the loop after one frame, and forgetting to `cancelAnimationFrame` on cleanup leaves a loop running against unmounted state.
