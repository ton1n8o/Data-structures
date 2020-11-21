//: [Overview - Table of Contents](Overview)
/*
 # Fibonacci

 ## Some properties

 - N shuld be > 1

 Source: https://en.wikipedia.org/wiki/Fibonacci_number

 ### Overview

 Below we have two implementations of the Fibonacci sequence,
 the first one will print the sequence and the other will produce an array.

 */
import Foundation

/// Fibonacci function that will print the Fibonacci sequence up to n.
/// - Parameter n: with n > than 1.
func fibonacci(n: Int) {

    var n1 = 0
    var n2 = 1

    guard n != 0 else { print("Invalid"); return }

    guard n != 1 else { print(n); return }

    guard n != 2 else { print(n1, n2); return }

    var array = [n1, n2]

    for _ in 2..<n {
        let n3 = n1 + n2
        n1 = n2
        n2 = n3
        array.append(n3)
    }
    print(array)
}
fibonacci(n: 8) // outputs: [0, 1, 1, 2, 3, 5, 8, 13]

/// Fibonacci function producing an array.
/// - Parameter n: with n > than 1.
/// - Returns: an array holding the Fibonacci sequence up to the n number.
func fibonacciArray(n: Int) -> [Int] {

    assert(n > 1)
    var array = [0, 1]

    while array.count < n {
        array.append(array[array.count - 1] + array[array.count - 2])
    }
    return array
}
fibonacciArray(n: 8) // outputs: [0, 1, 1, 2, 3, 5, 8, 13]
