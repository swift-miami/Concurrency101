//: [Previous](@previous)

import Foundation

let dispatchGroup = DispatchGroup()

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: 3)
    print("Operation 1 Complete!")
    dispatchGroup.leave()
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: 1)
    print("Operation 2 Complete!")
    dispatchGroup.leave()
}

func runDispatchGroup() {
    print("Started Operation 1")
    dispatchGroup.enter()
    op1()
    
    print("Started Operation 2")
    dispatchGroup.enter()
    op2()
    
    dispatchGroup.notify(queue: .main) {
        print("Operations Complete!")
    }
}

runDispatchGroup()

//: [Next](@next)
