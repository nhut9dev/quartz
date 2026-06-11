---
title: Controller
description: A request-facing layer that coordinates input, application logic, and responses.
tags:
  - web
  - backend
---

A **controller** handles an incoming request at the application boundary. It reads inputs, calls the right application logic, and turns the result into an [[http|HTTP]] response.

In a small app, a controller might contain most of the route logic. In a larger app, it should stay thin and delegate business rules to a [[service-layer|service layer]].

```txt
route -> controller -> service -> database
```

The controller should know about request details like [[query-params|query params]], route params, and [[request-body|request bodies]]. Domain rules usually belong deeper than the controller so they can be reused outside HTTP.
