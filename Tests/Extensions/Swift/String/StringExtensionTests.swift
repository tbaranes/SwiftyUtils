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

// MARK: - Subscript

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
        XCTAssertTrue(string.contains("lo wo", compareOption: .backwards))
        XCTAssertFalse(string.contains("wo lo", compareOption: .backwards))
    }

}

// MARK: - Validator

extension StringExtensionTests {

    func testIsNumeric() {
        XCTAssertTrue("425252".isNumeric)
        XCTAssertFalse("test".isNumeric)
    }

    @available(*, deprecated)
    func testIsEmailValid() {
        var aString = "test@gmail.com"
        XCTAssertTrue(aString.isEmail)
        aString = "test"
        XCTAssertFalse(aString.isEmail)
        aString = "test@gmail"
        XCTAssertFalse(aString.isEmail)
        aString = "test@.com"
        XCTAssertFalse(aString.isEmail)
        aString = "testing+gmailsorting@gmail.com"
        XCTAssertTrue(aString.isEmail)
    }

    @available(macOS 13, iOS 16, tvOS 16, watchOS 10, *)
    func testEmailValidationOnPreviousValues() throws {
        var aString = "test@gmail.com"
        XCTAssertEqual(try aString.validateEmailAddress(), .widelySupported)
        aString = "test"
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = "test@gmail"
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = "test@gmail"
        XCTAssertEqual(try aString.validateEmailAddress(requireTLD: false), .technicallySupported)
        aString = "test@.com"
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = "testing+gmailsorting@gmail.com"
        XCTAssertEqual(try aString.validateEmailAddress(), .mostlySupported)
    }

    @available(macOS 13, iOS 16, tvOS 16, watchOS 10, *)
    func testEmailValidationOnValidEmails() throws {
        // test cases sourced from https://www.linuxjournal.com/article/9585,
        // but validation corrected against https://www.dominicsayers.com/isemail/
        var aString = ##"dclo@us.ibm.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .widelySupported)
        aString = ##""Abc@def"@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .technicallySupported)
        aString = ##""Fred Bloggs"@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .technicallySupported)
        aString = ##"customer/department=shipping@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .technicallySupported)
        aString = ##"$A12345@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .technicallySupported)
        aString = ##"!def!xyz%abc@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .technicallySupported)
        aString = ##"_somename@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .widelySupported)
        aString = ##"user+mailbox@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .mostlySupported)
        aString = ##"peter.piper@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .widelySupported)
        aString = ##""Doug \"Ace\" L."@example.com"##
        XCTAssertEqual(try aString.validateEmailAddress(), .technicallySupported)
    }

    @available(macOS 13, iOS 16, tvOS 16, watchOS 10, *)
    func testEmailValidationOnInvalidEmails() throws {
        var aString = ##"abc\\@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"Fred\ Bloggs@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"Joe.\\Blow@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"abc\@def@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"abc@def@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"abc\\@def@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"abc\@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"doug@"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##""qu@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"ote"@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##".dot@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"dot.@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"two..dot@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##""Doug "Ace" L."@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"Doug\ \"Ace\"\ L\.@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"Doug\ \"Ace\"\ Lovell@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"hello world@example.com"##
        XCTAssertThrowsError(try aString.validateEmailAddress())
        aString = ##"gatsby@f.sc.ot.t.f.i.tzg.era.l.d."##
        XCTAssertThrowsError(try aString.validateEmailAddress())
    }

    func testIPAddressValid() {
        var ipAddr = "123.45.67.89"
        XCTAssertTrue(ipAddr.isIPAddress)
        XCTAssertTrue(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
        ipAddr = "999.1.3.2"
        XCTAssertFalse(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
        ipAddr = "4.3.2.1"
        XCTAssertTrue(ipAddr.isIPAddress)
        XCTAssertTrue(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
        ipAddr = "091.056.034.002"
        XCTAssertTrue(ipAddr.isIPAddress)
        XCTAssertTrue(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
        ipAddr = "123.45.67.89."
        XCTAssertFalse(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
        ipAddr = "2001:0db8:85a3:0000:0000:8a2e:0370:7334."
        XCTAssertFalse(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
        ipAddr = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
        XCTAssertTrue(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertTrue(ipAddr.isIP6Address)
        ipAddr = "FE80::0202:B3FF:FE1E:8329"
        XCTAssertTrue(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertTrue(ipAddr.isIP6Address)
        ipAddr = "[2001:db8::1]:80"
        XCTAssertFalse(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
        ipAddr = "fc00::/7"
        XCTAssertFalse(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
        ipAddr = "fc00::"
        XCTAssertTrue(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertTrue(ipAddr.isIP6Address)
        ipAddr = "i'll bribe you to say i'm an ip address!"
        XCTAssertFalse(ipAddr.isIPAddress)
        XCTAssertFalse(ipAddr.isIP4Address)
        XCTAssertFalse(ipAddr.isIP6Address)
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

        string = "0123456789"
        string.truncate(limit: 10)
        XCTAssertEqual(string, "0123456789")
    }

    func testSplitEvery() {
        let input = "abcd"
        let split = input.split(intoChunksOf: 2)
        XCTAssertEqual(split[0], "ab")
        XCTAssertEqual(split[1], "cd")
    }

}
