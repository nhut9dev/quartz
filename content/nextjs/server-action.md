---
title: Server Action
description: A Next.js feature for invoking server-side functions from forms or client interactions.
tags:
  - nextjs
  - react
---

A **Server Action** is a server-side function, part of the [[react-server-components|React Server Components]] model, that can be called from a form or client interaction.

It is useful for [[mutation|mutations]] such as creating records, updating settings, and submitting forms.

Server Actions still need validation, authorization, and error handling. Treat them as backend entry points.

## How it works

A function marked `"use server"` (or defined in a file with that directive) is compiled by Next.js into its own server endpoint — calling it from the client is a network request under the hood, even though it reads like a normal function call. Passed to a `<form action={...}>`, the form posts to that endpoint directly, so the action runs **even if client JavaScript hasn't loaded yet** — progressive enhancement is built in. Called from a client event handler, it's an async call that serializes its arguments and return value across the network, the same way [[server-component|Server Component]] props are serialized.

## When to use

Use Server Actions for [[../react/data-fetching/mutation|mutations]] triggered by forms or client interactions within the same app — creating a record, updating a setting, deleting an item — where the action and the UI that triggers it live together. For an API meant to be called from outside the app (a separate client, a webhook target, a third party), a [[route-handler|Route Handler]] is the better fit since it's a stable, explicit HTTP contract rather than a function reference.

## Trade-offs

Server Actions remove the boilerplate of defining a route, writing a `fetch` call, and wiring up form state — the function *is* the endpoint. The trade-off is that this convenience hides the network boundary: it's easy to write a Server Action like a trusted internal function call and forget it's exposed as a public HTTP endpoint with the same trust level as any other route.

## Pitfalls

Because a Server Action compiles to a real endpoint, **anyone can call it directly with arbitrary arguments**, not just through your form — validation, authorization, and input sanitization must happen inside the action itself, exactly as in a Route Handler; the form's client-side validation is a UX nicety, not a security boundary. The other common miss is forgetting [[revalidate-path|`revalidatePath`/`revalidateTag`]] after a mutation — the action succeeds and the database updates, but cached pages keep showing the old data until the cache is explicitly told it's stale.
