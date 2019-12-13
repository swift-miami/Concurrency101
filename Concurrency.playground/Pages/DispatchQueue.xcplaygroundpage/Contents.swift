//: [Previous](@previous)

import Foundation

let dispatchQueue = DispatchQueue(label: "com.swiftmiami.güey")

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: .pi)
    print("Operation 1 Complete!")
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: .leastNormalMagnitude)
    print("Operation 2 Complete!")
}

func runDispatchQueue() {    
    print("Started Operation 1")
    dispatchQueue.sync {
        op1()
    }
    
    print("Started Operation 2")
    dispatchQueue.sync {
        op2()
    }
}

runDispatchQueue()

//: [Next](@next)
