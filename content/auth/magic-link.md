---
title: Magic link
description: Logging in via a one-time link emailed to the user, with no password.
tags:
  - auth
---

**A magic link** is a login method where the user receives a one-time link by email instead of entering a password.

Clicking the link proves the user controls the email address, which authenticates them.

It removes password storage and reuse problems, shifting trust onto the email account.

The link must be short-lived and single-use, much like a [[password-reset-flow|password reset]] token, so an intercepted link cannot be replayed.

It is convenient but inherits the security of the user's inbox, so it is often paired with [[mfa|MFA]] for sensitive systems.
