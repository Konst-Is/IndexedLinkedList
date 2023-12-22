# IndexedLinkedList is an implementation of Linked List with a Hash Table

Linked List is a dynamic data structure, an ordered sequence of data units (nodes) that are stored in different areas of memory and connected by links. 
It has many advantages, but also a serious disadvantage that limits its widespread use. It is a slow access to an element - O(N) complexity compared to O(1) for Array and Dictionary.
The solution to this problem is IndexedLinkedList - an implementation of LinkedList with Hash Table, which has all its advantages and allows you to quickly access each element by index with O(1) complexity.

### Advantages of IndexedLinkedList

- Dynamic addition and deletion of elements.
- Elements can be stored in different parts of memory. This is an important advantage over Array.
- Adding and removing a node at the end of a list with O(1) complexity.
- Accessing a node by index with O(1) complexity.
- Output a visual representation of the sequence of items in the list.

### Limitations

- IndexedLinkedList nodes can contain data of any type that implements the `CustomStringConvertible` protocol.
- Adding and removing nodes is possible only at the end of IndexedLinkedList using the `addNode()` and `removeLastNode()` methods.
- It is impossible to change the order of elements in the list.
- It is impossible to insert or delete an element except at the end of IndexedLinkedList.

### API

```swift
public class Node<Element: CustomStringConvertible> {}

data  // data of any type implementing the CustomStringConvertible protocol
init(data: Element) /* an initializer that creates a node with data
of any type implementing the CustonStringConvertible protocol */


public class IndexedLinkedList<Element: CustomStringConvertible>: CustomStringConvertible {}

lastIndex // optional index of the last node in the list.
head //  optional first node in the list.
tail // optional last node in the list.
size // number of nodes in the list.
isEmpty // returns true if the list is empty and false otherwise.
description // forms a string describing all items in the list and the links between them.
init() /*  initializer that creates an empty list. When calling this initializer,
you must pass to it a generic parameter of the type of list items. */
init(head: Node<Element>) /* an initializer that creates a list from a single node.
When calling it, the generic parameter of items type can be omitted explicitly. */
subscript(index: Int) -> Node<Element> /* returns a node by index. Checking the validity
of the index, as in Array, is the responsibility of the programmer. If you enter an index
outside the range (0..<size) or the list is empty, you will get a runtime error. */
addNode(node: Node<Element>) // method that adds a new node to the end of the list.
removeLastNode() -> Node<Element>? /* method that removes the last node in the list
and returns it if it exists or nil. */
removeAll() // method that completely clears the list.
```

### How to integrate IndexedLinkedList into your project

- Open your project in XCode, in the project settings open the Package Dependencies tab, click +, paste the link "https://github.com/Konst-Is/IndexedLinkedList.git" into the search box and click "Add Package".
- In the file where you will use IndexedLinkedList, add "import IndexedLinkedList".

### Examples of work

```swift
import IndexedLinkedList
import Foundation

// Example 1

let myLL = IndexedLinkedList<Int>() /* When creating an empty IndexedLinkedList,
you need to pass a generic parameter to the type of items it will store. */
        
print(myLL.lastIndex ?? "nil") // nil
print(myLL.isEmpty) // true

myLL.addNode(node: Node(data: 1))
print(myLL.description) // 1 -> nil

myLL.addNode(node: Node(data: 2))
print(myLL.description) // 1 -> 2 -> nil

myLL.addNode(node: Node(data: 3))
print(myLL.description) // 1 -> 2 -> 3 -> nil

myLL.addNode(node: Node(data: 4))
print(myLL.description) // 1 -> 2 -> 3 -> 4 -> nil

print(myLL.isEmpty) // false
print(myLL.head?.data ?? "nil") // 1
print(myLL.tail?.data ?? "nil") // 4
print(myLL[0].data) // 1
print(myLL.size) // 4

let removedNode = myLL.removeLastNode()
print(removedNode?.data ?? "nil") // 4
print(myLL[3].data) // ERROR
print(myLL.description) // 1 -> 2 -> 3 -> nil

myLL.removeLastNode()
print(myLL.description) // 1 -> 2 -> nil

myLL.removeLastNode()
print(myLL.description) // 1 -> nil

myLL.removeLastNode()
print(myLL.description) // nil

       
// Example 2

var array = ["one", "two ", "three"]

let anotherLL = IndexedLinkedList(head: Node(data: array))

anotherLL.addNode(node: Node(data: ["four", "five", "six"]))

print(anotherLL.description) // ["one", "two ", "three"] -> ["four", "five", "six"] -> nil
print(anotherLL[0].data) // ["one", "two ", "three"]
print(anotherLL[1].data[1]) // five
```







