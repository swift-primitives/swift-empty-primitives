import Testing
import Empty_Primitives

@Suite("Empty Tests")
struct EmptyTests {
    @Suite struct Unit {}
}

extension EmptyTests.Unit {
    @Test
    func `empty carries no storage`() {
        #expect(MemoryLayout<Empty<Int>>.size == 0)
    }

    @Test
    func `empty constructs for a move-only element type`() {
        // No assertion beyond construction: Empty has no observable behavior of its own.
        // This exercises Empty over a ~Copyable element to confirm the bound is permissive.
        _ = Empty<Token>()
    }
}

private struct Token: ~Copyable {}
