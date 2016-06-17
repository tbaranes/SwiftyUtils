//
//  DateExtensionTests.swift
//  Demo
//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

class DateExtensionTests: XCTestCase {

    var string: String!
    let format = "dd-mm-yyyy hh:mm:ss"

    override func setUp() {
        super.setUp()
        string = "01-01-1970 00:00:00"
    }

}

extension DateExtensionTests {

    func testDateFromString() {
        guard let dateFromString = NSDate(fromString: string, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        XCTAssertEqualWithAccuracy(dateFromString.timeIntervalSince1970, 0, accuracy: 60 * 60 * 24)
    }

    func testDateToString() {
        let dateToString = NSDate(timeIntervalSince1970: 0).toString(format: format)
        guard let dateFromString = NSDate(fromString: dateToString, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        XCTAssertEqualWithAccuracy(dateFromString.timeIntervalSince1970, 0, accuracy: 60 * 60 * 24)
    }

}

extension DateExtensionTests {

    func testComparable() {
        let date = NSDate()
        let future = NSDate(timeIntervalSinceNow: 1000)
        XCTAssertTrue(date < future)
        XCTAssertFalse(date > future)
        XCTAssertTrue(date == date)
    }

}
