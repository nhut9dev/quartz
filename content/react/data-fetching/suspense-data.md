---
title: Suspense for data fetching
description: Letting a component suspend while its data loads, with the fallback handled higher up.
tags:
  - react
  - data-fetching
  - rendering
---

**Suspense for data fetching** lets a component read data that may not be ready yet; if it isn't, the component suspends and the nearest [[../suspense|Suspense]] boundary shows its fallback until the data arrives.

This inverts the usual pattern. Instead of every component juggling its own `isLoading` branch, the loading UI lives once at a boundary, and the data-reading code reads as if the value were always there. It also unlocks **streaming SSR**: the server sends the page shell immediately and streams each section's HTML as its data resolves, so users see content progressively instead of waiting for the slowest query.

```jsx
<Suspense fallback={<Skeleton />}>
  <Profile />   {/* reads data; suspends until ready */}
</Suspense>
```

In practice you don't wire promises by hand. [[server-state|Server state]] libraries expose it via `useSuspenseQuery`, and React Server Components suspend naturally when you `await` data inside a [[../server-component-boundary|server component]]. Pair every Suspense boundary with an [[../error-boundary|error boundary]] — suspending handles the pending state, but a rejected request still needs somewhere to land. Beware fetch waterfalls: a component that only starts fetching once it renders can serialize requests, so fetch as early as you can.
