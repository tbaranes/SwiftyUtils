//
//  IntExtensionTests.swift
//  Demo
//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class IntExtensionTests: XCTestCase {
    
    // MARK - Life cycle
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK -
    
    func testDigits() {
        XCTAssertEqual(33.digits, 2)
    }
    
    func testEvenAndOdd() {
        XCTAssertFalse(33.isEven)
        XCTAssertTrue(34.isEven)
        XCTAssertTrue(33.isOdd)
        XCTAssertFalse(34.isOdd)
    }
    
    func testPositiveVsNegative() {
        XCTAssertTrue(33.isPositive)
        XCTAssertFalse((-33).isPositive)
        XCTAssertFalse(33.isNegative)
        XCTAssertTrue((-33).isNegative)
    }
    
    
}
