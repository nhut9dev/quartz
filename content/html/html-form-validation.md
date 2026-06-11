---
title: HTML form validation
description: Built-in constraint checks the browser runs before a form submits.
tags:
  - html
  - forms
---

**HTML form validation** is the browser's built-in constraint checking. By adding attributes to a control you describe valid values, and the browser blocks submission and shows a message when the input does not match — no JavaScript required.

```html
<input type="email" required />
<input type="number" min="1" max="10" />
<input pattern="[A-Za-z]+" title="Letters only" />
```

## The constraint validation API

`required` forbids empty, the [[input-type|input type]] constrains format (`email`, `url`), `pattern` matches a regular expression, and `min`/`max` bound numbers and dates. These drive the `:valid` and `:invalid` CSS pseudo-classes, and JavaScript can reach the same machinery: `checkValidity()`, the `validity` object, and `setCustomValidity()` to inject your own rule into the native flow.

## Styling and UX

On a failed [[form-submit|form submit]] the browser focuses the first invalid field and shows a native bubble. Add `novalidate` on the [[form-element|form]] to suppress native UI when you want full control, and use `setCustomValidity` to replace the default message text.

## Pitfalls

Client-side validation is **UX, not security** — it's trivially bypassed, so the server must validate every input again. The native bubbles are inconsistent across browsers and barely stylable, which is why many teams script their own messaging. `pattern` is implicitly anchored to the whole value, and a `required` field hidden via CSS still blocks submit, which can deadlock a form.
