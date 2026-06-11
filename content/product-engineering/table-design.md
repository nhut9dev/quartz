---
title: Table design
description: Designing data tables for scanning, comparison, and repeated work.
tags:
  - product-engineering
  - frontend
---

**Table design** focuses on scanning, comparison, filtering, and repeated action over structured records.

Useful tables make important columns visible, align numeric data, preserve row identity, and keep sorting, filtering, selection, and pagination predictable.

Tables should define empty, loading, error, filtered, and permission states instead of only the happy path.

Large tables often need [[../frontend-performance/virtualization|virtualization]], [[../api-design/pagination-strategy|pagination]], and careful accessibility support.
