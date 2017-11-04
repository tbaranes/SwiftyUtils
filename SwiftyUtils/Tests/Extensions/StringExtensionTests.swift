//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class StringExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK - Subscript

extension StringExtensionTests {

    func testSubscriptIndex() {
        let aString = "Hello world"
        XCTAssertEqual(aString[0], "H")
        XCTAssertEqual(aString[2], "l")
    }

    func testSubscriptRange() {
        let aString = "Hello world"
        XCTAssertEqual(aString[Range(1...3)], "ell")
    }

}

// MARK: - Misc

extension StringExtensionTests {

    func testContains() {
        let string = "Hello world"
        XCTAssertTrue(string.contains("lo wo"))
        XCTAssertFalse(string.contains("wo lo"))
    }

}

// MARK: - Validator

extension StringExtensionTests {

    func testIsNumeric() {
        XCTAssertTrue("425252".isNumeric)
        XCTAssertFalse("test".isNumeric)
    }

    func testIsEmailValid() {
        var aString = "test@gmail.com"
        XCTAssertTrue(aString.isEmail)
        aString = "test"
        XCTAssertFalse(aString.isEmail)
        aString = "test@gmail"
        XCTAssertFalse(aString.isEmail)
        aString = "test@.com"
        XCTAssertFalse(aString.isEmail)
    }

}

// MARK: - Computed Properties

extension StringExtensionTests {

    func testUncamelized() {
        var camelString = "isCamelled"
        XCTAssertEqual(camelString.uncamelized, "is_camelled")
        camelString = "is_camelled"
        XCTAssertEqual(camelString.uncamelized, "is_camelled")
        camelString = "isCamelled_invalidsYntax"
        XCTAssertEqual(camelString.uncamelized, "is_camelled_invalids_yntax")
    }

    func testCapitalizedFirst() {
        var aString = "hello world"
        aString = aString.capitalizedFirst
        XCTAssertEqual(aString, "Hello world")
    }

}

// MARK: - Transform

extension StringExtensionTests {

    func testTrim() {
        var string = "space space"
        string.trim()
        XCTAssertFalse(string.contains(" "))
    }

    func testTruncate() {
        var string = "0123456789aaaa"
        string.truncate(limit: 10)
        XCTAssertEqual(string, "0123456789...")
    }

    func testSplitEvery() {
        let input = "abcd"
        let split = input.split(intoChunksOf: 2)
        XCTAssertEqual(split[0], "ab")
        XCTAssertEqual(split[1], "cd")
    }

}
