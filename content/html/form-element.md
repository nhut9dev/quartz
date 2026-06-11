---
title: Form
description: The container that groups inputs and submits them to a server.
tags:
  - html
  - forms
---

A **form** is a `<form>` element that groups related inputs and sends their values somewhere. Its `action` attribute is the URL that receives the data, and `method` is the HTTP verb, usually `get` or `post`.

```html
<form action="/signup" method="post">
  <label>Email <input type="email" name="email" required /></label>
  <button type="submit">Sign up</button>
</form>
```

When the user activates a submit button, the browser performs a native [[form-submit|form submit]]: it gathers each named control, runs [[html-form-validation|HTML form validation]], and sends the data. Inside the form you place controls, most often an [[input-type|input]] with a chosen type. Use a real `<form>` rather than wiring buttons by hand so that built-in validation, keyboard behavior, and submission work for free.
