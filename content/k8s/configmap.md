---
title: ConfigMap
description: A Kubernetes object for non-secret configuration data.
tags:
  - kubernetes
  - configuration
---

**ConfigMap** is a Kubernetes object for non-secret configuration data.

ConfigMaps can be exposed to [[pod|pods]] as environment variables, command arguments, or mounted files. They keep environment-specific settings out of the [[../docker/docker-image|container image]].

Use ConfigMaps for plain configuration such as feature flags, URLs, log levels, and app settings that are safe to read.

Do not put passwords, tokens, or private keys in a ConfigMap. Use a [[secret|Secret]] or an external secret manager.
