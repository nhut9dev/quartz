---
title: Form architecture
description: Structuring production forms around ownership, validation, submission, and recovery.
tags:
  - react
  - form
  - frontend-architecture
---

**Form architecture** decides where form state lives, how validation is layered, how errors are shown, and how submission interacts with server state.

Small forms can use local controlled state. Larger forms often need field registration, schema validation, dirty tracking, async defaults, conditional fields, and a clear submit state machine.

## Validation layers

Client validation improves feedback speed, but server validation remains the source of truth for permissions, uniqueness, business rules, and security-sensitive checks.

Schema validation helps keep client and server expectations aligned, but field-level messages still need product-specific wording.

## Submission flow

Disable duplicate submits when the operation is not idempotent. Preserve user input after recoverable errors. Map server errors back to fields when possible, and show form-level errors for cross-field or system failures.

## Pitfalls

Avoid mixing remote entity state, draft form state, and UI state in one object. A user editing a draft should not accidentally mutate cached server data before submit.

Related notes: [[form-validation|Form validation]], [[react-hook-form|React Hook Form]], [[zod|Zod]], [[../../product-engineering/form-ux|Form UX]], and [[../data-fetching/mutation|Mutation]].
