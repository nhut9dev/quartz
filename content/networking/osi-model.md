---
title: OSI model
description: A seven-layer reference model describing how network functions are organized.
tags:
  - networking
---

**The OSI model** is a conceptual framework that splits networking into seven layers, each with a defined job, from physical signals up to application data.

The layers are physical, data link, network, transport, session, presentation, and application.

Each layer talks only to the layers directly above and below it, so a change in one layer does not ripple through the rest.

It matters as a shared vocabulary: people say "layer 3" for IP routing or "layer 7" for HTTP and everyone understands.

The tradeoff is that real protocol stacks like TCP/IP do not map cleanly onto all seven layers, so the model is a teaching tool more than an exact blueprint.
