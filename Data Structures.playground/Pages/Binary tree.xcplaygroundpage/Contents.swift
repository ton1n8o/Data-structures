//: [Overview - Table of Contents](Overview)
import Foundation

final class Node {

    private var left, right: Node?
    private let data: Int

    init(data: Int) {
        self.data = data
        left = nil
        right = nil
    }

    func insert(value: Int) {

        if value <= data {
            if left == nil {
                left = Node(data: value)
            } else {
                left?.insert(value: value)
            }
        } else {
            if right == nil {
                right = Node(data: value)
            } else {
                right?.insert(value: value)
            }
        }
    }

    func contains(value: Int) -> Bool {

        if value == data {
            return true
        } else if value < data {
            return left?.contains(value: value) ?? false
        }

        return right?.contains(value: value) ?? false
    }

    func printInOrder() {
        
        if left != nil {
            left?.printInOrder()
        }
        print(data)
        if right != nil {
            right?.printInOrder()
        }
    }
}

// Example:


let root = Node(data: 5)
root.insert(value: 3)
root.insert(value: 2)
root.insert(value: 1)
root.insert(value: -2)
root.insert(value: 8)
root.insert(value: 0)

root.printInOrder()
