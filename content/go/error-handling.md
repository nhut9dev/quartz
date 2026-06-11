---
title: Error handling
description: Go treats errors as ordinary return values handled explicitly rather than thrown exceptions.
tags:
  - go
  - error-handling
---

In **Go**, errors are ordinary values returned from functions and checked explicitly — there are no exceptions for normal failures.

## How it works

A function returns an `error` as its last value, and the caller decides what to do right there:

```go
f, err := os.Open(path)
if err != nil {
    return fmt.Errorf("open config: %w", err)
}
```

The `%w` verb **wraps** an error, preserving the original while adding context. Callers later inspect the chain with `errors.Is` (does it match a sentinel?) or `errors.As` (can it be cast to a type?), rather than catching by class. For truly exceptional, unrecoverable situations there is `panic`, which unwinds the stack, and `recover`, which can stop that unwind inside a deferred function.

## vs try/catch

`try/catch` lets errors propagate invisibly up the stack until some handler catches them, which is concise but easy to ignore. Go's explicit `if err != nil` is verbose but makes every failure path visible at the call site, so handling is a deliberate choice, not an afterthought.

## Pitfalls

Swallowing an error (`_ = doThing()`) hides failures and is a common source of silent bugs. Reserve `panic` for programmer errors and genuinely unrecoverable states; using it for ordinary control flow defeats the explicit model and surprises callers.
