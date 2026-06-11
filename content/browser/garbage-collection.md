---
title: Garbage collection
description: Automatic memory cleanup for objects that can no longer be reached.
tags:
  - browser
  - javascript
  - performance
---

**Garbage collection** (GC) is automatic memory cleanup for objects the program can no longer reach.

## How it works

The engine starts from *roots* — the call stack, globals, and live [[../javascript/closure|closures]] — and marks everything reachable from them. Anything not marked is unreachable and its memory is reclaimed (mark-and-sweep). Reachability, not reference counting, is the rule, which is why two objects referencing only each other can still be collected once nothing else points at them. Modern engines are generational and incremental, collecting short-lived objects often and spreading work across small pauses so the UI rarely stalls.

## Common leaks

A leak is just an object that stays *reachable* longer than it's useful. The usual culprits: event listeners never removed, `setInterval`/`setTimeout` left running, caches and arrays that only grow, detached DOM nodes still held by a JavaScript variable, and closures that capture a large scope and outlive their need.

## Pitfalls

You can't force GC, and a "memory leak" in JS is almost always a logic bug, not an engine fault. For caches that shouldn't keep their keys alive, use a `WeakMap`/`WeakRef` ([[../javascript/weakmap-weakset|weak collections]]) so entries vanish when the key is otherwise unreachable. Diagnose growth with the DevTools Memory panel — a heap snapshot that keeps climbing across the same action points straight at retained references. GC removes manual `free()`, but bounded caches and cleaning up long-lived resources are still your job.
