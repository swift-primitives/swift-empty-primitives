# Empty Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The empty value — `Empty<Element>`, a storage-less type representing the "nothing" of a domain, defined once and shared across the family.

---

## Quick Start

`Empty<Element>` carries no element and no behavior of its own. It is the shared *anchor* onto which each domain package attaches its own conformance — the empty iterator, the empty sequence, the empty collection — so the empty case is defined once and reused, rather than re-declared per domain (compare the standard library's `EmptyCollection`, a single top-level type that is its own iterator).

```swift
import Empty_Primitives

// The empty value of a domain. The element type is supplied at the use site.
let nothing = Empty<Int>()

// It stores nothing: zero size, no observable state.
print(MemoryLayout<Empty<Int>>.size)   // 0
```

`Element` is unconstrained (`~Copyable & ~Escapable`), and `Empty` inherits its element's capabilities through conditional conformances: `Empty<Int>` is copyable and escapable, while `Empty<MoveOnly>` is move-only. This lets the empty case compose uniformly with the one-element case and the rest of the family in generic `~Copyable` / `~Escapable` contexts.

```swift
import Empty_Primitives

struct Token: ~Copyable {}

// Empty composes over a move-only element type — the bound is fully permissive.
let _ = Empty<Token>()

// And copies freely when its element is Copyable.
let a = Empty<Int>()
let b = a   // compiles only because Empty<Int>: Copyable
```

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-empty-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Empty Primitives", package: "swift-empty-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

One library product. No dependencies.

| Product | Target | Purpose |
|---------|--------|---------|
| `Empty Primitives` | `Sources/Empty Primitives/` | The `Empty<Element>` type: a storage-less value over an unconstrained `~Copyable & ~Escapable` element, with conditional `Copyable` and `Escapable` conformances that mirror the element's capabilities. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
