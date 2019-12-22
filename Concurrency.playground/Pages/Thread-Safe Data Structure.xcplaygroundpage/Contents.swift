//: [Previous](@previous)

import Foundation

final class ThreadsafeArray<Element> {
    private var data = [Element]()
    private var lock = os_unfair_lock_s()

    var first: Element? {
        os_unfair_lock_lock(&lock)
        let element = data.first
        os_unfair_lock_unlock(&lock)

        return element
    }

    func append(_ element: Element) {
        os_unfair_lock_lock(&lock)
        data.append(element)
        os_unfair_lock_unlock(&lock)
    }

    func item(at index: Int) -> Element? {
        guard
            index >= data.startIndex,
            index < data.endIndex
        else {
            return nil
        }

        os_unfair_lock_lock(&lock)
        let element = data[index]
        os_unfair_lock_unlock(&lock)

        return element
    }
}

//: [Next](@next)
