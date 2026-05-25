# swift-empty-primitives

The empty value — `Empty<Element>`, a storage-less type representing the "nothing" of a domain.

`Empty` carries no element and no behavior of its own. Each domain package attaches its
conformance to this single shared type — the empty iterator, the empty sequence, the empty
collection — so the empty case is defined once and reused across domains rather than
re-declared per agent (cf. the standard library's `EmptyCollection`, which is its own
iterator). `Element` is unconstrained (`~Copyable & ~Escapable`).

```swift
import Empty_Primitives

let nothing = Empty<Int>()
```

## License

Apache 2.0.
