---
title: Destructive action design
description: Designing delete, reset, revoke, and irreversible actions to prevent accidental harm.
tags:
  - product-engineering
  - ux
  - safety
---

**Destructive action design** protects users from accidental damage.

Use stronger friction when the action is hard to undo, affects other users, or deletes valuable data. Confirmation should name the object and consequence, not just ask "Are you sure?"

Prefer undo, soft delete, or recovery windows when possible. See [[../database/soft-delete|Soft delete]] for the backend side of recoverable deletion.

## How it works

Friction should scale with the cost of being wrong. A low-stakes reversible action — archiving a draft — needs no confirmation. A moderate one — deleting a single item — fits an undo toast: the action runs immediately, with a few seconds to reverse it. A high-stakes, hard-to-reverse, or other-user-affecting action — deleting an account, removing a teammate, dropping a workspace — warrants a confirmation that names the specific object and consequence, and for the highest-stakes cases, requires typing the object's name to proceed.

## When to use

Reach for typed-confirmation or multi-step flows only for actions that are both hard to reverse and high-blast-radius. For everything else, prefer perform-then-undo: it gets out of the way for the overwhelming majority of intentional actions while still protecting against the occasional slip.

## Trade-offs

Heavier confirmation reduces accidental destructive actions but adds friction to every *intentional* one too — a user deleting dozens of items one by one will eventually click through confirmation dialogs without reading them, defeating their purpose ("dialog fatigue"). Undo-based designs avoid this cost on the happy path but require the backend to support recoverable deletion for the undo window — see [[../database/soft-delete|soft delete]].

## Pitfalls

A generic "Are you sure?" dialog that doesn't name what will be deleted trains users to click through it reflexively, so by the time something irreplaceable is gone, the confirmation habit has already worn smooth. Actions that affect *other users* — removing a teammate, revoking a shared resource — need confirmation copy that says so explicitly; "delete this?" reads very differently once the user understands it also signs someone else out.
