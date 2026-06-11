---
title: Password reset flow
description: A secure reset using a short-lived single-use token sent out of band.
tags:
  - auth
---

**A password reset flow** lets a user who has lost their password set a new one without help from an administrator.

The system sends a token out of band, usually by email, to prove the user controls the account.

That token must be random, short-lived, and single-use, so it cannot be guessed or replayed.

The reset should invalidate existing sessions and tokens so a stolen session does not survive the change.

Store the new password with [[../security/password-hashing|password hashing]], never in plain text. The mechanics resemble a [[magic-link|magic link]].
