---
title: Authentication vs authorization
description: Authentication proves identity; authorization decides what that identity may do.
tags:
  - auth
---

**Authentication versus authorization** is the distinction between proving who you are and deciding what you are allowed to do.

Authentication answers "who are you?" by verifying credentials such as a password, a [[passkey|passkey]], or an [[mfa|MFA]] factor.

Authorization answers "are you allowed to do this?" by checking permissions, often via [[rbac|RBAC]] or [[abac|ABAC]].

They run in order: you authenticate first, then the system authorizes each action.

Confusing the two is a common bug, such as proving identity but never checking whether that identity has access to the resource.
