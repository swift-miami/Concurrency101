//: [Previous](@previous)

import Foundation

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: .pi)
    print("Operation 1 Complete!")
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: 1)
    print("Operation 2 Complete!")
}

func dispatchGroup() {
    let dispatchGroup = DispatchGroup()
    
    defer {
        dispatchGroup.notify(queue: .main) {
            print("Operations Complete!")
        }
    }
    
    dispatchGroup.enter()
    print("Started Operation 1")
    op1()
    dispatchGroup.leave()
    
    dispatchGroup.enter()
    print("Started Operation 2")
    op2()
    dispatchGroup.leave()
}

func dispatchQueue() {
    let dispatchQueue = DispatchQueue(label: "com.swiftmiami.güey")
    
    defer {
        print("Operations Complete!")
    }
    
    print("Started Operation 1")
    dispatchQueue.sync {
        op1()
    }
    
    print("Started Operation 2")
    dispatchQueue.sync {
        op2()
    }
}

dispatchGroup()
//dispatchQueue()

//: [Next](@next)
