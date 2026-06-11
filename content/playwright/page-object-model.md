---
title: Page Object Model
description: A testing pattern that wraps page interactions behind helper objects.
tags:
  - playwright
  - testing
---

The **Page Object Model** wraps page-specific locators and actions behind a helper object.

```js
class LoginPage {
  constructor(page) {
    this.page = page
    this.email = page.getByLabel("Email")
  }

  async login(email) {
    await this.email.fill(email)
    await this.page.getByRole("button", { name: "Sign in" }).click()
  }
}
```

Page objects can reduce duplication when many tests use the same workflow.

Keep them thin. If a page object hides every assertion and action, tests become harder to read because the user flow disappears behind method names.
