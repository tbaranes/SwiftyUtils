//
//  NSURLExtensionTests.swift
//  Demo
//
//  Created by Tom Baranes on 24/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class NSURLExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
}

extension NSURLExtensionTests {

    func testQueryParameters() {
        let url = NSURL(string: "http://example.com/api?v=1.1&q=google")
        if let queryParameters = url?.queryParameters {
            XCTAssertEqual(queryParameters["v"], Optional("1.1"))
            XCTAssertEqual(queryParameters["q"], Optional("google"))
            XCTAssertEqual(queryParameters["other"], nil)
        }
    }
    
}