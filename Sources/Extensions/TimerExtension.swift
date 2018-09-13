//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import Foundation

// MARK: - After

extension Timer {

    public class func new(after interval: TimeInterval, _ block: @escaping () -> Void) -> Timer {
        return CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, 0, 0, 0) { _ in
            block()
        }
    }

    public class func after(_ interval: TimeInterval, _ block: @escaping () -> Void) -> Timer {
        let timer = Timer.new(after: interval, block)
        timer.start()
        return timer
    }

}

// MARK: - Every

extension Timer {

    public class func every(_ interval: TimeInterval, firesImmediately: Bool = false, _ block: @escaping (Timer) -> Void) -> Timer {
        if firesImmediately {
            let fireDate = CFAbsoluteTimeGetCurrent()
            let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, interval, 0, 0, { x in block(x!) })
            CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
            return timer!
        } else {
            let timer = Timer.new(every: interval, block)
            timer.start()
            return timer
        }
    }

    public class func new(every interval: TimeInterval, _ block: @escaping (Timer) -> Void) -> Timer {
        var timer: Timer!
        timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, interval, 0, 0) { _ in
            block(timer)
        }
        return timer
    }

}

// MARK: - Misc

extension Timer {

    public func start(onRunLoop runLoop: RunLoop = RunLoop.current, modes: RunLoop.Mode...) {
        let modes = modes.isEmpty ? [RunLoop.Mode.default] : modes
        modes.forEach {
            runLoop.add(self, forMode: $0)
        }
    }

}
