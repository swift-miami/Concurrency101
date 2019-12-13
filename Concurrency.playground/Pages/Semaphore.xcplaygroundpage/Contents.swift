//: [Previous](@previous)

import Foundation

let queue = DispatchQueue(label: "com.swiftmiami.semawho", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 0)

let op1: () -> Void = {
    Thread.sleep(forTimeInterval: .pi)
    print("Operation 1 Complete!")
}

let op2: () -> Void = {
    Thread.sleep(forTimeInterval: .leastNormalMagnitude)
    print("Operation 2 Complete!")
}

func runSemaphore() {
    print("Started Operation 1")
    queue.async {
        op1()
        semaphore.signal()
    }
    
    semaphore.wait()
    
    print("Started Operation 2")
    queue.async {
        op2()
    }
}

runSemaphore()

//: [Next](@next)
