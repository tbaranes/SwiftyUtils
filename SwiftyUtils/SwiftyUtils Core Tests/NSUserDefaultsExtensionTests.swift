//
//  NSUserDefaultsExtensionTests.swift
//  SwiftyUtilsDemo
//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class NSUserDefaultsExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK - Subscript

extension NSUserDefaultsExtensionTests {
    
    func testSubscript() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let username = "test"
        defaults["userName"] = username
        XCTAssertEqual(defaults["userName"] as? String ?? "", username)
    }
}

// MARK -

extension NSUserDefaultsExtensionTests {
    
    func testContainsKeySuccess() {
        let key = "aKey"
        let value = "aValue"
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
        XCTAssertTrue(NSUserDefaults.contains(key))
    }

    func testContainsKeyFailure() {
        let key = "aFakeKey"
        XCTAssertFalse(NSUserDefaults.contains(key))
    }
 
}
