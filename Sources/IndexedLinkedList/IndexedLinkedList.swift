public class Node<Element: CustomStringConvertible> {
    public var data: Element
    var next: Node?

    public init(data: Element) {
        self.data = data
    }
}

public class IndexedLinkedList<Element: CustomStringConvertible>: CustomStringConvertible {

    private var pointers: [Int : Node<Element>] = [:]
    public var lastIndex: Int?
    public var head: Node<Element>? {
        guard lastIndex != nil else { return nil }
        return pointers[0]
    }
    public var tail: Node<Element>? {
        guard let lastIndex = lastIndex else { return nil }
        return pointers[lastIndex]
    }
    public var size: Int {
        guard let lastIndex = lastIndex else { return 0 }
            return lastIndex + 1
    }

    public var isEmpty: Bool {
        return lastIndex == nil ? true : false
    }

    public var description: String {
        guard let lastIndex = lastIndex else { return "nil" }
        var str = String(pointers[0]!.data.description)
        if lastIndex > 0 {
            for i in 1...lastIndex {
                str = str + " -> " + String(pointers[i]!.data.description)
            }
        }
            return  str + " -> " + "nil"
    }

    public subscript (index: Int) -> Node<Element> {
        guard !isEmpty, (0...lastIndex!).contains(index) else { fatalError() }
            return pointers[index]!
    }
    
    public init() {}
    
    public convenience init(head: Node<Element>) {
        self.init()
        self.addNode(node: head)
    }

    public func addNode(node: Node<Element>) {
        guard lastIndex != nil else {
            lastIndex = 0
            pointers[0] = node
            return
        }
        pointers[lastIndex!]?.next = node
        lastIndex! += 1
        pointers[lastIndex!] = node
    }

    @discardableResult
    public func removeLastNode() -> Node<Element>? {
        guard lastIndex != nil else { return nil }
        var removedNode = tail
        pointers[lastIndex!] = nil
        if lastIndex! > 0 {
            lastIndex! -= 1
            pointers[lastIndex!]?.next = nil
        } else {
            removeAll()
        }

        return removedNode
    }

    public func removeAll() {
        lastIndex = nil
        pointers = [:]
    }

}


