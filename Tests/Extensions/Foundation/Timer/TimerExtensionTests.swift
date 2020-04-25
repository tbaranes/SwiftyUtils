//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class TimerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test() {
        testAfter()
    }

    func testAfter() {
        var fired = false
        _ = Timer.after(0.1.seconds) {
            assert(!fired)
            fired = true
            self.testEvery()
        }
    }

    private var timer1: Timer!

    func testEvery() {
        var fired = false
        timer1 = Timer.every(0.1.seconds) { _ in
            if fired {
                self.testNewAfter()
                self.timer1.invalidate()
            } else {
                fired = true
            }
        }
    }

    let timer2 = Timer.new(after: 0.1.seconds) { fatalError("timer fired") }
    let timer3 = Timer.new(every: 0.1.seconds) { _ in fatalError("timer fired") }

    func testNewAfter() {
        let timer = Timer.new(after: 0.1.seconds) {
            self.testNewEvery()
        }
        RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
    }

    var timer4: Timer!
    var timer5: Timer!

    func testNewEvery() {
        var fired = false
        timer4 = Timer.new(every: 0.1.seconds) { _ in
            if fired {
                self.timer4.invalidate()
                self.testStart()
            } else {
                fired = true
            }
        }
        timer4.start()
    }

    func testFireImmediatly() {
        var fired = false
        timer5 = Timer.every(0.1.seconds,
                             firesImmediately: true) { _ in
            if fired {
                self.timer5.invalidate()
                self.testStart()
            } else {
                fired = true
            }
        }
        timer5 .start()
    }

    func testStart() {
        let timer = Timer.new(after: 0.1.seconds) {
            self.testAfter2()
        }

        timer.start(onRunLoop: RunLoop.current, modes: RunLoop.Mode.default)
    }

    func testAfter2() {
        _ = Timer.after(0.1.seconds, testTimerFired)
    }

    func testTimerFired() {
        var fires = 0
        let timer = Timer.new(every: 0.1.seconds) { timer in
            guard fires <= 1 else { fatalError("should be invalidated") }
            defer { fires += 1 }

            if fires == 1 {
                timer.invalidate()
                self.testTimerCleanup()
            }
        }
        timer.start()
    }

    func testTimerCleanup() {
        var fires = 0
        _ = Timer.every(0.1.seconds) { timer in
            guard fires <= 1 else { fatalError("should be invalidated") }
            defer { fires += 1 }

            if fires == 1 {
                timer.invalidate()
                self.done()
            }
        }
    }

    func done() {
        XCTAssertTrue(true)
    }

}
