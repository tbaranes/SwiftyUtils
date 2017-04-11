//
//  Created by Tom Baranes on 23/04/16.
//  Copyright © 2016 Tom Baranes. All rights reserved.
//

import XCTest
@testable import SwiftyUtils

final class DateExtensionTests: XCTestCase {

    var string = ""
    let format = "dd-mm-yyyy hh:mm:ss"

    override func setUp() {
        super.setUp()
        string = "01-01-1970 00:00:00"
    }

}

extension DateExtensionTests {

    func testDateFromString() {
        guard let dateFromString = Date(fromString: string, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        XCTAssertEqualWithAccuracy(dateFromString.timeIntervalSince1970, 0, accuracy: 60 * 60 * 24)
    }

    func testDateToString() {
        let dateToString = Date(timeIntervalSince1970: 0).toString(format: format)
        guard let dateFromString = Date(fromString: dateToString, format: format) else {
            XCTFail("Date From String Couldn't be initialized.")
            return
        }
        XCTAssertEqualWithAccuracy(dateFromString.timeIntervalSince1970, 0, accuracy: 60 * 60 * 24)
    }

}
