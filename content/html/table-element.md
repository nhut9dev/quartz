---
title: Table
description: Structured markup for tabular data with header and body rows.
tags:
  - html
  - content
---

A **table** is a `<table>` element for genuinely tabular data: values that line up in rows and columns. It groups rows into `<thead>` and `<tbody>`, with `<tr>` for each row, `<th>` for header cells, and `<td>` for data cells.

```html
<table>
  <caption>Team scores</caption>
  <thead>
    <tr><th scope="col">Name</th><th scope="col">Score</th></tr>
  </thead>
  <tbody>
    <tr><th scope="row">Ada</th><td>42</td></tr>
  </tbody>
</table>
```

The `scope` attribute marks whether a `<th>` heads a column or a row, which lets assistive technology announce the right header for each cell. A `<caption>` and clear headers give the table its [[accessible-name|accessible name]] and context. Use a table only for data relationships, never for page layout, where [[css/|CSS]] belongs instead.
