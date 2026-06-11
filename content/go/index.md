---
title: Go
description: A compiled, statically typed language with built-in concurrency, popular for backend services.
tags:
  - go
  - backend
---

**Go** is a compiled, statically typed language built at Google for backend services, with first-class concurrency, fast startup, and a single static binary as its deployment artifact. Compared with [[../node/node-js-runtime|Node.js]], it trades a smaller standard library and more verbose code for predictable performance, real parallelism, and no runtime to ship.

Notes:

- [[goroutines|Goroutines]] — lightweight concurrent functions
- [[channels|Channels]] — typed communication between goroutines
- [[go-scheduler|Go scheduler]] — how goroutines map onto threads
- [[garbage-collection|Garbage collection]] — low-latency concurrent GC
- [[error-handling|Error handling]] — errors as values, no exceptions
- [[go-modules|Go modules]] — dependency management
- [[context-package|Context package]] — cancellation and deadlines
