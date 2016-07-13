//
//  NSTimerTests.swift
//  Demo
//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class TimerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func test() {
        testAfter()
    }

    func testAfter() {
        var fired = false
        let _ = Timer.after(0.1.seconds) {
            assert(!fired)
            fired = true
            self.testEvery()
        }
    }

    var timer1: Timer!

    func testEvery() {
        var fired = false
        timer1 = Timer.every(0.1.seconds) {
            if fired {
                self.testNewAfter()
                self.timer1.invalidate()
            } else {
                fired = true
            }
        }
    }

    let timer2 = Timer.new(after: 0.1.seconds) { fatalError() }
    let timer3 = Timer.new(every: 0.1.seconds) { fatalError() }

    func testNewAfter() {
        let timer = Timer.new(after: 0.1.seconds) {
            self.testNewEvery()
        }
        RunLoop.current.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
    }

    var timer4: Timer!

    func testNewEvery() {
        var fired = false
        timer4 = Timer.new(every: 0.1.seconds) {
            if fired {
                self.timer4.invalidate()
                self.testStart()
            } else {
                fired = true
            }
        }
        timer4.start()
    }

    func testStart() {
        let timer = Timer.new(after: 0.1.seconds) {
            self.testAfter2()
        }

        timer.start(runLoop: RunLoop.current, modes: RunLoopMode.defaultRunLoopMode)
    }

    func testAfter2() {
        let _ = Timer.after(0.1.seconds, testTimerFired)
    }

    func testTimerFired() {
        var fires = 0
        let timer = Timer.new(every: 0.1.seconds) { (timer: Timer) in
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
        let _ = Timer.every(0.1.seconds) { (timer: Timer) in
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
