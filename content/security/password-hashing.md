---
title: Password hashing
description: Storing password verification data without storing the original password.
tags:
  - security
---

**Password hashing** converts a password into a one-way value used for later verification.

Applications should not store plain-text passwords. If the database leaks, plain passwords become immediate account takeovers.

Password hashes should use a slow, password-specific algorithm such as Argon2, bcrypt, or scrypt, with a unique salt per password.

General hashes like SHA-256 are not enough for password storage because they are too fast to brute-force at scale.
