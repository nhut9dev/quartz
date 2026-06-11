---
title: Middleware
description: Code that runs between receiving a request and sending a response.
tags:
  - web
  - backend
---

**Middleware** is code that runs in the request pipeline before the final response is sent. It can inspect the request, add data, reject the request, or pass control to the next step.

Common middleware handles logging, authentication, parsing the [[request-body|request body]], [[cors|CORS]], compression, rate limits, and error handling.

```txt
request -> middleware -> middleware -> controller -> response
```

Middleware keeps cross-cutting behavior out of every [[controller|controller]]. The risk is hiding too much work in the pipeline, so middleware should have a clear, narrow responsibility.
