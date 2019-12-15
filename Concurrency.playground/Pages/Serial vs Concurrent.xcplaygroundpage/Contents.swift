//: [Previous](@previous)

import Foundation

let serialQueue = DispatchQueue(label: "com.swiftmiami.chaparritas")
let concurrentQueue = DispatchQueue(label: "com.swiftmiami.chaparritos",
                                    attributes: .concurrent)

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: 3)
    print("Operation 1 Complete!")
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: 1)
    print("Operation 2 Complete!")
}

func runSerialAsync() {
    print("Started Operation 1")
    serialQueue.async {
        op1()
    }
    
    print("Started Operation 2")
    serialQueue.async {
        op2()
    }
}

func runConcurrentAsync() {
    print("Started Operation 1")
    concurrentQueue.async {
        op1()
    }
    
    print("Started Operation 2")
    concurrentQueue.async {
        op2()
    }
}

runSerialAsync()
//runConcurrentAsync()

//: [Next](@next)
