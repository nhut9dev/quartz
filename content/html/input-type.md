---
title: Input type
description: How the type attribute changes an input's UI, keyboard, and validation.
tags:
  - html
  - forms
---

The `type` attribute on `<input>` tells the browser what kind of value a control collects, which changes its appearance, on-screen keyboard, and built-in validation.

```html
<input type="text" />
<input type="email" />
<input type="number" min="0" />
<input type="checkbox" />
<input type="radio" name="plan" />
<input type="date" />
<input type="file" />
<input type="password" />
```

`text` is the plain default. `email` and `number` adjust the mobile keyboard and reject malformed values. `checkbox` and `radio` are toggles, with radios sharing a `name` to form a group. `date` and `file` open native pickers, and `password` masks the characters. Each type that constrains its value also feeds [[html-form-validation|HTML form validation]]. Always place inputs inside a [[form-element|form]] and pick the most specific type for the data you want.
