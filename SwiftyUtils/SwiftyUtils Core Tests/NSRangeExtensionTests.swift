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
    
    
    // MARK - Range
    
    func testRangeAfterOccurence() {
        let string = "Hello world"
        let range = NSRange(text: string, afterOccurence: "llo")
        XCTAssertEqual(range.location, 3)
        XCTAssertEqual(range.length, 8)
    }

}
