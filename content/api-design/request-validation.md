---
title: Request validation
description: Checking incoming API data before business logic runs.
tags:
  - api
  - security
---

**Request validation** checks incoming data before business logic uses it.

Validation should verify required fields, types, ranges, formats, enum values, and cross-field rules. It should reject unexpected input early with a clear [[error-response-format|error response format]].

Validation is not only for user experience. It also protects the system from malformed payloads, unexpected states, and some classes of security bugs.

Request validation complements [[../security/input-validation|input validation]], database constraints, and typed contracts such as an [[openapi-contract|OpenAPI contract]].
