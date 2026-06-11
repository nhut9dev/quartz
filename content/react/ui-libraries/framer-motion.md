---
title: Motion (Framer Motion)
description: A declarative animation library for React.
tags:
  - react
  - ui-library
  - animation
---

**Motion** (formerly Framer Motion) animates React components declaratively: you describe the target state as props and the library handles the transition, instead of writing imperative keyframes or managing timers.

A `motion` element takes `initial`, `animate`, and `transition` props. `AnimatePresence` is the key piece for *exit* animations — React removes a node immediately on unmount, so the library holds it in the tree long enough to animate out.

```jsx
<AnimatePresence>
  {open && (
    <motion.div
      initial={{ opacity: 0, y: 8 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: 8 }}
    />
  )}
</AnimatePresence>
```

Beyond simple tweens it offers layout animations (auto-animating position and size changes between renders), gesture props (`whileHover`, `whileTap`, `drag`), and spring physics. It reads the user's [[../../accessibility/reduced-motion|reduced-motion]] preference, so respect that rather than animating unconditionally. For one-off fades a plain [[../../css/transition|CSS transition]] or [[../../css/css-animation|CSS animation]] is lighter; reach for Motion when you need orchestration, exit animations, or gestures.
