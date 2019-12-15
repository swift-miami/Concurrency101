//: [Previous](@previous)

import Foundation

class ThreadsafeArray<Element> {
    private var data = [Element]()
    
    private let queue = DispatchQueue(label: "com.ñoooooooooooo.asere",
                                      attributes: .concurrent)
    
    var first: Element? {
        return data.first
    }
    
    func append(_ element: Element) {
        queue.async(flags: .barrier) {
            self.data.append(element)
        }
    }
    
    func item(at index: Int) -> Element {
        queue.sync {
            return self.data[index]
        }
    }
}


let array = ThreadsafeArray<Int>()
let concurrentQueue = DispatchQueue(label: "com.swiftmiami.chaparritos",
                                    attributes: .concurrent)

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: 3)
    array.append(1)
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: 1)
    array.append(2)
    
}

func runConcurrentAsync() {
    concurrentQueue.async {
        op1()
    }
    
    concurrentQueue.async {
        op2()
    }
}

runConcurrentAsync()

//: [Next](@next)
