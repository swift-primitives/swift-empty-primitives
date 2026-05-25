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
/// `Element` is unconstrained (`~Copyable & ~Escapable`): with no element ever stored or
/// produced, the copyability and escapability of `Element` are irrelevant.
public struct Empty<Element: ~Copyable & ~Escapable>: ~Copyable, ~Escapable {
    /// Construct the empty value. The element type is supplied at the use site:
    /// `Empty<Element>()`.
    @inlinable
    @_lifetime(immortal)
    public init() {}
}
