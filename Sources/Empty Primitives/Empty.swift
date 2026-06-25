//
//  Empty.swift
//  swift-empty-primitives
//

/// The empty value of a domain — a type with no stored element.
///
/// `Empty<Element>` carries no storage and exposes no behavior of its own: it is the shared
/// "nothing", the *anchor* onto which each domain attaches its conformance — the empty
/// iterator, the empty sequence, the empty collection. Defining the type once and letting each
/// domain package add its own conformance is what lets the empty case be reused across domains
/// instead of re-declared per agent (cf. the standard library's `EmptyCollection`, a single
/// top-level type that is its own iterator).
///
/// `Element` is unconstrained (`~Copyable & ~Escapable`). Although `Empty` stores nothing, it
/// inherits its element's capabilities via the conditional conformances below — `Empty<Int>` is
/// copyable & escapable, `Empty<MoveOnly>` is move-only — so the empty case composes uniformly
/// with the one-element case (`Single`) and the rest of the family in generic `~Copyable` /
/// `~Escapable` contexts.
public struct Empty<Element: ~Copyable & ~Escapable>: ~Copyable, ~Escapable {
    /// Construct the empty value.
    ///
    /// The element type is supplied at the use site: `Empty<Element>()`.
    @inlinable
    @_lifetime(immortal)
    public init() {}
}

// `Empty` inherits its element's capabilities, matching `Single`, so the empty and one-element
// cases behave the same way in generic `~Copyable` / `~Escapable` contexts. Each conformance
// states the orthogonal axis as not-required (`& ~Escapable` / `& ~Copyable`) so it applies
// regardless of the other capability.
extension Empty: Copyable where Element: Copyable & ~Escapable {}

extension Empty: Escapable where Element: Escapable & ~Copyable {}
