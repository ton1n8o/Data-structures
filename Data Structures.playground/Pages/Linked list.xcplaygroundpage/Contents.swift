//: [Overview - Table of Contents](Overview)
/*
 # Linked list

 - unsorted elements ( isn't indexed )
 - each element has a link to the next one
 - the last element is null/nil

## Some properties

- inserting an element at the end takes linear time O(n)
- inserting an element at the head takes constant time O(1)
- finding or deleting an element takes liner time O(n)

Source: https://en.wikipedia.org/wiki/Linked_list

### Overview

Below we have an implementation of a Linked list.
 
 */

import Foundation

final class Node: CustomDebugStringConvertible {

    var next: Node?
    let data: Int

    init(_ data: Int) {
        self.data = data
        next = nil
    }

    var debugDescription: String {
        guard let n = next else {
            return "data: \(data)"
        }
        return "data: \(data), next: \(n.data)"
    }
}

final class LinkedList: CustomDebugStringConvertible {

    private var head: Node?

    init(data: Int) {
        head = Node(data)
    }

    func append(data: Int) {
        if head == nil {
            head = Node(data)
            return
        }

        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = Node(data)
    }

    func prepend(data: Int) {
        let newHead = Node(data)
        newHead.next = head
        head = newHead
    }

    func deleteWith(data: Int) {

        guard head != nil else { return }

        guard head?.data != data else {
            head = head?.next
            return
        }

        var current = head
        while current?.next != nil {
            if current?.next?.data == data {
                current?.next = current?.next?.next
                return
            }
            current = current?.next
        }
    }

    var debugDescription: String {
        var text: String = ""
        var current = head
        var idx = 0
        while current?.next != nil {
            text += "Node \(idx): [\(current!.debugDescription)], "
            current = current?.next
            idx += 1
        }
        return String(text.dropLast(2))
    }
}

let linkedList = LinkedList(data: 70)

linkedList.append(data: 10)
linkedList.append(data: -80)
linkedList.append(data: 80)

print(linkedList)

linkedList.deleteWith(data: 10)
linkedList.deleteWith(data: 80)

print(linkedList)

linkedList.prepend(data: 50)

print(linkedList)

