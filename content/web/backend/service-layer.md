---
title: Service layer
description: Application logic separated from HTTP controllers and database details.
tags:
  - web
  - backend
---

A **service layer** holds application logic that should not live directly in a [[controller|controller]]. It coordinates rules, workflows, authorization decisions, and persistence calls behind a clearer API.

```js
async function createInvoice(input) {
  const customer = await customers.findById(input.customerId)
  return invoices.create({ customer, lines: input.lines })
}
```

Controllers can call services from HTTP, while tests, jobs, or command-line scripts can call the same services without pretending to be a web request.

Keep services focused on application behavior. If a service only forwards one call to a database method without adding meaning, it may be unnecessary abstraction.
