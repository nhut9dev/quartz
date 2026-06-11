---
title: Infrastructure as code
description: Defining servers, networks, and services declaratively in version-controlled files.
tags:
  - deployment
---

**Infrastructure as code** (IaC) is the practice of describing infrastructure in machine-readable files that are committed, reviewed, and applied like application code.

Instead of clicking through a cloud console, you write a declaration of the desired infrastructure, such as a Terraform file, and a tool reconciles the real environment to match.

This makes provisioning reproducible: the same files recreate identical environments, and changes go through code review and version history.

It also kills configuration drift, where manually tweaked servers diverge over time and become impossible to recreate.

The tradeoff is upfront effort and a learning curve, plus the need to keep [[secrets-management|secrets]] out of the committed files.

IaC underpins reliable [[ci|continuous integration]] and reproducible [[kubernetes|Kubernetes]] clusters.
