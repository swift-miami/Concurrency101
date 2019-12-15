//: [Previous](@previous)

import Foundation

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: 3)
    print("Operation 1 Complete!")
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: 1)
    print("Operation 2 Complete!")
}

func runOperationQueue() {
    let operationQueue = OperationQueue()
    operationQueue.progress.totalUnitCount = 1
    
    operationQueue.addOperation {
        print("Started Operation 1")
        op1()
    }
    
    operationQueue.addOperation {
        print("Started Operation 2")
        op2()
    }
}

runOperationQueue()

//: [Next](@next)
