# Concurrency101
## Gio + Iván holiday special: Concurrency

#### Playground Pages:

* Sync vs Async
* Serial vs Concurrent
* DispatchGroup
* DispatchQueue
* Thread-Safe Data Structure
* OperationQueue
* Semaphore
* Deadlock

#### Resources:

* [📺  | WWDC Modernizing Grand Central Dispatch Usage 🚨Must Watch🚨](https://developer.apple.com/videos/play/wwdc2017/706)
* [🔗  | Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html)
* [🔗 Khanlou | The GCD Handbook](http://khanlou.com/2016/04/the-GCD-handbook)
* [🔗 Objc.io | Concurrent Programming: APIs and Challenges](https://www.objc.io/issues/2-concurrency/concurrency-apis-and-pitfalls)
* [🔗 libdispatch efficiency tips](https://gist.github.com/tclementdev/6af616354912b0347cdf6db159c37057)
* [🔗 Swift Lee | Asynchronous operations](https://www.avanderlee.com/swift/asynchronous-operations)
* [🔗 Donny Wals | DispatchGroup](https://www.donnywals.com/sequencing-tasks-with-dispatchgroup)

#### General Advice:
* Avoid using concurrent queues at all cost.
    * Instead use a serial queue per sub system and use a target queue if you need subsystems to interact.
    * Reader/writer locks tend to be a source of great complexity and hard to get right, specially in Swift which is bad at atomic access. If needed it’s better to use `os_unfair_lock`
* Combine helps handling concurrency with its stream of events API.
* Don’t use GlobalQueues.
   * Quote from Swift Evolution: [Fixing race conditions in async/await example](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20170828/039368.html): ` dispatch_get_global_queue() is in practice on of the worst thing that the dispatch API provides`
* Shouldn’t need to specify QoS unless for example you start a process in the main queue and want it to go in the background specifically. Otherwise let the system determine the QoS for you.
