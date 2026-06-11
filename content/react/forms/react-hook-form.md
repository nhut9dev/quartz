---
title: React Hook Form
description: A popular form library for React with uncontrolled inputs and efficient validation.
tags:
  - react
  - form
  - library
---

**React Hook Form** is a popular form library that keeps forms efficient by leaning on uncontrolled inputs and refs.

```jsx
function LoginForm() {
  const { register, handleSubmit } = useForm()

  return (
    <form onSubmit={handleSubmit(values => console.log(values))}>
      <input {...register("email")} />
      <button type="submit">Log in</button>
    </form>
  )
}
```

Use it when forms need validation, field errors, default values, dirty state, and integration with schema tools like [[zod|Zod]].
