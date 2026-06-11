---
title: JSON
description: A lightweight, text-based data format of key-value objects and arrays.
tags:
  - web
  - data
  - json
---

**JSON** (JavaScript Object Notation) is a lightweight, text-based data format built from key-value objects and arrays. Despite its name it is language-independent, which is why it became the default body format for web APIs.

```json
{
  "id": 42,
  "name": "Ada",
  "roles": ["admin", "editor"]
}
```

In JavaScript, `JSON.stringify` turns an object into JSON text and `JSON.parse` turns text back into an object — the bridge between in-memory values and what travels over the wire. A response carrying JSON is marked with [[http-headers|Content-Type: application/json]], and it is the usual representation exchanged by a [[rest|REST]] API. Both browsers and the [[javascript-runtime|JavaScript runtime]] parse it natively.
