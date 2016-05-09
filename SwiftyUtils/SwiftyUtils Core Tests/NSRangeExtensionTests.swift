//
//  NSRangeExtensionTests.swift
//  SwiftyUtilsDemo
//
//  Created by Tom Baranes on 25/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class NSRangeExtensionTests: XCTestCase {
    
    // MARK - Life cycle
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

    // MARK - Range

extension NSRangeExtensionTests {
    
    func testRangeAfterOccurence() {
        let string = "Hello world"
        let range = NSRange(text: string, afterOccurence: "llo")
        XCTAssertEqual(range.location, 3)
        XCTAssertEqual(range.length, 8)
    }

    func testRangeOfOccurence() {
        let string = "Hello world"
        let stringToFind = "ello wo"
        let range = NSRange(rangeOf: stringToFind, in: string)
        XCTAssertEqual(range.location, 1)
        XCTAssertEqual(range.length, stringToFind.length)
    }
}
