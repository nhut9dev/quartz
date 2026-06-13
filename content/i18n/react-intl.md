---
title: react-intl
description: React components and hooks for ICU MessageFormat-based translations.
tags:
  - i18n
  - react
---

**react-intl** (part of FormatJS) provides React components and hooks for formatting messages, dates, numbers, and plurals using **ICU MessageFormat** syntax — a standardized syntax for plurals, select cases, and rich text embedded directly in the message string.

```jsx
<FormattedMessage
  id="cart.items"
  defaultMessage="You have {count, plural, one {# item} other {# items}} in your cart"
  values={{ count }}
/>
```

Unlike [[i18next|i18next's]] namespace-based key lookup with separate pluralization suffixes, ICU MessageFormat encodes plural and select logic inside the message string itself — each locale's translation is self-contained, but translators need to understand ICU syntax (or use tooling that abstracts it).

`useIntl()` gives access to `formatDate`, `formatNumber`, and `formatMessage` outside of JSX, all driven by the same locale data as the components.
