---
title: Docker network
description: A virtual network that lets containers communicate with each other and the host.
tags:
  - docker
  - networking
---

**Docker network** is a virtual network that lets containers communicate with each other and the host.

In [[docker-compose|Docker Compose]], services on the same network can usually reach each other by service name. Exposing a port publishes container traffic to the host; it is not required for container-to-container communication on the same network.

Use networks to separate stacks, avoid host port conflicts, and model how services talk in production.

Common mistakes include connecting to `localhost` from one container expecting another container, publishing ports unnecessarily, and forgetting that DNS names inside Docker are different from hostnames outside Docker.
