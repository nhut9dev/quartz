---
title: Component composition
description: Building UI by combining components instead of adding rigid configuration.
tags:
  - react
  - component
  - architecture
---

**Component composition** means building larger UI by combining smaller components. Instead of making one component handle every possible option, let callers pass content and pieces in.

```jsx
function Card({ title, children }) {
  return (
    <section>
      <h2>{title}</h2>
      {children}
    </section>
  )
}
```

Composition keeps components flexible without turning [[props|props]] into a long list of configuration flags.

```jsx
<Card title="Billing">
  <PlanSummary />
  <PaymentMethod />
</Card>
```

The [[children-prop|children prop]] is the simplest composition tool in React.
