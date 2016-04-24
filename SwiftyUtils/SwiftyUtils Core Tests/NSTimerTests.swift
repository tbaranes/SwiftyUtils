//
//  NSTimerTests.swift
//  Demo
//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class NSTimerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func test() {
        testAfter()
    }
    
    func testAfter() {
        var fired = false
        NSTimer.after(0.1.seconds) {
            assert(!fired)
            fired = true
            self.testEvery()
        }
    }
    
    var timer1: NSTimer!
    
    func testEvery() {
        var fired = false
        timer1 = NSTimer.every(0.1.seconds) {
            if fired {
                self.testNewAfter()
                self.timer1.invalidate()
            } else {
                fired = true
            }
        }
    }
    
    let timer2 = NSTimer.new(after: 0.1.seconds) { fatalError() }
    let timer3 = NSTimer.new(every: 0.1.seconds) { fatalError() }
    
    func testNewAfter() {
        let timer = NSTimer.new(after: 0.1.seconds) {
            self.testNewEvery()
        }
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
    }
    
    var timer4: NSTimer!
    
    func testNewEvery() {
        var fired = false
        timer4 = NSTimer.new(every: 0.1.seconds) {
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
        let timer = NSTimer.new(after: 0.1.seconds) {
            self.testAfter2()
        }
        
        timer.start(runLoop: NSRunLoop.currentRunLoop(), modes: NSDefaultRunLoopMode)
    }
    
    func testAfter2() {
        NSTimer.after(0.1.seconds, testTimerFired)
    }
    
    func testTimerFired() {
        var fires = 0
        let timer = NSTimer.new(every: 0.1.seconds) { (timer: NSTimer) in
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
        NSTimer.every(0.1.seconds) { (timer: NSTimer) in
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