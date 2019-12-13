//: [Previous](@previous)

import Foundation

let dispatchGroup = DispatchGroup()

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: .pi)
    print("Operation 1 Complete!")
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: 1)
    print("Operation 2 Complete!")
}

func runDispatchGroup() {
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

runDispatchGroup()

//: [Next](@next)
