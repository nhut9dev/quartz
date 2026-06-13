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

## How it works

A page object wraps the locators and actions for one page or component behind a class, so tests call `loginPage.login(email, password)` instead of repeating `page.getByLabel("Email").fill(...)` in every test. When the page's markup changes, only the page object's internals need updating — tests that call its methods stay unchanged.

## When to use

Introduce a page object once a workflow — login, adding an item to a cart, a multi-step form — is repeated across multiple tests; the repetition is what the page object removes. For a one-off interaction used in a single test, the indirection adds a file and a lookup step without saving anything.

## Trade-offs

Centralizing locators turns a markup change into a one-line fix instead of a find-and-replace across the suite — but it adds a layer between the test and the page, so understanding what a test actually does means opening the page object too.

## Pitfalls

A page object that wraps every assertion as well as every action hides the test's intent entirely — `loginPage.loginAndExpectSuccess(email, password)` says nothing about what "success" means without reading the method body, where a few inline lines would have shown it directly. The opposite failure is a page object so thin it just renames `page.getByRole(...)` calls one-to-one — at that point it's an indirection layer that removes no real duplication.
