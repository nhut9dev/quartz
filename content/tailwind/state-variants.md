---
title: State variants
description: Applying Tailwind utilities only in a given interaction or structural state.
tags:
  - tailwind
  - css
---

**State variants** apply a utility only when a condition holds, using a prefix. Interaction states like `hover:`, `focus:`, `focus-visible:`, `active:`, and `disabled:` map to the matching CSS pseudo-classes.

```html
<button class="bg-black hover:bg-gray-800 disabled:opacity-50">Save</button>
```

For relationships between elements, `group-*` styles a child based on an ancestor, and `peer-*` styles an element based on a sibling — you mark the reference element with the `group` or `peer` class, then react to its state:

```html
<label class="group">
  <input class="peer" type="checkbox" />
  <span class="peer-checked:font-bold">Done</span>
</label>
```

`dark:` is the variant for [[dark-mode|dark mode]]. Variants stack, applied right-to-left as you read them: `dark:md:hover:bg-white` means "in dark mode, at md and up, on hover". The common mistakes are forgetting the `group`/`peer` marker class on the reference element, and expecting `group-hover` to work without it.
