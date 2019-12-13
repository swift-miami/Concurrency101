//: [Previous](@previous)

import Foundation

let queue = DispatchQueue(label: "com.swiftmiami.parceritos",
                          attributes: .concurrent)

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: .pi)
    print("Operation 1 Complete!")
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: .leastNormalMagnitude)
    print("Operation 2 Complete!")
}

func runSync() {
    print("Started Operation 1")
    queue.sync {
        op1()
    }

    print("Started Operation 2")
    queue.sync {
        op2()
    }
}

func runAsync() {
    print("Started Operation 1")
    queue.async {
        op1()
    }

    print("Started Operation 2")
    queue.async {
        op2()
    }
}

runSync()
//runAsync()

//: [Next](@next)
