//: [Previous](@previous)

import Foundation

let serialQueue = DispatchQueue(label: "com.swiftmiami.porahiypaya")

print(0)
serialQueue.async {
    print(1)
    serialQueue.sync {
        print(2)
    }
    print(3)
}
print(4)

//: [Next](@next)
