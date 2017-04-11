//
//  Created by Tom Baranes on 24/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

final class StringExtensionTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

}

// MARK -

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

extension StringExtensionTests {

    func testInitFloat() {
        let aFloat: Float = 2.323232
        let aString = String(value: aFloat, maxDigits: 2)
        XCTAssertTrue(aString == "2,32" || aString == "2.32")
    }

    func testInitDouble() {
        let aFloat: Double = 2.323232
        let aString = String(value: aFloat, maxDigits: 2)
        XCTAssertTrue(aString == "2,32" || aString == "2.32")
    }

}

extension StringExtensionTests {

    func testLengthRange() {
        let aString = "Hello world"
        XCTAssertEqual(aString.length, aString.characters.count)
    }

    func testIsOnlyEmptySpacesAndNewLineCharacters() {
        XCTAssertFalse("test".isOnlyEmptySpacesAndNewLineCharacters)
        XCTAssertTrue(" \n ".isOnlyEmptySpacesAndNewLineCharacters)
    }

    func testClassName() {
        var aString = "hello world"
        aString = aString.capitalizedFirst
        XCTAssertEqual(aString[0], "H")
    }

    func testIsIncludeEmoji() {
        XCTAssertTrue("test 😃 emoji".containsEmoji())
        XCTAssertFalse("test emoji".containsEmoji())
    }

}

// MARK: - Getter

extension StringExtensionTests {

    func testExtractURLs() {
        let string = "http://google.com http fpt:// http://facebook.com test"
        let urls = string.extractedURLs
        XCTAssertEqual(urls.count, 2)
    }

    func testUncamelled() {
        var camelString = "isCamelled"
        XCTAssertEqual(camelString.uncamelled, "is_camelled")
        camelString = "is_camelled"
        XCTAssertEqual(camelString.uncamelled, "is_camelled")
        camelString = "isCamelled_invalidsYntax"
        XCTAssertEqual(camelString.uncamelled, "is_camelled_invalids_yntax")
    }

    func testSplitEvery() {
        let input = "abcd"
        let split = input.split(intoChunksOf: 2)
        XCTAssertEqual(split[0], "ab")
        XCTAssertEqual(split[1], "cd")
    }
}

// MARK: - Getter

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

}

// MARK - Validators

extension StringExtensionTests {

    func testIsNumber() {
        XCTAssertTrue("425252".isNumber)
        XCTAssertFalse("test".isNumber)
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
