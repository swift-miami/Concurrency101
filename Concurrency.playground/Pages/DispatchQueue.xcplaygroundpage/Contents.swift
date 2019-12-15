//: [Previous](@previous)

import Foundation

let serialQueue = DispatchQueue(label: "com.swiftmiami.güey")

let workItem1 = DispatchWorkItem {
    Thread.sleep(forTimeInterval: 3)
    print("Operation 1 Complete!")
}

let workItem2 = DispatchWorkItem {
    Thread.sleep(forTimeInterval: 1)
    print("Operation 2 Complete!")
}

func runSerialQueue() {
    print("Started Operation 1")
    serialQueue.async(execute: workItem1)
    
    print("Started Operation 2")
    serialQueue.async(execute: workItem2)
    
    print("End of \(#function) scope")
}

runSerialQueue()

//: [Next](@next)
