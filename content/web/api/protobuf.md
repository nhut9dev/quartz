---
title: Protocol Buffers
description: A schema-driven binary serialization format used as the wire format for gRPC.
tags:
  - web
  - api
  - serialization
---

**Protocol Buffers** (protobuf) are a language-neutral, schema-first format that serializes structured data into a compact binary wire format, used as the default payload for [[grpc|gRPC]].

## How it works

You define messages in a `.proto` IDL, where every field gets a name, type, and a **field number**. A compiler (`protoc`) generates typed classes for each language, so the schema is the single source of truth for both sides of the wire.

```protobuf
message User {
  uint64 id = 1;
  string name = 2;
  repeated string emails = 3;
}
```

On the wire, protobuf writes the field *number* and a type tag, not the field name — so `name` costs a few bytes plus the value, with no quotes, braces, or repeated keys. That makes it far smaller and faster to parse than [[json|JSON]].

## Design choices

Field numbers are the contract, not the names. Once assigned, a number must never be reused for a different field — that's what makes protobuf forgiving for [[../api-design/backward-compatibility|backward compatibility]]: old readers skip unknown numbers, and new optional fields are invisible to clients that don't know them. You can freely rename a field (names are local to codegen) but never renumber one.

## Tradeoffs

The cost is human-readability and tooling: a binary payload can't be inspected with `curl` or eyeballed in logs, and you need the schema plus a decoder to read it. JSON stays the better fit for browser-facing or debuggable APIs; protobuf wins for high-volume, internal service-to-service traffic.
