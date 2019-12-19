//: [Previous](@previous)

import Foundation

let op1 = BlockOperation {
    Thread.sleep(forTimeInterval: 3)
    print("Operation 1 Complete!")
}

let op2 = BlockOperation {
    Thread.sleep(forTimeInterval: 2)
    print("Operation 2 Complete!")
}

let op3 = BlockOperation {
    Thread.sleep(forTimeInterval: 0.5)
    print("Operation 3 Complete!")
}

op3.addDependency(op1)
op3.addDependency(op2)

let operationQueue = OperationQueue()

let operations = [op1, op2, op3]
operationQueue.addOperations(operations, waitUntilFinished: true)

//: [Next](@next)
