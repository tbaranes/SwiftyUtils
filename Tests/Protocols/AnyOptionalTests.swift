//
//  AnyOptionalTests.swift
//  SwiftyUtils
//
//  Created by Tom Baranes on 25/04/2020.
//  Copyright © 2020 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class AnyOptionalTests: XCTestCase {

    // MARK: Life cycle

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK: - Tests

extension AnyOptionalTests {

    func testIsNil() {
        var string: String?
        XCTAssertTrue(string.isNil)
        string = "test"
        XCTAssertFalse(string.isNil)
    }

}
