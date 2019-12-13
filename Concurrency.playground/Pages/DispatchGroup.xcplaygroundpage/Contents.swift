//: [Previous](@previous)

import Foundation

let dispatchGroup = DispatchGroup()

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: .pi)
    dispatchGroup.leave()
    print("Operation 1 Complete!")
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: .leastNormalMagnitude)
    dispatchGroup.leave()
    print("Operation 2 Complete!")
}

func runDispatchGroup() {
    defer {
        dispatchGroup.notify(queue: .main) {
            print("Operations Complete!")
        }
    }
    
    DispatchQueue.global().sync {
        print("Started Operation 1")
        dispatchGroup.enter()
        op1()
    }
    
    DispatchQueue.global().sync {
        dispatchGroup.enter()
        print("Started Operation 2")
        op2()
    }
}

runDispatchGroup()

//: [Next](@next)
