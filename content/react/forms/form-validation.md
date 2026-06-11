---
title: Form validation
description: Checking form values and showing useful errors before or after submit.
tags:
  - react
  - form
---

**Form validation** checks whether form values are acceptable before continuing. Validation can happen on change, on blur, on submit, or after a server response.

```jsx
function validateEmail(email) {
  if (!email) return "Email is required"
  if (!email.includes("@")) return "Email is invalid"
  return null
}
```

Client validation improves feedback, but the server must still validate important data. Browser code can be bypassed.

For larger forms, use a form library like [[react-hook-form|React Hook Form]] and a schema library like [[zod|Zod]].
