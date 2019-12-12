//: [Previous](@previous)

import Foundation

let serialQueue = DispatchQueue(label: "com.swiftmiami.chaparritas")
let concurrentQueue = DispatchQueue(label: "com.swiftmiami.chaparritos", attributes: .concurrent)

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: .pi)
    print(1)
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: 1)
    print(2)
}

func serialAsync() {
    serialQueue.async {
        op1()
    }
    
    serialQueue.async {
        op2()
    }
}

func concurrentAsync() {
    concurrentQueue.async {
        op1()
    }
    
    concurrentQueue.async {
        op2()
    }
}

serialAsync()
concurrentAsync()

//: [Next](@next)
