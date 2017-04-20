//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
import SwiftyUtils

final class DateExtensionTests: XCTestCase {

    var string = ""
    let format = "dd-mm-yyyy hh:mm:ss"

    override func setUp() {
        super.setUp()
        string = "01-01-1970 00:00:00"
    }

}

// MARK: - Initializer

extension DateExtensionTests {

    func testDateFromString() {
        guard let dateFromString = Date(fromString: string, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        XCTAssertEqualWithAccuracy(dateFromString.timeIntervalSince1970, 0, accuracy: 60 * 60 * 24)
    }

}

// MARK: - Format

extension DateExtensionTests {

    func testDateToString() {
        let dateToString = Date(timeIntervalSince1970: 0).string(format: format)
        guard let dateFromString = Date(fromString: dateToString, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        XCTAssertEqualWithAccuracy(dateFromString.timeIntervalSince1970, 0, accuracy: 60 * 60 * 24)
    }

}

// MARK: - InBetween

extension DateExtensionTests {

    func testDaysSince() {
        let now = Date()
        let later = Date(timeIntervalSinceNow: -100000)
        XCTAssertEqualWithAccuracy(later.days(since: now), 1, accuracy: 1)
    }

    func testHoursSince() {
        let now = Date()
        let later = Date(timeIntervalSinceNow: -100000)
        XCTAssertEqualWithAccuracy(later.hours(since: now), 27, accuracy: 1)
    }

    func testMinutesSince() {
        let now = Date()
        let later = Date(timeIntervalSinceNow: -100000)
        XCTAssertEqualWithAccuracy(later.minutes(since: now), 1666, accuracy: 1)
    }

    func testSecondsSince() {
        let now = Date()
        let later = Date(timeIntervalSinceNow: -100000)
        XCTAssertEqualWithAccuracy(later.seconds(since: now), 100000, accuracy: 1)
    }

}

// MARK: - InBetween

extension DateExtensionTests {

    func testIsInFuture() {
        let oldDate = Date(timeIntervalSince1970: 512)
        let futureDate = Date(timeIntervalSinceNow: 512)
        XCTAssert(futureDate.isInFuture)
        XCTAssertFalse(oldDate.isInFuture)
    }

    func testIsInPast() {
        let oldDate = Date(timeIntervalSince1970: 512)
        let futureDate = Date(timeIntervalSinceNow: 512)
        XCTAssert(oldDate.isInPast)
        XCTAssertFalse(futureDate.isInPast)
    }

}
