---
title: Route params
description: Dynamic values parsed from the URL path.
tags:
  - react
  - routing
---

**Route params** are dynamic values captured from the URL.

```txt
/users/:userId
```

For `/users/42`, the `userId` param is `42`. Route params are commonly used to fetch detail data with [[../data-fetching/tanstack-query|TanStack Query]].

```jsx
const { userId } = useParams()
```

Always treat params as external input. Convert and validate them before using them as numbers, IDs, or API inputs.
